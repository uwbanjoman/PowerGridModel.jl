function PGM_dataset_info_name(handle::Ptr{Cvoid}, info::Ptr{PGM_DatasetInfo})
    ccall((:PGM_dataset_info_name, pgm_lib), Cstring, (Ptr{Nothing}, Ptr{PGM_DatasetInfo}), handle, info)
end

function PGM_dataset_info_is_batch(handle::Ptr{Cvoid}, info::Ptr{PGM_DatasetInfo})
    ccall((:PGM_dataset_info_is_batch, pgm_lib), PGM_Idx, (Ptr{Cvoid}, Ptr{PGM_DatasetInfo}), handle, info)
end

function PGM_dataset_info_batch_size(handle::Ptr{Cvoid}, info::Ptr{PGM_DatasetInfo})
    ccall((:PGM_dataset_info_batch_size, pgm_lib), PGM_Idx, (Ptr{Cvoid}, Ptr{PGM_DatasetInfo}), handle, info)
end

function PGM_dataset_info_n_components(handle::Ptr{Cvoid}, info::Ptr{PGM_DatasetInfo})
    ccall((:PGM_dataset_info_n_components, pgm_lib), PGM_Idx, (Ptr{Cvoid}, Ptr{PGM_DatasetInfo}), handle, info)
end

function PGM_dataset_info_component_name(handle::Ptr{Cvoid}, info::Ptr{PGM_DatasetInfo}, component_idx::PGM_Idx)
    ccall((:PGM_dataset_info_component_name, pgm_lib), Cstring, (Ptr{Cvoid}, Ptr{PGM_DatasetInfo}, PGM_Idx), handle, info, component_idx)
end

function PGM_dataset_info_elements_per_scenario(handle::Ptr{Cvoid}, info::Ptr{PGM_DatasetInfo}, component_idx::PGM_Idx)
    ccall((:PGM_dataset_info_elements_per_scenario, pgm_lib), PGM_Idx, (Ptr{Cvoid}, Ptr{PGM_DatasetInfo}, PGM_Idx), handle, info, component_idx)
end

function PGM_dataset_info_total_elements(handle::Ptr{Cvoid}, info::Ptr{PGM_DatasetInfo}, component_idx::PGM_Idx)
    ccall((:PGM_dataset_info_total_elements, pgm_lib), PGM_Idx, (Ptr{Cvoid}, Ptr{PGM_DatasetInfo}, PGM_Idx), handle, info, component_idx)
end

function PGM_dataset_info_has_attribute_indications(handle::Ptr{Cvoid}, info::Ptr{PGM_DatasetInfo}, component_idx::PGM_Idx)
    ccall((:PGM_dataset_info_has_attribute_indications, pgm_lib), PGM_Idx, (Ptr{Cvoid}, Ptr{PGM_DatasetInfo}, PGM_Idx), handle, info, component_idx)
end

function PGM_dataset_info_n_attribute_indications(handle::Ptr{Cvoid}, info::Ptr{PGM_DatasetInfo}, component_idx::PGM_Idx)
    ccall((:PGM_dataset_info_n_attribute_indications, pgm_lib), PGM_Idx, (Ptr{Cvoid}, Ptr{PGM_DatasetInfo}, PGM_Idx), handle, info, component_idx)
end

function PGM_dataset_info_attribute_name(handle::Ptr{Cvoid}, info::Ptr{PGM_DatasetInfo}, component_idx::PGM_Idx, attribute_idx::PGM_Idx)
    ccall((:PGM_dataset_info_attribute_name, pgm_lib), Cstring, (Ptr{Cvoid}, Ptr{PGM_DatasetInfo}, PGM_Idx, PGM_Idx), handle, info, component_idx, attribute_idx)
end

function PGM_create_dataset_const(handle::Ptr{Cvoid}, dataset::String, is_batch::PGM_Idx, batch_size::PGM_Idx)
    ccall((:PGM_create_dataset_const, pgm_lib), Ptr{PGM_ConstDataset}, (Ptr{Cvoid}, Cstring, PGM_Idx, PGM_Idx), handle, Base.unsafe_convert(Cstring, dataset), is_batch, batch_size)
end

function PGM_create_dataset_const_from_writable(handle::Ptr{Cvoid}, writable_dataset::Cstring)
    ccall((:PGM_create_dataset_const_from_writable, pgm_lib), Ptr{PGM_ConstDataset}, (Ptr{Cvoid}, Cstring), handle, writable_dataset)
end

function PGM_create_dataset_const_from_mutable(handle::Ptr{Cvoid}, mutable_dataset::Cstring)
    ccall((:PGM_create_dataset_const_from_mutable, pgm_lib), Ptr{PGM_ConstDataset}, (Ptr{Cvoid}, Cstring), handle,  mutable_dataset)
end

function PGM_destroy_dataset_const(dataset::Ptr{PGM_ConstDataset})
    ccall((:PGM_destroy_dataset_const, pgm_lib), Cvoid, (Ptr{Cvoid},), dataset)
