"""
Testnet voor Power Grid Model: een lus, twee voedingen en een afgeschakeld deel.

Topologie (10,5 kV):

    [bron 31]                 [bron 32]
        |                         |
     knoop 1 ---- lijn 14 ---- knoop 4
        |                         |
     lijn 11                   lijn 13
        |                         |
     knoop 2 ---- lijn 12 ---- knoop 3
                                  |
                               lijn 15 (OPEN aan de kant van knoop 5)
                                  |
                               knoop 5 ---- lijn 16 ---- knoop 6

De ring 1-2-3-4 wordt van twee kanten gevoed.
Knoop 5 en 6 hebben geen voeding en moeten als niet-gevoed (energized = 0) uitkomen.
"""

from pathlib import Path

import numpy as np
from power_grid_model import (
    PowerGridModel,
    initialize_array,
    ComponentType,
    DatasetType,
    LoadGenType,
    CalculationMethod,
)
from power_grid_model.validation import assert_valid_input_data
from power_grid_model.utils import json_serialize_to_file

# --- Knopen (alle id's moeten uniek zijn over alle componenten heen) ---
node = initialize_array(DatasetType.input, ComponentType.node, 6)
node["id"] = [1, 2, 3, 4, 5, 6]
node["u_rated"] = 10.5e3

# --- Lijnen ---
line = initialize_array(DatasetType.input, ComponentType.line, 6)
line["id"] = [11, 12, 13, 14, 15, 16]
line["from_node"] = [1, 2, 3, 4, 3, 5]
line["to_node"] = [2, 3, 4, 1, 5, 6]
line["from_status"] = [1, 1, 1, 1, 1, 1]
line["to_status"] = [1, 1, 1, 1, 0, 1]  # lijn 15 open aan de kant van knoop 5
line["r1"] = [0.25, 0.30, 0.20, 0.35, 0.25, 0.30]  # ohm
line["x1"] = [0.20, 0.25, 0.15, 0.30, 0.20, 0.25]  # ohm
line["c1"] = 10e-6  # farad
line["tan1"] = 0.0
line["i_n"] = 1000.0  # ampere

# --- Belastingen ---
sym_load = initialize_array(DatasetType.input, ComponentType.sym_load, 4)
sym_load["id"] = [21, 22, 23, 24]
sym_load["node"] = [2, 3, 5, 6]
sym_load["status"] = 1
sym_load["type"] = LoadGenType.const_power
sym_load["p_specified"] = [2.0e6, 1.5e6, 0.5e6, 0.8e6]  # watt
sym_load["q_specified"] = [0.5e6, 0.3e6, 0.1e6, 0.2e6]  # var

# --- Voedingen ---
source = initialize_array(DatasetType.input, ComponentType.source, 2)
source["id"] = [31, 32]
source["node"] = [1, 4]
source["status"] = 1
source["u_ref"] = [1.00, 1.02]  # p.u.

input_data = {
    ComponentType.node: node,
    ComponentType.line: line,
    ComponentType.sym_load: sym_load,
    ComponentType.source: source,
}

# Controleer de invoer voordat we rekenen
assert_valid_input_data(input_data=input_data, symmetric=True)

# --- Loadflow ---
model = PowerGridModel(input_data=input_data)
output = model.calculate_power_flow(
    symmetric=True,
    error_tolerance=1e-8,
    max_iterations=20,
    calculation_method=CalculationMethod.newton_raphson,
)

# --- Resultaten tonen ---
np.set_printoptions(suppress=True)
print("Knopen:")
print(f"{'id':>4} {'gevoed':>7} {'u (p.u.)':>10} {'hoek (rad)':>11}")
for r in output[ComponentType.node]:
    print(f"{r['id']:>4} {r['energized']:>7} {r['u_pu']:>10.6f} {r['u_angle']:>11.6f}")

print("\nLijnen:")
print(f"{'id':>4} {'gevoed':>7} {'i_from (A)':>11} {'p_from (kW)':>12}")
for r in output[ComponentType.line]:
    print(f"{r['id']:>4} {r['energized']:>7} {r['i_from']:>11.3f} {r['p_from'] / 1e3:>12.3f}")

# --- Opslaan als JSON, om met je eigen build te vergelijken ---
json_serialize_to_file(Path("testnet_input.json"), input_data, dataset_type=DatasetType.input)
json_serialize_to_file(Path("testnet_output_python.json"), output, dataset_type=DatasetType.sym_output)
print("\nOpgeslagen: testnet_input.json en testnet_output_python.json")
