# Function to create a handle
function create_handle()
    handle = ccall((:PGM_create_handle, pgm_lib), Ptr{Cvoid}, ())
    if handle == C_NULL
        error("Failed to create PowerGridModel handle")
    end
    return handle
end
# create_handle()

# Function to destroy a handle
function destroy_handle(handle::Ptr{Cvoid})
    ccall((:PGM_destroy_handle, pgm_lib), Cvoid, (Ptr{Cvoid},), handle)
end

function error_code(handle::Ptr{Cvoid})
    ccall((:PGM_error_code, pgm_lib), PGM_Idx, (Ptr{Cvoid},), handle)
end

function error_message(handle::Ptr{Cvoid})
    ccall((:PGM_error_message, pgm_lib), Cstring, (Ptr{Cvoid},), handle)
end

function n_failed_scenarios(handle::Ptr{Cvoid})
    ccall((:PGM_n_failed_scenarios, pgm_lib), PGM_Idx, (Ptr{Cvoid},), handle)
end

function failed_scenarios(handle::Ptr{Cvoid})
    ccall((:PGM_failed_scenarios, pgm_lib), Ptr{PGM_Idx}, (Ptr{Cvoid},), handle)
end

function batch_errors(handle::Ptr{Cvoid})
    ccall((:PGM_batch_errors, pgm_lib), Ptr{Ptr{Cchar}}, (Ptr{Cvoid},), handle)
end

function clear_error(handle::Ptr{Cvoid})
    ccall((:PGM_clear_error, pgm_lib), Cvoid, (Ptr{Cvoid},), handle)
end
