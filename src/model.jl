# src/model.jl

"""
    PGM_create_model(handle, system_frequency, input_dataset)

Create a new instance of Power Grid Model.

This is the main function to create a new model. You need to prepare the buffer data for input. The returned model need to be freed by [`PGM_destroy_model`](@ref)()

# Arguments
* `handle`:
* `system_frequency`: The frequency of the system, usually 50 or 60 Hz
* `input_dataset`: Pointer to an instance of [`PGM_ConstDataset`](@ref). It should have data type "input".
# Returns
The opaque pointer to the created model. If there are errors during the creation, a NULL is returned. Use [`PGM_error_code`](@ref)() and [`PGM_error_message`](@ref)() to check the error.
"""
function PGM_create_model(handle, system_frequency, input_dataset)
    ccall((:PGM_create_model, libpower_grid_model_c), Ptr{PGM_PowerGridModel}, (Ptr{PGM_Handle}, Cdouble, Ptr{PGM_ConstDataset}), handle, system_frequency, input_dataset)
end
#model = create_model(handle, 50.0f0, input_data)

#function PGM_create_model(handle::Ptr{Cvoid}, system_frequency::Cfloat, input_data::Ptr{PGM_ConstDataset})
#    model = ccall((:PGM_create_model, pgm_lib), Ptr{PGM_PowerGridModel}, (Ptr{Cvoid}, Cfloat, Ptr{PGM_ConstDataset}), handle, system_frequency, #input_data)
#    if model == C_NULL
#        err_code = ccall((:PGM_error_code, pgm_lib), Cint, (Ptr{Cvoid},), handle)
#        err_msg  = ccall((:PGM_error_message, pgm_lib), Cstring, (Ptr{Cvoid},), handle)
#        error("PGM_create_model failed (code=$err_code): $(unsafe_string(err_msg))")
#    end
#    return model
#end


"""
    PGM_update_model(handle, model, update_dataset)

Update the model by changing mutable attributes of some elements.

Use [`PGM_error_code`](@ref)() and [`PGM_error_message`](@ref)() to check if there are errors in the update. NOTE: The model will be in an undefined state after errors occured during the update and should be destroyed.

# Arguments
* `handle`:
* `model`: A pointer to an existing model.
* `update_dataset`: Pointer to an instance of [`PGM_ConstDataset`](@ref). It should have data type "update".
# Returns
"""
function PGM_update_model(handle, model, update_dataset)
    ccall((:PGM_update_model, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_PowerGridModel}, Ptr{PGM_ConstDataset}), handle, model, update_dataset)
end

"""
    PGM_copy_model(handle, model)

Make a copy of an existing model.

The returned model need to be freed by [`PGM_destroy_model`](@ref)()

# Arguments
* `handle`:
* `model`: A pointer to an existing model
# Returns
A opaque pointer to the new copy. If there are errors during the creation, a NULL is returned. Use [`PGM_error_code`](@ref)() and [`PGM_error_message`](@ref)() to check the error.
"""
function PGM_copy_model(handle, model)
    ccall((:PGM_copy_model, libpower_grid_model_c), Ptr{PGM_PowerGridModel}, (Ptr{PGM_Handle}, Ptr{PGM_PowerGridModel}), handle, model)
end

"""
    PGM_get_indexer(handle, model, component, size, ids, indexer)

Get the sequence numbers based on list of ids in a given component.

For example, if there are 5 nodes in the model with id [10, 2, 5, 15, 30]. We have a node ID list of [2, 5, 15, 5, 10, 10, 30]. We would like to know the sequence number of each element in the model. Calling this function should result in a sequence array of [1, 2, 3, 2, 0, 0, 4].

If you supply a non-existing ID in the ID array, an error will be raised. Use [`PGM_error_code`](@ref)() and [`PGM_error_message`](@ref)() to check the error.

# Arguments
* `handle`:
* `model`: A pointer to an existing model.
* `component`: A char const* string as component name.
* `size`: The size of the ID array.
* `ids`: A pointer to a #[`PGM_ID`](@ref) array buffer, this should be at least length of size.
* `indexer`: A pointer to a #[`PGM_Idx`](@ref) array buffer. The results will be written to this array. The array should be pre-allocated with at least length of size.
"""
function PGM_get_indexer(handle, model, component, size, ids, indexer)
    ccall((:PGM_get_indexer, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_PowerGridModel}, Ptr{Cchar}, PGM_Idx, Ptr{PGM_ID}, Ptr{PGM_Idx}), handle, model, component, size, ids, indexer)
end

"""
    PGM_calculate(handle, model, opt, output_dataset, batch_dataset)

Execute a one-time or batch calculation.

This is the main function to execute calculation. You can choose to execute one-time calculation or batch calculation, by controlling the batch\\_dataset argument. If batch\\_dataset == NULL, it is a one-time calculation. If batch\\_dataset != NULL, it is a batch calculation with batch update in the batch\\_dataset.

You need to pre-allocate all output buffer.

Use [`PGM_error_code`](@ref)() and [`PGM_error_message`](@ref)() to check the error.

# Arguments
* `handle`:
* `model`: A pointer to an existing model.
* `opt`: A pointer to options, you need to pre-set all the calculation options you want.
* `output_dataset`: A pointer to an instance of [`PGM_MutableDataset`](@ref). The dataset should have type "*\\_output", depending on the type of dataset. You need to pre-allocate all output memory buffers. You do not need to output all the component types as in the input. For example, you can choose only create output buffers for node, not for line.
* `batch_dataset`: A pointer to an instance of [`PGM_ConstDataset`](@ref) for batch calculation. Or NULL for single calculation. The dataset should have is\\_batch == true. The type of the dataset should be "update".
# Returns
"""
function PGM_calculate(handle, model, opt, output_dataset, batch_dataset)
    ccall((:PGM_calculate, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_PowerGridModel}, Ptr{PGM_Options}, Ptr{PGM_MutableDataset}, Ptr{PGM_ConstDataset}), handle, model, opt, output_dataset, batch_dataset)
end

"""
    PGM_destroy_model(model)

Destroy the model returned by [`PGM_create_model`](@ref)() or [`PGM_copy_model`](@ref)().

# Arguments
* `model`: The pointer to the model.
"""
function PGM_destroy_model(model)
    ccall((:PGM_destroy_model, libpower_grid_model_c), Cvoid, (Ptr{PGM_PowerGridModel},), model)
end
