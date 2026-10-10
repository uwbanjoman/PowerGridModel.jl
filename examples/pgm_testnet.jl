# examples/pgm_testnet.jl
# Rekent testnet_input.json door met jouw eigen Power Grid Model-build via de C API
# en vergelijkt de uitkomsten met testnet_output_python.json (gemaakt door pgm_testnet.py).
#
# Pkg: ] add JSON3
# Draai dit in de map waar de twee JSON-bestanden staan

using PowerGridModel
using JSON3

const handle = PowerGridModel.PGM_create_handle()

println("PGM_version = ", unsafe_string(PowerGridModel.PGM_version()))

json_in = read("testnet_input.json", String)

# create input dataset from json_in
deser = PowerGridModel.PGM_create_deserializer_from_null_terminated_string(handle,json_in,0)
wds = PowerGridModel.PGM_deserializer_get_dataset(handle,deser)
info = PowerGridModel.PGM_dataset_writable_get_info(handle,wds)
ncomp = PowerGridModel.PGM_dataset_info_n_components(handle,info)

componenten = Tuple{String,Int64}[]
buffers = Ptr{Cvoid}[]

for i in 0:ncomp-1
    naam = unsafe_string(PowerGridModel.PGM_dataset_info_component_name(handle,info,i))
    n = PowerGridModel.PGM_dataset_info_total_elements(handle,info,i)
    push!(componenten, (naam, n))
    meta = PowerGridModel.PGM_meta_get_component_by_name(handle,"input",naam)
    buf = PowerGridModel.PGM_create_buffer(handle,meta,n)
    push!(buffers, buf)
    PowerGridModel.PGM_dataset_writable_set_buffer(handle, wds, naam, C_NULL, buf)
end

PowerGridModel.PGM_deserializer_parse_to_buffer(handle, deser)
cds = PowerGridModel.PGM_create_dataset_const_from_writable(handle, wds)
model = PowerGridModel.PGM_create_model(handle, 50.0, cds)
out = PowerGridModel.PGM_create_dataset_mutable(handle, "sym_output", 0, 1)

for (naam, n) in componenten
    meta = PowerGridModel.PGM_meta_get_component_by_name(handle,"sym_output", naam)
    buf = PowerGridModel.PGM_create_buffer(handle, meta, n)
    push!(buffers, buf)
    PowerGridModel.PGM_dataset_mutable_add_buffer(handle, out, naam, n, n, C_NULL, buf)
end

# set calculation options
opt = PowerGridModel.PGM_create_options(handle)
PowerGridModel.PGM_set_calculation_type(handle,opt,0)
PowerGridModel.PGM_set_calculation_method(handle,opt,1)
PowerGridModel.PGM_set_symmetric(handle,opt,1)
PowerGridModel.PGM_set_err_tol(handle,opt, 1e-8)
PowerGridModel.PGM_set_max_iter(handle,opt,20)

# calculate
PowerGridModel.PGM_calculate(handle, model, opt, out, C_NULL)

# create output dataset
cout = PowerGridModel.PGM_create_dataset_const_from_mutable(handle, out)
ser = PowerGridModel.PGM_create_serializer(handle,cout,0)
# create json output from output dataset
json_uit = unsafe_string(PowerGridModel.PGM_serializer_get_to_zero_terminated_string(handle, ser, 0, 2))
julia_pgm_data = JSON3.read(json_uit)

ref = JSON3.read(read("testnet_output_python.json", String))

# if the following result equals zero, the calculation outputs from the Julia version and the Python version are exactly the same.
maximum(
           abs(Float64(v) - Float64(r2[k])) / max(1.0, abs(Float64(v)))
           for (comp, rijen) in ref.data
           for (r1, r2) in zip(rijen, julia_pgm_data.data[comp])
           for (k, v) in pairs(r1) if v isa Number
)

for r in julia_pgm_data.data.node
    println(r.id, "  gevoed=", r.energized, "  u_pu=", r.u_pu, " angle (RAD) = ", r.u_angle)
end

for r in julia_pgm_data.data.line
    println(r.id, "  gevoed=", r.energized, " i_from (A) = ", r.i_from, " p_from (kW) = ", r.p_from/1000)
end
