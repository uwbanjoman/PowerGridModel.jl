# src/buffer.jl
"""
    PGM_create_buffer(handle, component, size)

Create a buffer with certain size and component type.

You can use this function to allocate a (row-based) component buffer. You can also use your own allocation function to do that with size and alignment obtained from [`PGM_meta_component_size`](@ref)() and [`PGM_meta_component_alignment`](@ref)(). The buffer created by this function should be freed by [`PGM_destroy_buffer`](@ref)().

It is recommended to call [`PGM_buffer_set_nan`](@ref)() after you create an input or update buffer. In this way all the attributes will be set to NaN. Additionally, if there is a new optional attribute added in the future, compatibility with your code is guaranteed: that optional attribute will be set to NaN and the default value will be used.

# Arguments
* `handle`:
* `component`: A component pointer.
* `size`: The size of the buffer in terms of number of elements.
# Returns
A pointer to the buffer, or NULL if the input is invalid.
"""
function PGM_create_buffer(handle, component, size)
    ccall((:PGM_create_buffer, libpower_grid_model_c), Ptr{Cvoid}, (Ptr{PGM_Handle}, Ptr{PGM_MetaComponent}, PGM_Idx), handle, component, size)
end

"""
    PGM_destroy_buffer(ptr)

Destroy the buffer you created using [`PGM_create_buffer`](@ref)().

NOTE: Do not call this function on the buffer you created using your own function.

# Arguments
* `ptr`: The pointer to the buffer created using [`PGM_create_buffer`](@ref)().
"""
function PGM_destroy_buffer(ptr)
    ccall((:PGM_destroy_buffer, libpower_grid_model_c), Cvoid, (Ptr{Cvoid},), ptr)
end

"""
    PGM_buffer_set_nan(handle, component, ptr, buffer_offset, size)

Set all the attributes of a buffer to NaN.

# Arguments
* `handle`:
* `component`: A component pointer.
* `ptr`: pointer to buffer, created either by [`PGM_create_buffer`](@ref)() or your own function.
* `buffer_offset`: The offset in the buffer where you begin to set nan, in terms of number of elements.
* `size`: The size of the buffer in terms of number of elements.
"""
function PGM_buffer_set_nan(handle, component, ptr, buffer_offset, size)
    ccall((:PGM_buffer_set_nan, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_MetaComponent}, Ptr{Cvoid}, PGM_Idx, PGM_Idx), handle, component, ptr, buffer_offset, size)
end

"""
    PGM_buffer_set_value(handle, attribute, buffer_ptr, src_ptr, buffer_offset, size, src_stride)

Set value of a certain attribute from an array to the component buffer.

You can use this function to set value. You can also set value by proper pointer arithmetric and casting, using the offset information returned by [`PGM_meta_attribute_offset`](@ref)().

# Arguments
* `handle`:
* `attribute`: An attribute pointer.
* `buffer_ptr`: A pointer to the buffer.
* `src_ptr`: A pointer to the source array you want to retrieve the value from.
* `buffer_offset`: The offset in the buffer where you begin to set value, in terms of number of elements
* `size`: The size of the buffer in terms of number of elements.
* `src_stride`: The stride of the source array in bytes. You can set it to -1, the default stride of the size of the attribute type (like sizeof(double)). If you set it to a positive number, the i-th set-value will retrieve the source data at (void const*)((char const*)src\\_ptr + i * src\\_stride)
"""
function PGM_buffer_set_value(handle, attribute, buffer_ptr, src_ptr, buffer_offset, size, src_stride)
    ccall((:PGM_buffer_set_value, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_MetaAttribute}, Ptr{Cvoid}, Ptr{Cvoid}, PGM_Idx, PGM_Idx, PGM_Idx), handle, attribute, buffer_ptr, src_ptr, buffer_offset, size, src_stride)
end
# attribute = pgm.input_source_id_ptr()
# buffer_ptr = pgm.create_buffer(handle, pgm.input_source_ptr(), 0)
# src_ptr = pointer_from_objref(Ref(id))
# buffer_offset = pgm.PGM_Idx(pgm.meta_attribute_offset(handle,attribute)) # calculate_component_offset_by_idx(handle,"input","source",0) #The offset in the buffer where you begin to set value, in terms of number of elements i.e 1
# sizevalue = 1
# src_stride = stride(pgm.PGM_Idx.(id),1)
# source_id_ptr = pgm.buffer_set_value(handle,attribute,buffer_ptr,src_ptr,buffer_offset,sizevalue,src_stride)

"""
    PGM_buffer_get_value(handle, attribute, buffer_ptr, dest_ptr, buffer_offset, size, dest_stride)

Get value of a certain attribute from the component buffer to an array.

You can use this function to get value. You can also get value by proper pointer arithmetric and casting, using the offset information returned by [`PGM_meta_attribute_offset`](@ref)().

# Arguments
* `handle`:
* `attribute`: An attribute pointer.
* `buffer_ptr`: A pointer to the buffer.
* `dest_ptr`: A pointer to the destination array you want to save the value to.
* `buffer_offset`: The offset in the buffer where you begin to get value; in terms of number of elements.
* `size`: The size of the buffer in terms of number of elements.
* `dest_stride`: The stride of the destination array in bytes. You can set it to -1, the default stride of the size of the attribute type (like sizeof(double)). If you set it to a positive number, the i-th get-value will retrieve the source data at (void*)((char*)dest\\_ptr + i * dest\\_stride)
"""
function PGM_buffer_get_value(handle, attribute, buffer_ptr, dest_ptr, buffer_offset, size, dest_stride)
    ccall((:PGM_buffer_get_value, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_MetaAttribute}, Ptr{Cvoid}, Ptr{Cvoid}, PGM_Idx, PGM_Idx, PGM_Idx), handle, attribute, buffer_ptr, dest_ptr, buffer_offset, size, dest_stride)
end
