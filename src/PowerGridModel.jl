module PowerGridModel

using power_grid_model_c_jll

include("basics.jl")
include("handle.jl")
include("buffer.jl")
include("metadata.jl")
include("dataset.jl")
include("model.jl")
include("options.jl")
include("serialization.jl")

function lib_pgm_location()
    power_grid_model_c_jll.libpower_grid_model_c
end

pgm_lib = lib_pgm_location()

end # module PowerGridModel
