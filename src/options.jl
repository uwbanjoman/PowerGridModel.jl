# Function to create options
function PGM_create_options(handle::Ptr{Cvoid})
    options = ccall((:PGM_create_options, pgm_lib), Ptr{PGM_Options}, (Ptr{Cvoid},), handle)
    if options == C_NULL
        error("Failed to create PowerGridModel options")
    end
    return options
end

# Function to destroy options
function PGM_destroy_options(options::Ptr{PGM_Options})
    ccall((:PGM_destroy_options, pgm_lib), Cvoid, (Ptr{Cvoid},), options)
end

function PGM_set_calculation_type(handle::Ptr{Cvoid}, options::Ptr{PGM_Options}, type::CalculationTtype)
    ccall((:PGM_set_calculation_type, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_Options}, PGM_Idx), handle, options, PGM_Idx(type))
end

function PGM_set_calculation_method(handle::Ptr{Cvoid}, options::Ptr{PGM_Options}, method::CalculationMethod)
    ccall((:PGM_set_calculation_method, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_Options}, PGM_Idx), handle, options, PGM_Idx(method))
end

function PGM_set_symmetric(handle::Ptr{Cvoid}, options::Ptr{PGM_Options}, sym::SymmetryType)
    ccall((:PGM_set_symmetric, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_Options}, PGM_Idx), handle, options, PGM_Idx(sym))
end

function PGM_set_err_tol(handle::Ptr{Cvoid}, options::Ptr{PGM_Options}, err_tol::Cfloat)
    ccall((:PGM_set_err_tol, pgm_lib),  Cvoid, (Ptr{Cvoid}, Ptr{PGM_Options}, Cfloat), handle, options, err_tol)
end

function PGM_set_max_iter(handle::Ptr{Cvoid}, options::Ptr{PGM_Options}, max_iter::PGM_Idx)
    ccall((:PGM_set_max_iter, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_Options}, PGM_Idx), handle, options, max_iter)
end

function PGM_set_threading(handle::Ptr{Cvoid}, options::Ptr{PGM_Options}, threading::PGM_Idx)
    ccall((:PGM_set_threading, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_Options}, PGM_Idx), handle, options, threading)
end

function PGM_set_short_circuit_voltage_scaling(handle::Ptr{Cvoid}, options::Ptr{PGM_Options}, short_circuit_voltage_scaling::PGM_Idx)
    ccall((:PGM_set_short_circuit_voltage_scaling, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_Options}, PGM_Idx), handle, options, short_circuit_voltage_scaling)
end

function PGM_set_tap_changing_strategy(handle::Ptr{Cvoid}, options::Ptr{PGM_Options}, tap_changing_strategy::TapChangingStrategy)
    ccall((:PGM_set_tap_changing_strategy, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_Options}, PGM_Idx), handle, options, PGM_Idx(tap_changing_strategy))
end

function PGM_set_experimental_features(handle::Ptr{Cvoid}, options::Ptr{PGM_Options}, experimental_features::PGM_Idx)
    ccall((:PGM_set_experimental_features, pgm_lib), Cvoid, (Ptr{Cvoid}, Ptr{PGM_Options}, PGM_Idx), handle, options, experimental_features)
end
