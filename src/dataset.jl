# drc/dataset.jl

"""
    PGM_dataset_info_name(handle, info)

Get the name of the dataset.

# Arguments
* `handle`:
* `info`: A pointer to the info object.
# Returns
A pointer to null null-terminated string of the dataset name. The pointer is permanently valid.
"""
function PGM_dataset_info_name(handle, info)
    ccall((:PGM_dataset_info_name, libpower_grid_model_c), Ptr{Cchar}, (Ptr{PGM_Handle}, Ptr{PGM_DatasetInfo}), handle, info)
end
# dataset_info_name = pgm.dataset_info_name(handle, dataset_info)

"""
    PGM_dataset_info_is_batch(handle, info)

Get the flag whether the dataset is a batch dataset.

# Arguments
* `handle`:
* `info`: A pointer to the info object.
# Returns
1 if the dataset is a batch, 0 if it is not.
"""
function PGM_dataset_info_is_batch(handle, info)
    ccall((:PGM_dataset_info_is_batch, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle}, Ptr{PGM_DatasetInfo}), handle, info)
end
# is_batch = pgm.dataset_info_is_batch(handle, dataset_info)

"""
    PGM_dataset_info_batch_size(handle, info)

Get the batch size of the dataset.

# Arguments
* `handle`:
* `info`: A pointer to the info object.
# Returns
Size of the batch. For a single-dataset, the batch size is always 1.
"""
function PGM_dataset_info_batch_size(handle, info)
    ccall((:PGM_dataset_info_batch_size, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle}, Ptr{PGM_DatasetInfo}), handle, info)
end
# batch_size = pgm.dataset_info_batch_size(handle, dataset_info)

"""
    PGM_dataset_info_n_components(handle, info)

Get the number of components in the dataset.

# Arguments
* `handle`:
* `info`: A pointer to the info object.
# Returns
The number of components.
"""
function PGM_dataset_info_n_components(handle, info)
    ccall((:PGM_dataset_info_n_components, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle}, Ptr{PGM_DatasetInfo}), handle, info)
end
# pgm.dataset_info_n_components(handle,dataset_info)

"""
    PGM_dataset_info_component_name(handle, info, component_idx)

Get the name of i-th component.

# Arguments
* `handle`:
* `info`: A pointer to the info object.
* `component_idx`: The index number of the component.
# Returns
A pointer to the null-terminated string of the component name. The pointer is permanently valid.
"""
function PGM_dataset_info_component_name(handle, info, component_idx)
    ccall((:PGM_dataset_info_component_name, libpower_grid_model_c), Ptr{Cchar}, (Ptr{PGM_Handle}, Ptr{PGM_DatasetInfo}, PGM_Idx), handle, info, component_idx)
end
# dataset_info_component_name = unsafe_string(pgm.dataset_info_component_name(handle, dataset_info, 0))

"""
    PGM_dataset_info_elements_per_scenario(handle, info, component_idx)

Get the elements per scenario for the i-th component.

# Arguments
* `handle`:
* `info`: A pointer to the info object.
* `component_idx`: The index number of the component.
# Returns
Number of elements per scenario for that component, or -1 if the scenario is not uniform (different number per scenario).
"""
function PGM_dataset_info_elements_per_scenario(handle, info, component_idx)
    ccall((:PGM_dataset_info_elements_per_scenario, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle}, Ptr{PGM_DatasetInfo}, PGM_Idx), handle, info, component_idx)
end
# elements_per_scenario = pgm.dataset_info_elements_per_scenario(handle,dataset_info, 0)

"""
    PGM_dataset_info_total_elements(handle, info, component_idx)

Get the total number of elements for the i-th component.

# Arguments
* `handle`:
* `info`: A pointer to the info object.
* `component_idx`: The index number of the component.
# Returns
The total number of elements of that component. If the number of elements per scenario is uniform, this value must equal to [`PGM_dataset_info_batch_size`](@ref)() * [`PGM_dataset_info_elements_per_scenario`](@ref)().
"""
function PGM_dataset_info_total_elements(handle, info, component_idx)
    ccall((:PGM_dataset_info_total_elements, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle}, Ptr{PGM_DatasetInfo}, PGM_Idx), handle, info, component_idx)
end
# total_elements = pgm.dataset_info_total_elements(handle,dataset_info,0)