end

function PGM_dataset_const_add_buffer(handle::Ptr{Cvoid}, dataset::Ptr{PGM_ConstDataset}, component::String, elements_per_scenario::PGM_Idx, total_elements::PGM_Idx, indptr::Ptr{Cvoid}, data::Ptr{Cvoid})
    ccall((:PGM_dataset_const_add_buffer, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_ConstDataset}, Cstring, PGM_Idx, PGM_Idx, Ptr{Cvoid}, Ptr{Cvoid}), handle, dataset, Base.unsafe_convert(Cstring, component), elements_per_scenario, total_elements, indptr, data) # adjust data
end

function PGM_dataset_const_add_attribute_buffer(handle::Ptr{Cvoid}, dataset::Ptr{PGM_ConstDataset}, component::String, attribute::String, data::Ptr{Cvoid})
    ccall((:PGM_dataset_const_add_attribute_buffer, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_ConstDataset}, Cstring, Cstring, Ptr{Cvoid}), handle, dataset, Base.unsafe_convert(Cstring, component), Base.unsafe_convert(Cstring, attribute), Base.unsafe_convert(Ptr{Cvoid}, data)) #adjust data
end

function PGM_dataset_const_get_info(handle::Ptr{Cvoid}, dataset::Ptr{PGM_ConstDataset})
    ccall((:PGM_dataset_const_get_info, pgm_lib), Ptr{PGM_DatasetInfo}, (Ptr{Cvoid}, Ptr{PGM_ConstDataset}), handle, dataset)
end

function PGM_dataset_writable_get_info(handle::Ptr{Cvoid}, dataset::Ptr{PGM_WritableDataset})
    ccall((:PGM_dataset_writable_get_info, pgm_lib), Ptr{PGM_DatasetInfo}, (Ptr{Cvoid}, Ptr{PGM_WritableDataset}), handle, dataset)
end

function PGM_dataset_writable_set_buffer(handle::Ptr{Cvoid}, dataset::Ptr{PGM_WritableDataset}, component::Cstring, indptr::PGM_Idx, data::Ptr{Cvoid})
    ccall((:PGM_dataset_writable_set_buffer, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_WritableDataset}, Cstring, PGM_Idx, Ptr{Cvoid}), handle, dataset, component, indptr, data)
end

function PGM_dataset_writable_set_attribute_buffer(handle::Ptr{Cvoid}, dataset::Ptr{PGM_WritableDataset}, component::Cstring, attribute::Cstring, data::Ptr{Cvoid})
    ccall((:PGM_dataset_writable_set_attribute_buffer, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_WritableDataset}, Cstring, PGM_Idx, Ptr{Cvoid}), handle, dataset, component, attribute, data)
end

function PGM_create_dataset_mutable(handle::Ptr{Cvoid}, dataset::String, is_batch::PGM_Idx, batch_size::PGM_Idx)
    ccall((:PGM_create_dataset_mutable, pgm_lib), Ptr{PGM_MutableDataset}, (Ptr{Cvoid}, Cstring, PGM_Idx, PGM_Idx), handle, Base.unsafe_convert(Cstring, dataset), is_batch, batch_size)
end

function PGM_destroy_dataset_mutable(dataset::Ptr{PGM_MutableDataset})
    ccall((:PGM_destroy_dataset_mutable, pgm_lib), Cvoid, (Ptr{PGM_MutableDataset},), dataset)
end

function PGM_dataset_mutable_add_buffer(handle::Ptr{Cvoid}, dataset::Ptr{PGM_MutableDataset}, component::Cstring, elements_per_scenario::PGM_Idx, total_elements::PGM_Idx, indptr::Ptr{Cvoid}, data::Ptr{Cvoid})
    ccall((:PGM_dataset_mutable_add_buffer, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_MutableDataset}, Cstring, PGM_Idx, PGM_Idx, Ptr{Cvoid}, Ptr{Cvoid}), handle, dataset, component, elements_per_scenario, total_elements, indptr, data)
end

function PGM_dataset_mutable_add_attribute_buffer(handle::Ptr{Cvoid}, dataset::Ptr{PGM_MutableDataset}, component::Cstring, attribute::Cstring, data::Ptr{Cvoid})
    ccall((:PGM_dataset_mutable_add_attribute_buffer, pgm_data), Cvoid, (Ptr{Cvoid}, Ptr{PGM_MutableDataset}, Cstring, Cstring, Ptr{Cvoid}), handle, dataset, component, attribute, data)
end

function PGM_dataset_mutable_get_info(handle::Ptr{Cvoid}, dataset::Ptr{PGM_MutableDataset})
    ccall((:PGM_dataset_mutable_get_info, pgm_lib), Ptr{PGM_DatasetInfo}, (Ptr{Cvoid}, Ptr{PGM_MutableDataset}), handle, dataset)
end
