function create_buffer(handle::Ptr{Cvoid}, component::Ptr{PGM_MetaComponent}, size::PGM_Idx)
    ccall((:PGM_create_buffer, pgm_lib), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{PGM_MetaComponent}, PGM_Idx), handle, component, size)
end

function destroy_buffer(ptr::Ptr{Cvoid})
    ccall((:PGM_destroy_buffer, pgm_lib), Cvoid, (Ptr{Cvoid},), ptr)
end

function buffer_set_nan(handle::Ptr{Cvoid}, component::Ptr{PGM_MetaComponent}, ptr::Ptr{Cvoid}, buffer_offset::PGM_Idx, size::PGM_Idx)
    ccall((:PGM_buffer_set_nan, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_MetaComponent}, Ptr{Cvoid}, PGM_Idx, PGM_Idx), handle, component, ptr, buffer_offset, size)
end

function buffer_set_value(handle::Ptr{Cvoid}, attribute::Ptr{PGM_MetaAttribute}, buffer_ptr::Ptr{Cvoid}, src_ptr::Ptr{Cvoid}, buffer_offset::PGM_Idx, size::PGM_Idx, src_stride::PGM_Idx)
    ccall((:PGM_buffer_set_value, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_MetaAttribute}, Ptr{Cvoid}, Ptr{Cvoid}, PGM_Idx, PGM_Idx, PGM_Idx), handle, attribute, buffer_ptr, src_ptr, buffer_offset, size, src_stride)
end

function buffer_get_value(handle::Ptr{Cvoid}, attribute::Ptr{PGM_MetaAttribute}, buffer_ptr::Ptr{Cvoid}, dest_ptr::Ptr{Cvoid}, buffer_offset::PGM_Idx, size::PGM_Idx, src_stride::PGM_Idx)
    ccall((:PGM_buffer_get_value, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_MetaAttribute}, Ptr{Cvoid}, Ptr{Cvoid}, PGM_Idx, PGM_Idx, PGM_Idx), handle, attribute, buffer_ptr, dest_ptr, buffer_offset, size, src_stride)
end