"""
    PGM_dataset_info_has_attribute_indications(handle, info, component_idx)

Return whether a component has attribute indications.

Attribute indications are used to indicate the presence of meaningful attributes for a certain component in the dataset. If it returns 1 for that component, you can create columnar data with only the indicated attributes. In this case, you are guaranteed that all information from the original serialized data will be retained for this component, i.e., you do not lose any meaningful information during the deserialization process. Otherwise, no such guarantees are made.

# Arguments
* `handle`:
* `info`: A pointer to the info object.
* `component_idx`: The index number of the component.
# Returns
1 if the component has attribute indications, 0 if it does not.
"""
function PGM_dataset_info_has_attribute_indications(handle, info, component_idx)
    ccall((:PGM_dataset_info_has_attribute_indications, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle}, Ptr{PGM_DatasetInfo}, PGM_Idx), handle, info, component_idx)
end
# pgm.dataset_info_has_attribute_indications(handle, dataset_info, 0)

"""
    PGM_dataset_info_n_attribute_indications(handle, info, component_idx)

Return the number of attribute indications for a component.

# Arguments
* `handle`:
* `info`: A pointer to the info object.
* `component_idx`: The index number of the component.
# Returns
The number of attribute indications for the component. It returns 0 if [`PGM_dataset_info_has_attribute_indications`](@ref)() returns zero.
"""
function PGM_dataset_info_n_attribute_indications(handle, info, component_idx)
    ccall((:PGM_dataset_info_n_attribute_indications, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle}, Ptr{PGM_DatasetInfo}, PGM_Idx), handle, info, component_idx)
end
# pgm.dataset_info_n_attribute_indications(handle,dataset_info, 0)
# if there are no attribute indication this function segfaults on

"""
    PGM_dataset_info_attribute_name(handle, info, component_idx, attribute_idx)

Return the name of the i-th attribute indication for a component.

# Arguments
* `handle`:
* `info`: A pointer to the info object.
* `component_idx`: The index number of the component.
* `attribute_idx`: The index number of attribute indication.
# Returns
A pointer to the null-terminated string of the attribute indication. The pointer has the same lifetime as the input info pointer. It is UB if [`PGM_dataset_info_has_attribute_indications`](@ref)() returns zero, or if attribute\\_idx is out of bounds.
"""
function PGM_dataset_info_attribute_name(handle, info, component_idx, attribute_idx)
    ccall((:PGM_dataset_info_attribute_name, libpower_grid_model_c), Ptr{Cchar}, (Ptr{PGM_Handle}, Ptr{PGM_DatasetInfo}, PGM_Idx, PGM_Idx), handle, info, component_idx, attribute_idx)
end
# pgm.dataset_info_attribute_name(handle, dataset_info, 0, 0)

"""
    PGM_create_dataset_const(handle, dataset, is_batch, batch_size)

Create an instance of [`PGM_ConstDataset`](@ref).

# Arguments
* `handle`:
* `dataset`: The name of the dataset.
* `is_batch`: 1 if the dataset is a batch, 0 if the dataset is single.
* `batch_size`: The size of the batch. For single datasets, this must be 1.
# Returns
A pointer to the created [`PGM_ConstDataset`](@ref), or NULL if errors occur. Check the handle for error. The instance must be freed by [`PGM_destroy_dataset_const`](@ref)().
"""
function PGM_create_dataset_const(handle, dataset, is_batch, batch_size)
    ccall((:PGM_create_dataset_const, libpower_grid_model_c), Ptr{PGM_ConstDataset}, (Ptr{PGM_Handle}, Ptr{Cchar}, PGM_Idx, PGM_Idx), handle, dataset, is_batch, batch_size)
end
# dataset_input = pgm.create_dataset_const(handle, "input", 0, 1)

"""
    PGM_create_dataset_const_from_writable(handle, writable_dataset)

Create an instance of [`PGM_ConstDataset`](@ref) from a [`PGM_WritableDataset`](@ref) They share the same buffer memory.

# Arguments
* `handle`:
* `writable_dataset`: pointer to an instance of [`PGM_WritableDataset`](@ref)
# Returns
A pointer to the created [`PGM_ConstDataset`](@ref), or NULL if errors occur. Check the handle for error. The instance must be freed by [`PGM_destroy_dataset_const`](@ref)().
"""
function PGM_create_dataset_const_from_writable(handle, writable_dataset)
    ccall((:PGM_create_dataset_const_from_writable, libpower_grid_model_c), Ptr{PGM_ConstDataset}, (Ptr{PGM_Handle}, Ptr{PGM_WritableDataset}), handle, writable_dataset)
