
function PGM_meta_n_datasets(handle::Ptr{Cvoid})
    ccall((:PGM_meta_n_datasets, pgm_lib), PGM_Idx, (Ptr{Cvoid},), handle)
end

function PGM_meta_get_dataset_by_idx(handle::Ptr{Cvoid}, dset_idx::PGM_Idx)
    ccall((:PGM_meta_get_dataset_by_idx, pgm_lib), Ptr{PGM_MetaDataset}, (Ptr{Cvoid}, PGM_Idx), handle, dset_idx)
end

function PGM_meta_get_dataset_by_name(handle::Ptr{Cvoid}, dataset::String)
    ccall((:PGM_meta_get_dataset_by_name, pgm_lib), Ptr{PGM_MetaDataset}, (Ptr{Cvoid}, Cstring), handle, Base.unsafe_convert(Cstring, dataset))
end

function PGM_meta_dataset_name(handle::Ptr{Cvoid}, dataset::Ptr{PGM_MetaDataset})
    ccall((:PGM_meta_dataset_name, pgm_lib), Cstring, (Ptr{Cvoid}, Ptr{PGM_MetaDataset}), handle, dataset)
end

function PGM_meta_n_components(handle::Ptr{Cvoid}, dataset::Ptr{PGM_MetaDataset})
    ccall((:PGM_meta_n_components, pgm_lib), PGM_Idx, (Ptr{Cvoid}, Ptr{PGM_MetaDataset}), handle, dataset)
end

function PGM_meta_get_component_by_idx(handle::Ptr{Cvoid}, dataset::Ptr{PGM_MetaDataset}, idx::PGM_Idx)
    ccall((:PGM_meta_get_component_by_idx, pgm_lib), Ptr{PGM_MetaComponent}, (Ptr{Cvoid}, Ptr{PGM_MetaDataset}, PGM_Idx), handle, dataset, idx)
end

function PGM_meta_get_component_by_name(handle::Ptr{Cvoid}, dataset::String, component::String)
    ccall((:PGM_meta_get_component_by_name, pgm_lib), Ptr{PGM_MetaComponent}, (Ptr{Cvoid}, Cstring, Cstring), handle, Base.unsafe_convert(Cstring, dataset), Base.unsafe_convert(Cstring, component))
end

function PGM_meta_component_name(handle::Ptr{Cvoid}, component::Ptr{PGM_MetaComponent})
    ccall((:PGM_meta_component_name, pgm_lib), Cstring, (Ptr{Cvoid}, Ptr{PGM_MetaComponent}), handle, component)
end

function PGM_meta_component_size(handle::Ptr{Cvoid}, component::Ptr{PGM_MetaComponent})
    ccall((:PGM_meta_component_size, pgm_lib), Csize_t, (Ptr{Cvoid}, Ptr{PGM_MetaComponent}), handle, component)
end

function PGM_meta_component_alignment(handle::Ptr{Cvoid}, component::Ptr{PGM_MetaComponent})
    ccall((:PGM_meta_component_alignment, pgm_lib), Csize_t, (Ptr{Cvoid}, Ptr{PGM_MetaComponent}), handle, component)
end

function PGM_meta_n_attributes(handle::Ptr{Cvoid}, component::Ptr{PGM_MetaComponent})
    ccall((:PGM_meta_n_attributes, pgm_lib), PGM_Idx, (Ptr{Cvoid}, Ptr{PGM_MetaComponent}), handle, component)
end

function PGM_meta_get_attribute_by_idx(handle::Ptr{Cvoid}, component::Ptr{PGM_MetaComponent}, idx::PGM_Idx)
    ccall((:PGM_meta_get_attribute_by_idx, pgm_lib), Ptr{PGM_MetaAttribute} , (Ptr{Cvoid}, Ptr{PGM_MetaComponent}, PGM_Idx), handle, component, idx)
end

function PGM_meta_get_attribute_by_name(handle::Ptr{Cvoid}, dataset::String, component::String, attribute::String)
    ccall((:PGM_meta_get_attribute_by_name, pgm_lib), Ptr{PGM_MetaAttribute}, (Ptr{Cvoid}, Cstring, Cstring, Cstring), handle, Base.unsafe_convert(Cstring, dataset), Base.unsafe_convert(Cstring, component), Base.unsafe_convert(Cstring, attribute))
end

function PGM_meta_attribute_name(handle::Ptr{Cvoid}, attribute::Ptr{PGM_MetaAttribute})
    ccall((:PGM_meta_attribute_name, pgm_lib), Cstring, (Ptr{Cvoid}, Ptr{PGM_MetaAttribute}), handle, attribute)
end

function PGM_meta_attribute_ctype(handle::Ptr{Cvoid}, attribute::Ptr{PGM_MetaAttribute})
    ccall((:PGM_meta_attribute_ctype, pgm_lib), PGM_Idx, (Ptr{Cvoid}, Ptr{PGM_MetaAttribute}), handle, attribute)
end

function PGM_meta_attribute_offset(handle::Ptr{Cvoid}, attribute::Ptr{PGM_MetaAttribute})
    ccall((:PGM_meta_attribute_offset, pgm_lib), Csize_t, (Ptr{Cvoid}, Ptr{PGM_MetaAttribute}), handle, attribute)
end

function PGM_is_little_endian(handle::Ptr{Cvoid})
    ccall((:PGM_is_little_endian, pgm_lib), Cint, (Ptr{Cvoid},), handle)
end
