module PowerGridModel

using power_grid_model_c_jll
using CEnum: CEnum, @cenum
using Printf

const PGM_Idx = Int64
const PGM_ID = Int32

mutable struct PGM_PowerGridModel end
mutable struct PGM_Handle end
mutable struct PGM_Options end
mutable struct PGM_MetaAttribute end
mutable struct PGM_MetaComponent end
mutable struct PGM_MetaDataset end
mutable struct PGM_Serializer end
mutable struct PGM_Deserializer end
mutable struct PGM_ConstDataset end
mutable struct PGM_MutableDataset end
mutable struct PGM_WritableDataset end
mutable struct PGM_DatasetInfo end
mutable struct PGM_Logger end

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