end

"""
    PGM_create_dataset_const_from_mutable(handle, mutable_dataset)

Create an instance of [`PGM_ConstDataset`](@ref) from a [`PGM_MutableDataset`](@ref) They share the same buffer memory.

# Arguments
* `handle`:
* `mutable_dataset`: pointer to an instance of [`PGM_MutableDataset`](@ref)
# Returns
A pointer to the created [`PGM_ConstDataset`](@ref), or NULL if errors occur. Check the handle for error. The instance must be freed by [`PGM_destroy_dataset_const`](@ref)().
"""
function PGM_create_dataset_const_from_mutable(handle, mutable_dataset)
    ccall((:PGM_create_dataset_const_from_mutable, libpower_grid_model_c), Ptr{PGM_ConstDataset}, (Ptr{PGM_Handle}, Ptr{PGM_MutableDataset}), handle, mutable_dataset)
end

"""
    PGM_destroy_dataset_const(dataset)

Destroy an instance of [`PGM_ConstDataset`](@ref).

# Arguments
* `dataset`: The pointer to the [`PGM_ConstDataset`](@ref) created by [`PGM_create_dataset_const`](@ref)(), [`PGM_create_dataset_const_from_writable`](@ref)(), or [`PGM_create_dataset_const_from_mutable`](@ref)().
# Returns
"""
function PGM_destroy_dataset_const(dataset)
    ccall((:PGM_destroy_dataset_const, libpower_grid_model_c), Cvoid, (Ptr{PGM_ConstDataset},), dataset)
end

"""
    PGM_dataset_const_add_buffer(handle, dataset, component, elements_per_scenario, total_elements, indptr, data)

Add a component buffer to an instance of [`PGM_ConstDataset`](@ref).

# Arguments
* `handle`:
* `dataset`: The pointer to the [`PGM_ConstDataset`](@ref).
* `component`: The name of the component.
* `elements_per_scenario`: The number of the elements per scenario. If the component is uniform, elements\\_per\\_scenario must be >= 0 If the component is not uniform, elements\\_per\\_scenario must be -1
* `total_elements`: The total number of elements for all scenarios. If elements\\_per\\_scenario >= 0, we must have elements\\_per\\_scenario * batch\\_size = total\\_elements.
* `indptr`: A pointer to an array of indptr of a non-uniform component. If the component is uniform, indptr must be NULL. If the component is not uniform, indptr must point to an array of size (batch\\_size + 1). The values in the array must be not decreasing. And we must have indptr[0] = 0, indptr[batch\\_size] = total\\_elements.
* `data`: A void pointer to the row based buffer data or NULL for columnar data.
# Returns
"""
function PGM_dataset_const_add_buffer(handle, dataset, component, elements_per_scenario, total_elements, indptr, data)
    ccall((:PGM_dataset_const_add_buffer, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_ConstDataset}, Ptr{Cchar}, PGM_Idx, PGM_Idx, Ptr{PGM_Idx}, Ptr{Cvoid}), handle, dataset, component, elements_per_scenario, total_elements, indptr, data)
end

"""
    PGM_dataset_const_add_attribute_buffer(handle, dataset, component, attribute, data)

Add a attribute buffer to an instance of [`PGM_ConstDataset`](@ref)/component.

# Arguments
* `handle`:
* `dataset`: The pointer to the [`PGM_ConstDataset`](@ref).
* `component`: The name of the component.
* `attribute`: The name of the attribute.
* `data`: A void pointer to the buffer data.
# Returns
"""
function PGM_dataset_const_add_attribute_buffer(handle, dataset, component, attribute, data)
    ccall((:PGM_dataset_const_add_attribute_buffer, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_ConstDataset}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cvoid}), handle, dataset, component, attribute, data)
end
# dataset_input_add_attribute_buffer = pgm.dataset_const_add_attribute_buffer(handle, dataset_input, "source", "source_id", Ptr{Cvoid}(pointer_from_objref(data))

