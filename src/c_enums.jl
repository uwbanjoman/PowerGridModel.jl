"""
    PGM_SerializationFormat

Enumeration of serialization types.
"""
@cenum PGM_SerializationFormat::UInt32 begin
    PGM_json = 0
    PGM_msgpack = 1
end

"""
    PGM_ShortCircuitVoltageScaling

Enumeration of short circuit voltage scaling.
"""
@cenum PGM_ShortCircuitVoltageScaling::UInt32 begin
    PGM_short_circuit_voltage_scaling_minimum = 0
    PGM_short_circuit_voltage_scaling_maximum = 1
end

@enum ComponentAttributeFilterOptions everything relevant
"""
    PGM_TapChangingStrategy

Enumeration of tap changing strategies.
"""
@cenum PGM_TapChangingStrategy::UInt32 begin
    PGM_tap_changing_strategy_disabled = 0
    PGM_tap_changing_strategy_any_valid_tap = 1
    PGM_tap_changing_strategy_min_voltage_tap = 2
    PGM_tap_changing_strategy_max_voltage_tap = 3
    PGM_tap_changing_strategy_fast_any_tap = 4
end

"""
    PGM_ExperimentalFeatures

Enumeration of experimental features.

[Danger mode]

The behavior of experimental features may not be final and no stability guarantees are made to the users. Which features (if any) are enabled in experimental mode may change over time.
"""
@cenum PGM_ExperimentalFeatures::UInt32 begin
    PGM_experimental_features_disabled = 0
    PGM_experimental_features_enabled = 1
end

"""
    PGM_CalculationType

Enumeration for calculation type.
"""
@cenum PGM_CalculationType::UInt32 begin
    PGM_power_flow = 0
    PGM_state_estimation = 1
    PGM_short_circuit = 2
end

"""
    PGM_CalculationMethod

Enumeration for calculation method.
"""
@cenum PGM_CalculationMethod::Int32 begin
    PGM_default_method = -128
    PGM_linear = 0
    PGM_newton_raphson = 1
    PGM_iterative_linear = 2
    PGM_iterative_current = 3
    PGM_linear_current = 4
    PGM_iec60909 = 5
end

"""
    PGM_SymmetryType

Enumeration for calculation and/or component symmetry
"""
@cenum PGM_SymmetryType::UInt32 begin
    PGM_asymmetric = 0
    PGM_symmetric = 1
end

"""
    PGM_ErrorCode

Enumeration of error codes.
"""
@cenum PGM_ErrorCode::UInt32 begin
    PGM_no_error = 0
    PGM_regular_error = 1
    PGM_batch_error = 2
    PGM_serialization_error = 3
end

"""
    PGM_CType

Enumeration of C basic data types.
"""
@cenum PGM_CType::UInt32 begin
    PGM_int32 = 0
    PGM_int8 = 1
    PGM_double = 2
    PGM_double3 = 3
end
