module PowerGridModel

using power_grid_model_c_jll
using CEnum: CEnum, @cenum
using Printf

const PGM_Idx = Int64
const PGM_ID = Int32

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
