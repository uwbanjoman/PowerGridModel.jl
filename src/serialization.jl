# ssrc/serialization.jl
"""
    PGM_create_deserializer_from_binary_buffer(handle, data, size, serialization_format)

Create a deserializer from binary buffer/byte stream.

# Arguments
* `handle`:
* `data`: The pointer to the byte stream.
* `size`: The size of the byte stream.
* `serialization_format`: The desired data format of the serialization. See #[`PGM_SerializationFormat`](@ref) .
# Returns
A pointer to the deserializer instance. Should be freed by [`PGM_destroy_deserializer`](@ref)(). Returns NULL if errors occured (check the handle for error information).
"""
function PGM_create_deserializer_from_binary_buffer(handle, data, size, serialization_format)
    ccall((:PGM_create_deserializer_from_binary_buffer, libpower_grid_model_c), Ptr{PGM_Deserializer}, (Ptr{PGM_Handle}, Ptr{Cchar}, PGM_Idx, PGM_Idx), handle, data, size, serialization_format)
end

"""
    PGM_create_deserializer_from_null_terminated_string(handle, data_string, serialization_format)

Create a deserializer from a null terminated C string.

# Arguments
* `handle`:
* `data_string`: The pointer to the null-terminated C string.
* `serialization_format`: The desired data format of the serialization. See #[`PGM_SerializationFormat`](@ref) .
# Returns
A pointer to the deserializer instance. Should be freed by [`PGM_destroy_deserializer`](@ref)(). Returns NULL if errors occured (check the handle for error information).
"""
function PGM_create_deserializer_from_null_terminated_string(handle, data_string, serialization_format)
    ccall((:PGM_create_deserializer_from_null_terminated_string, libpower_grid_model_c), Ptr{PGM_Deserializer}, (Ptr{PGM_Handle}, Ptr{Cchar}, PGM_Idx), handle, data_string, serialization_format)
end

"""
    PGM_deserializer_get_dataset(handle, deserializer)

Get the [`PGM_WritableDataset`](@ref) object from the deserializer.

# Arguments
* `handle`:
* `deserializer`: The pointer to the deserializer.
# Returns
A pointer the instance of [`PGM_WritableDataset`](@ref). The pointer has the same lifetime as the deserializer. Use PGM\\_writable\\_dataset\\_get\\_info() to get the information of the dataset. Use PGM\\_writable\\_dataset\\_set\\_buffer() to set buffer.
"""
function PGM_deserializer_get_dataset(handle, deserializer)
    ccall((:PGM_deserializer_get_dataset, libpower_grid_model_c), Ptr{PGM_WritableDataset}, (Ptr{PGM_Handle}, Ptr{PGM_Deserializer}), handle, deserializer)
end

"""
    PGM_deserializer_parse_to_buffer(handle, deserializer)

Parse the dataset and write to the user-provided buffers. The buffers must be set through PGM\\_writable\\_dataset\\_set\\_buffer().

# Arguments
* `handle`:
* `deserializer`: The pointer to the deserializer
# Returns
No return value; check handle for error.
"""
function PGM_deserializer_parse_to_buffer(handle, deserializer)
    ccall((:PGM_deserializer_parse_to_buffer, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_Deserializer}), handle, deserializer)
end

"""
    PGM_destroy_deserializer(deserializer)

Destory deserializer

# Arguments
* `deserializer`: pointer to deserializer
# Returns
"""
function PGM_destroy_deserializer(deserializer)
    ccall((:PGM_destroy_deserializer, libpower_grid_model_c), Cvoid, (Ptr{PGM_Deserializer},), deserializer)
end

"""
    PGM_create_serializer(handle, dataset, serialization_format)

Create a serializer object based on input dataset, the buffers must be set in advance.

# Arguments
* `handle`:
* `dataset`: A pointer to an instance of [`PGM_ConstDataset`](@ref)
* `serialization_format`: The desired data format of the serialization. See #[`PGM_SerializationFormat`](@ref) .
# Returns
A pointer to the new serializer object. Should be freed by [`PGM_destroy_serializer`](@ref)() Returns NULL if errors occured (check the handle for error information).
"""
function PGM_create_serializer(handle, dataset, serialization_format)
    ccall((:PGM_create_serializer, libpower_grid_model_c), Ptr{PGM_Serializer}, (Ptr{PGM_Handle}, Ptr{PGM_ConstDataset}, PGM_Idx), handle, dataset, serialization_format)
end
# pgm.create_serializer(handle,dset_ptr,0)

"""
    PGM_serializer_get_to_binary_buffer(handle, serializer, use_compact_list, data, size)

Serialize the dataset into a binary buffer format.

# Arguments
* `handle`:
* `serializer`: A pointer to an existing serializer.
* `use_compact_list`: 1 for use compact list per element of serialization; 0 for use dictionary per element.
* `data`: Output argument: the data pointer of the packed buffer will be written to *data.
* `size`: Output argument: the length of the packed buffer will be written to *size.
# Returns
No return value; check handle for error.
"""
function PGM_serializer_get_to_binary_buffer(handle, serializer, use_compact_list, data, size)
    ccall((:PGM_serializer_get_to_binary_buffer, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_Serializer}, PGM_Idx, Ptr{Ptr{Cchar}}, Ptr{PGM_Idx}), handle, serializer, use_compact_list, data, size)
end

"""
    PGM_serializer_get_to_zero_terminated_string(handle, serializer, use_compact_list, indent)

Serialize the dataset into a zero terminated C string. Only supported for uncompressed data formats.

# Arguments
* `handle`:
* `serializer`: A pointer to an existing serializer.
* `use_compact_list`: 1 for use compact list per element of serialization; 0 for use dictionary per element.
* `indent`: The indentation of the JSON, use -1 for no indent and no new line (compact format).
# Returns
A NULL-terminated json string. Returns NULL if errors occured (check the handle for error information).
"""
function PGM_serializer_get_to_zero_terminated_string(handle, serializer, use_compact_list, indent)
    ccall((:PGM_serializer_get_to_zero_terminated_string, libpower_grid_model_c), Ptr{Cchar}, (Ptr{PGM_Handle}, Ptr{PGM_Serializer}, PGM_Idx, PGM_Idx), handle, serializer, use_compact_list, indent)
end

"""
    PGM_destroy_serializer(serializer)

Destroy serializer.

# Arguments
* `serializer`: The pointer to the serializer.
# Returns
"""
function PGM_destroy_serializer(serializer)
    ccall((:PGM_destroy_serializer, libpower_grid_model_c), Cvoid, (Ptr{PGM_Serializer},), serializer)
end
