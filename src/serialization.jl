
function create_deserializer_from_binary_buffer(handle::Ptr{Cvoid}, data_ptr::Ptr{UInt8}, size::PGM_Idx, serialization_format::PGM_Idx)
        ccall((:PGM_create_deserializer_from_binary_buffer, pgm_lib), Ptr{PGM_Deserializer}, (Ptr{Cvoid}, Ptr{UInt8}, PGM_Idx, PGM_Idx), handle, data_ptr, size, serialization_format)
    return deserializer
    end
    
    function create_deserializer_from_null_terminated_string(handle::Ptr{Cvoid}, data_string::Cstring, serialization_format::PGM_Idx)
        ccall((:PGM_create_deserializer_from_null_terminated_string, pgm_lib), Ptr{PGM_Deserializer}, (Ptr{Cvoid}, Cstring, PGM_Idx), handle, data_string, serialization_format)
    end

    function deserializer_get_dataset(handle::Ptr{Cvoid}, deserializer::Ptr{PGM_Deserializer})
        ccall((:PGM_deserializer_get_dataset, pgm_lib), Ptr{PGM_WritableDataset}, (Ptr{Cvoid}, Ptr{PGM_Deserializer}), handle, deserializer)
    end

    function deserializer_parse_to_buffer(handle::Ptr{Cvoid}, deserializer::Ptr{PGM_Deserializer})
        ccall((:PGM_deserializer_parse_to_buffer, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_Deserializer}), handle, deserializer)
    end

    function destroy_deserializer(deserializer::Ptr{PGM_Deserializer})
    ccall((:PGM_destroy_deserializer, pgm_lib), Cvoid, (Ptr{PGM_Deserializer},), deserializer)
    end

    function create_serializer(handle::Ptr{Cvoid}, dataset::Ptr{PGM_ConstDataset}, serialization_format::PGM_Idx)
        ccall((:PGM_create_serializer, pgm_lib), Ptr{PGM_Serializer}, (Ptr{Cvoid}, Ptr{PGM_ConstDataset}, PGM_Idx), handle, dataset, serialization_format)
    end
    # pgm.create_serializer(handle,dset_ptr,0)

    function serializer_get_to_binary_buffer(handle::Ptr{Cvoid}, serializer::Ptr{PGM_Serializer}, use_compact_list::PGM_Idx, data::Ptr{Cvoid}, size::PGM_Idx)
        ccall((:PGM_serializer_get_to_binary_buffer, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_Serializer}, PGM_Idx, Ptr{Ptr{Cchar}}, PGM_Idx), handle, serializer, use_compact_list, data, size)
    end

    function serializer_get_to_zero_terminated_string(handle::Ptr{Cvoid}, serializer::Ptr{PGM_Serializer}, use_compact_list::PGM_Idx, indent::PGM_Idx)
        ccall((:PGM_serializer_get_to_zero_terminated_string, pgm_lib), Ptr{Cchar}, (Ptr{Cvoid}, Ptr{PGM_Serializer}, PGM_Idx, PGM_Idx), handle, serializer, use_compact_list, indent)
    end

    function destroy_serializer(serializer::Ptr{PGM_Serializer})
        ccall((:PGM_destroy_serializer, pgm_lib), Cvoid, (Ptr{PGM_Serializer},), serializer)
    end
