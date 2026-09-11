module PowerGridModel

using power_grid_model_c_jll
using CEnum: CEnum, @cenum
using Printf

const PGM_Idx = Int64
const PGM_ID = Int32

#function lib_pgm_location()
#    power_grid_model_c_jll.libpower_grid_model_c
#end

#pgm_lib = lib_pgm_location()

include("c_enums.jl")
include("basics.jl")
include("handle.jl")
include("buffer.jl")
include("metadata.jl")
include("dataset.jl")
include("model.jl")
include("options.jl")
include("serialization.jl")

end # module PowerGridModel