"""
    PGM_dataset_const_get_info(handle, dataset)

Get the dataset info of the instance [`PGM_ConstDataset`](@ref).

# Arguments
* `handle`:
* `dataset`: A pointer to the [`PGM_ConstDataset`](@ref).
# Returns
A pointer to the instance of [`PGM_DatasetInfo`](@ref). The pointer has the same lifetime as the input dataset pointer.
"""
function PGM_dataset_const_get_info(handle, dataset)
    ccall((:PGM_dataset_const_get_info, libpower_grid_model_c), Ptr{PGM_DatasetInfo}, (Ptr{PGM_Handle}, Ptr{PGM_ConstDataset}), handle, dataset)
end
# dataset_info = pgm.dataset_const_get_info(handle,dataset_input)

"""
    PGM_dataset_writable_get_info(handle, dataset)

Get the dataset info of the instance [`PGM_WritableDataset`](@ref).

# Arguments
* `handle`:
* `dataset`: A pointer to the [`PGM_WritableDataset`](@ref).
# Returns
A pointer to the instance of [`PGM_DatasetInfo`](@ref). The pointer has the same lifetime as the input dataset pointer.
"""
function PGM_dataset_writable_get_info(handle, dataset)
    ccall((:PGM_dataset_writable_get_info, libpower_grid_model_c), Ptr{PGM_DatasetInfo}, (Ptr{PGM_Handle}, Ptr{PGM_WritableDataset}), handle, dataset)
end

"""
    PGM_dataset_writable_set_buffer(handle, dataset, component, indptr, data)

Set buffer into the instance [`PGM_WritableDataset`](@ref).

# Arguments
* `handle`:
* `dataset`: A pointer to the [`PGM_WritableDataset`](@ref).
* `component`: The name of the component.
* `indptr`: A pointer to an array of indptr of a non-uniform component. If the component is uniform, indptr must be NULL. If the component is not uniform, indptr must point to an array of size (batch\\_size + 1).
* `data`: A void pointer to the row based buffer data or NULL for columnar data.
# Returns
"""
function PGM_dataset_writable_set_buffer(handle, dataset, component, indptr, data)
    ccall((:PGM_dataset_writable_set_buffer, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_WritableDataset}, Ptr{Cchar}, Ptr{PGM_Idx}, Ptr{Cvoid}), handle, dataset, component, indptr, data)
end

"""
    PGM_dataset_writable_set_attribute_buffer(handle, dataset, component, attribute, data)

Set buffer into the instance [`PGM_WritableDataset`](@ref).

# Arguments
* `handle`:
* `dataset`: A pointer to the [`PGM_WritableDataset`](@ref).
* `component`: The name of the component.
* `attribute`: The name of the attribute.
* `data`: A void pointer to the buffer data.
# Returns
"""
function PGM_dataset_writable_set_attribute_buffer(handle, dataset, component, attribute, data)
    ccall((:PGM_dataset_writable_set_attribute_buffer, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_WritableDataset}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cvoid}), handle, dataset, component, attribute, data)
end

#function PGM_create_dataset_mutable(handle::Ptr{Cvoid}, dataset::String, is_batch::PGM_Idx, batch_size::PGM_Idx)
#    ccall((:PGM_create_dataset_mutable, pgm_lib), Ptr{PGM_MutableDataset}, (Ptr{Cvoid}, Cstring, PGM_Idx, PGM_Idx), handle, Base.unsafe_convert(Cstring, dataset), is_batch, batch_size)
#end

"""
    PGM_create_dataset_mutable(handle, dataset, is_batch, batch_size)

Create an instance of [`PGM_MutableDataset`](@ref).

# Arguments
* `handle`:
* `dataset`: The name of the dataset.
* `is_batch`: 1 if the dataset is a batch, 0 if the dataset is single.
* `batch_size`: The size of the batch. For single datasets, this must be 1.
# Returns
A pointer to the created [`PGM_MutableDataset`](@ref), or NULL if errors occur. Check the handle for error. The instance must be freed by [`PGM_destroy_dataset_mutable`](@ref)().
"""
function PGM_create_dataset_mutable(handle, dataset, is_batch, batch_size)
    ccall((:PGM_create_dataset_mutable, libpower_grid_model_c), Ptr{PGM_MutableDataset}, (Ptr{PGM_Handle}, Ptr{Cchar}, PGM_Idx, PGM_Idx), handle, dataset, is_batch, batch_size)
end

