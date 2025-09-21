# Function to create a model
function create_model(handle::Ptr{Cvoid}, system_frequency::Cfloat, input_data::Ptr{PGM_ConstDataset})
    model = ccall((:PGM_create_model, pgm_lib), Ptr{PGM_PowerGridModel}, (Ptr{Cvoid}, Cfloat, Ptr{PGM_ConstDataset}), handle, system_frequency, input_data)
    if model == C_NULL
        error("Failed to create PowerGridModel model")
    end
    return model
end

function update_model(handle::Ptr{Cvoid}, model::Ptr{PGM_PowerGridModel}, update_dataset::Ptr{PGM_ConstDataset})
    ccall((:PGM_update_model, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_PowerGridModel}, Ptr{PGM_ConstDataset}), handle, model, update_dataset)
end

function copy_model(handle::Ptr{Cvoid}, model::Ptr{PGM_PowerGridModel})
    ccall((:PGM_copy_model, pgm_lib), Ptr{PGM_PowerGridModel}, (Ptr{Cvoid}, Ptr{PGM_PowerGridModel}), handle, model)
end

function get_indexer(handle::Ptr{Cvoid}, model::Ptr{PGM_PowerGridModel}, component::Cstring, size::PGM_Idx, ids::Ptr{PGM_ID}, indexer::Ptr{PGM_Idx})
    ccall((:PGM_get_indexer, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_PowerGridModel}, Cstring, PGM_Idx, Ptr{PGM_ID}, Ptr{PGM_Idx}), handle, model, component, size, ids, indexer)
end

# Function to perform a calculation
function calculate(handle::Ptr{Cvoid}, model::Ptr{PGM_PowerGridModel}, opt::Ptr{PGM_Options}, output_dataset::Ptr{PGM_MutableDataset}, batch_dataset::Ptr{PGM_ConstDataset})
    result = ccall((:PGM_calculate, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_PowerGridModel}, Ptr{PGM_Options}, Ptr{PGM_MutableDataset}, Ptr{PGM_ConstDataset}), handle, model, opt, output_dataset, batch_dataset)
end

# Function to destroy a model
function destroy_model(model::Ptr{PGM_PowerGridModel})
    ccall((:PGM_destroy_model, pgm_lib), Cvoid, (Ptr{PGM_PowerGridModel},), model)
end
