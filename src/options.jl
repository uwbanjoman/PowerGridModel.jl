# src/options.jl

"""
    PGM_create_options(handle)

Create an option instance.

The option is needed to run calculations. This function create a new option instance with the following default values: - calculation\\_type: PGM\\_power\\_flow - calculation\\_method: PGM\\_default\\_method - symmetric: 1 - err\\_tol: 1e-8 - max\\_iter: 20 - threading: -1 - short\\_circuit\\_voltage\\_scaling: PGM\\_short\\_circuit\\_voltage\\_scaling\\_maximum - experimental\\_features: PGM\\_experimental\\_features\\_disabled

# Arguments
* `handle`:
# Returns
The pointer to the option instance. Should be freed by [`PGM_destroy_options`](@ref)().
"""
function PGM_create_options(handle)
    ccall((:PGM_create_options, libpower_grid_model_c), Ptr{PGM_Options}, (Ptr{PGM_Handle},), handle)
end

"""
    PGM_destroy_options(opt)

Free an option instance.

# Arguments
* `opt`: The pointer to the option instance created by [`PGM_create_options`](@ref)().
"""
function PGM_destroy_options(opt)
    ccall((:PGM_destroy_options, libpower_grid_model_c), Cvoid, (Ptr{PGM_Options},), opt)
end

"""
    PGM_set_calculation_type(handle, opt, type)

Specify type of calculation.

# Arguments
* `handle`:
* `opt`: The pointer to the option instance.
* `type`: See #[`PGM_CalculationType`](@ref) .
"""
function PGM_set_calculation_type(handle, opt, type)
    ccall((:PGM_set_calculation_type, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_Options}, PGM_Idx), handle, opt, type)
end

"""
    PGM_set_calculation_method(handle, opt, method)

Specify method of calculation.

# Arguments
* `handle`:
* `opt`: The pointer to the option instance.
* `method`: See #[`PGM_CalculationMethod`](@ref) .
"""
function PGM_set_calculation_method(handle, opt, method)
    ccall((:PGM_set_calculation_method, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_Options}, PGM_Idx), handle, opt, method)
end

"""
    PGM_set_symmetric(handle, opt, sym)

Specify if we are calculating symmetrically or asymmetrically.

# Arguments
* `handle`:
* `opt`: The pointer to the option instance.
* `sym`: See #PGM\\_CalculationSymmetry . 1 for symmetric calculation; 0 for asymmetric calculation.
"""
function PGM_set_symmetric(handle, opt, sym)
    ccall((:PGM_set_symmetric, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_Options}, PGM_Idx), handle, opt, sym)
end

"""
    PGM_set_err_tol(handle, opt, err_tol)

Specify the error tolerance to stop iterations. Only applicable if using iterative method.

It is in terms of voltage deviation per iteration in p.u.

# Arguments
* `handle`:
* `opt`: The pointer to the option instance.
* `err_tol`: The relative votlage deviation tolerance.
"""
function PGM_set_err_tol(handle, opt, err_tol)
    ccall((:PGM_set_err_tol, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_Options}, Cdouble), handle, opt, err_tol)
end

"""
    PGM_set_max_iter(handle, opt, max_iter)

Specify maximum number of iterations. Only applicable if using iterative method.

# Arguments
* `handle`:
* `opt`: The pointer to the option instance.
* `max_iter`: The maximum number of iterations.
"""
function PGM_set_max_iter(handle, opt, max_iter)
    ccall((:PGM_set_max_iter, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_Options}, PGM_Idx), handle, opt, max_iter)
end

"""
    PGM_set_threading(handle, opt, threading)

Specify the multi-threading strategy. Only applicable for batch calculation.

# Arguments
* `handle`:
* `opt`: The pointer to the option instance.
* `threading`: The value of the threading setting. See below: - -1: No multi-threading, calculate sequentially. - 0: use number of machine available threads. - >0: specify number of threads you want to calculate in parallel.
"""
function PGM_set_threading(handle, opt, threading)
    ccall((:PGM_set_threading, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_Options}, PGM_Idx), handle, opt, threading)
end

"""
    PGM_set_short_circuit_voltage_scaling(handle, opt, short_circuit_voltage_scaling)

Specify the voltage scaling min/max for short circuit calculations

# Arguments
* `handle`:
* `opt`: pointer to option instance
* `short_circuit_voltage_scaling`: See #[`PGM_ShortCircuitVoltageScaling`](@ref)
"""
function PGM_set_short_circuit_voltage_scaling(handle, opt, short_circuit_voltage_scaling)
    ccall((:PGM_set_short_circuit_voltage_scaling, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_Options}, PGM_Idx), handle, opt, short_circuit_voltage_scaling)
end

"""
    PGM_set_tap_changing_strategy(handle, opt, tap_changing_strategy)

Specify the tap changing strategy for power flow calculations

# Arguments
* `handle`:
* `opt`: pointer to option instance
* `tap_changing_strategy`: See #[`PGM_TapChangingStrategy`](@ref)
"""
function PGM_set_tap_changing_strategy(handle, opt, tap_changing_strategy)
    ccall((:PGM_set_tap_changing_strategy, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_Options}, PGM_Idx), handle, opt, tap_changing_strategy)
end

"""
    PGM_set_experimental_features(handle, opt, experimental_features)

Enable/disable experimental features.

[Danger mode]

The behavior of experimental features may not be final and no stability guarantees are made to the users. Features marked as 'experimental' as well as the behavior of experimental functionality itself may change over time.

# Arguments
* `handle`:
* `opt`: pointer to option instance
* `experimental_features`: See #[`PGM_ExperimentalFeatures`](@ref)
"""
function PGM_set_experimental_features(handle, opt, experimental_features)
    ccall((:PGM_set_experimental_features, libpower_grid_model_c), Cvoid, (Ptr{PGM_Handle}, Ptr{PGM_Options}, PGM_Idx), handle, opt, experimental_features)
end
