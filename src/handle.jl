# src/handle.jl
"""
    PGM_create_handle()

Create a new handle.

A handle object is needed to store error information. If you run it in multi-threading at user side, each thread should have unique handle. The handle should be destroyed by [`PGM_destroy_handle`](@ref)().

# Returns
A pointer to the created handle.
"""
function PGM_create_handle()
    handle = ccall((:PGM_create_handle, libpower_grid_model_c), Ptr{PGM_Handle}, ())
    if handle == C_NULL
        error("Failed to create PowerGridModel handle")
    end
    return handle
end
# PowerGridModel.PGM_create_handle()

"""
    PGM_destroy_handle(handle)

Destroy the handle.

# Arguments
* `handle`: The pointer to the handle created by [`PGM_create_handle`](@ref)().
"""
function PGM_destroy_handle(handle)
    ccall((:PGM_destroy_handle, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle},), handle)
end

"""
    PGM_error_code(handle)

Get error code of last operation.

# Arguments
* `handle`: The pointer to the handle you just used for an operation.
# Returns
The error code, see #[`PGM_ErrorCode`](@ref) .
"""
function PGM_error_code(handle)
    ccall((:PGM_error_code, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle},), handle)
end

"""
    PGM_error_message(handle)

Get error message of last operation.

If the error code is PGM\\_batch\\_error. Use [`PGM_n_failed_scenarios`](@ref)(), [`PGM_failed_scenarios`](@ref)(), and [`PGM_batch_errors`](@ref)() to retrieve the detail.

# Arguments
* `handle`: The pointer to the handle you just used for an operation.
# Returns
A char const* poiner to a zero terminated string. The pointer is not valid if you execute another operation. You need to copy the string in your own data.
"""
function PGM_error_message(handle)
    ccall((:PGM_error_message, libpower_grid_model_c), Cstring, (Ptr{PGM_Handle},), handle)
end

"""
    PGM_n_failed_scenarios(handle)

Get the number of failed scenarios. Only applicable when you just executed a batch calculation.

# Arguments
* `handle`: The pointer to the handle you just used for a batch calculation.
# Returns
The number of failed scenarios.
"""
function PGM_n_failed_scenarios(handle)
    ccall((:PGM_n_failed_scenarios, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle},), handle)
end

"""
    PGM_failed_scenarios(handle)

Get the list of failed scenarios, Only applicable when you just execute a batch calculation.

# Arguments
* `handle`: The pointer to the handle you just used for a batch calculation.
# Returns
A pointer to a [`PGM_Idx`](@ref) array with length returned by [`PGM_n_failed_scenarios`](@ref)(). The pointer is not valid if you execute another operation. You need to copy the array in your own data.
"""
function PGM_failed_scenarios(handle)
    ccall((:PGM_failed_scenarios, libpower_grid_model_c), Ptr{PGM_Idx}, (Ptr{PGM_Handle},), handle)
end

"""
    PGM_batch_errors(handle)

Get the list of batch errors. Only applicable when you just execute a batch calculation.

# Arguments
* `handle`: The pointer to the handle you just used for a batch calculation.
# Returns
A pointer to a char const* array with length returned by [`PGM_n_failed_scenarios`](@ref)(). Each entry is a zero terminated string. The pointer is not valid if you execute another operation. You need to copy the array (and the string) in your own data.
"""
function PGM_batch_errors(handle)
    ccall((:PGM_batch_errors, libpower_grid_model_c), Ptr{Ptr{Cchar}}, (Ptr{PGM_Handle},), handle)
end

"""
    PGM_clear_error(handle)

Clear and reset the handle.

# Arguments
* `handle`: The pointer to the handle.
"""
function PGM_clear_error(handle)
    ccall((:PGM_clear_error, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle},), handle)
end

"""
    PGM_version()

Get the version of the Power Grid Model library.

# Returns
A pointer to a zero-terminated string representing the version.
"""
function PGM_version()
    ccall((:PGM_version, libpower_grid_model_c), Ptr{Cchar}, ())
end