"""
    PGM_destroy_dataset_mutable(dataset)

Destroy an instance of [`PGM_MutableDataset`](@ref).

# Arguments
* `dataset`: The pointer to the [`PGM_MutableDataset`](@ref) created by [`PGM_create_dataset_mutable`](@ref)().
# Returns
"""
function PGM_destroy_dataset_mutable(dataset)
    ccall((:PGM_destroy_dataset_mutable, libpower_grid_model_c), Cvoid, (Ptr{PGM_MutableDataset},), dataset)
end

"""
    PGM_dataset_mutable_add_buffer(handle, dataset, component, elements_per_scenario, total_elements, indptr, data)

Add a component buffer to an instance of [`PGM_MutableDataset`](@ref).

# Arguments
* `handle`:
* `dataset`: The pointer to the [`PGM_MutableDataset`](@ref).
* `component`: The name of the component.
* `elements_per_scenario`: The number of the elements per scenario. If the component is uniform, elements\\_per\\_scenario must be >= 0 If the component is not uniform, elements\\_per\\_scenario must be -1
* `total_elements`: The total number of elements for all scenarios. If elements\\_per\\_scenario >= 0, we must have elements\\_per\\_scenario * batch\\_size = total\\_elements.
* `indptr`: A pointer to an array of indptr of a non-uniform component. If the component is uniform, indptr must be NULL. If the component is not uniform, indptr must point to an array of size (batch\\_size + 1). The values in the array must be not decreasing. And we must have indptr[0] = 0, indptr[batch\\_size] = total\\_elements.
* `data`: A void pointer to the row based buffer data or NULL for columnar data.
# Returns
"""
function PGM_dataset_mutable_add_buffer(handle, dataset, component, elements_per_scenario, total_elements, indptr, data)
    ccall((:PGM_dataset_mutable_add_buffer, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_MutableDataset}, Ptr{Cchar}, PGM_Idx, PGM_Idx, Ptr{PGM_Idx}, Ptr{Cvoid}), handle, dataset, component, elements_per_scenario, total_elements, indptr, data)
end

"""
    PGM_dataset_mutable_add_attribute_buffer(handle, dataset, component, attribute, data)

Add a attribute buffer to an instance of [`PGM_MutableDataset`](@ref)/component.

# Arguments
* `handle`:
* `dataset`: The pointer to the [`PGM_MutableDataset`](@ref).
* `component`: The name of the component.
* `attribute`: The name of the attribute.
* `data`: A void pointer to the buffer data.
# Returns
"""
function PGM_dataset_mutable_add_attribute_buffer(handle, dataset, component, attribute, data)
    ccall((:PGM_dataset_mutable_add_attribute_buffer, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_MutableDataset}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cvoid}), handle, dataset, component, attribute, data)
end

"""
    PGM_dataset_mutable_get_info(handle, dataset)

Get the dataset info of the instance [`PGM_MutableDataset`](@ref).

# Arguments
* `handle`:
* `dataset`: A pointer to the [`PGM_MutableDataset`](@ref).
# Returns
A pointer to the instance of [`PGM_DatasetInfo`](@ref). The pointer has the same lifetime as the input dataset pointer.
"""
function PGM_dataset_mutable_get_info(handle, dataset)
    ccall((:PGM_dataset_mutable_get_info, libpower_grid_model_c), Ptr{PGM_DatasetInfo}, (Ptr{PGM_Handle}, Ptr{PGM_MutableDataset}), handle, dataset)
end

"""
    PGM_dataset_const_set_next_cartesian_product_dimension(handle, dataset, next_dataset)

Set the next const dataset as cartesian product dimension.

This function allows users to run a batch calculation with multiple dimensions of scenarios. The way users can archive this is to combine multiple batch datasets to create a multi-dimension batch calculation using a linked list pattern. The calculation core will interpret the combined dataset as a cartesian product on a linked list of all the scenarios. Each batch dataset in the linked list represents one dimension of the cartesian product.

# Arguments
* `handle`:
* `dataset`:
* `next_dataset`: The next dataset in the linked list.
"""
function PGM_dataset_const_set_next_cartesian_product_dimension(handle, dataset, next_dataset)
    ccall((:PGM_dataset_const_set_next_cartesian_product_dimension, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_ConstDataset}, Ptr{PGM_ConstDataset}), handle, dataset, next_dataset)
end
