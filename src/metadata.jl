# src/metadata.jl
"""
    PGM_meta_n_datasets(handle)

Get number of datasets.

# Arguments
* `handle`:
# Returns
The number of datasets.
"""
function PGM_meta_n_datasets(handle)
    ccall((:PGM_meta_n_datasets, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle},), handle)
end
# PGM_PGM_meta_n_datasets(handle)

"""
    PGM_meta_get_dataset_by_idx(handle, idx)

Get pointer of idx-th dataset.

# Arguments
* `handle`:
* `idx`: The sequence number, should be between [0, [`PGM_meta_n_datasets`](@ref)()).
# Returns
The pointer to the idx-th dataset. The pointer is permanantly valid. Or a NULL if your input is out of bound.
"""
function PGM_meta_get_dataset_by_idx(handle, idx)
    ccall((:PGM_meta_get_dataset_by_idx, libpower_grid_model_c), Ptr{PGM_MetaDataset}, (Ptr{PGM_Handle}, PGM_Idx), handle, idx)
end
# metadataset = pgm.PGM_meta_get_dataset_by_idx(handle, 0)

"""
    PGM_meta_get_dataset_by_name(handle, dataset)

Get pointer of dataset by name.

# Arguments
* `handle`:
* `dataset`: The name of the dataset.
# Returns
The pointer to the dataset with that name. The pointer is permanantly valid. Or a NULL if your input is out of bound.
"""
function PGM_meta_get_dataset_by_name(handle, dataset)
    ccall((:PGM_meta_get_dataset_by_name, libpower_grid_model_c), Ptr{PGM_MetaDataset}, (Ptr{PGM_Handle}, Ptr{Cchar}), handle, dataset)
end
# pgm.PGM_meta_get_dataset_by_name(handle, "input")

"""
    PGM_meta_dataset_name(handle, dataset)

Get name of the dataset.

# Arguments
* `handle`:
* `dataset`: The pointer to a dataset object.
# Returns
The name of the dataset in a char const*. The pointer is permanantly valid.
"""
function PGM_meta_dataset_name(handle, dataset)
    ccall((:PGM_meta_dataset_name, libpower_grid_model_c), Ptr{Cchar}, (Ptr{PGM_Handle}, Ptr{PGM_MetaDataset}), handle, dataset)
end
# unsafe_string(pgm.PGM_meta_dataset_name(handle, pgm.PGMmeta_get_dataset_by_name(handle, "input")))

"""
    PGM_meta_n_components(handle, dataset)

Get the number of components for a dataset.

# Arguments
* `handle`:
* `dataset`: The pointer to the dataset.
# Returns
Number of components.
"""
function PGM_meta_n_components(handle, dataset)
    ccall((:PGM_meta_n_components, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle}, Ptr{PGM_MetaDataset}), handle, dataset)
end
# pgm.PGM_meta_n_components(handle, metadataset)

"""
    PGM_meta_get_component_by_idx(handle, dataset, idx)

Get pointer of idx-th component of a dataset.

# Arguments
* `handle`:
* `dataset`: The pointer to the dataset.
* `idx`: The sequence number, should be between [0, [`PGM_meta_n_components`](@ref)()).
# Returns
The pointer to the idx-th component. The pointer is permanantly valid. Or a NULL if your input is out of bound.
"""
function PGM_meta_get_component_by_idx(handle, dataset, idx)
    ccall((:PGM_meta_get_component_by_idx, libpower_grid_model_c), Ptr{PGM_MetaComponent}, (Ptr{PGM_Handle}, Ptr{PGM_MetaDataset}, PGM_Idx), handle, dataset, idx)
end
# pgm.PGM_meta_get_component_by_idx(handle, metadataset, 15)

"""
    PGM_meta_get_component_by_name(handle, dataset, component)

Get pointer of a component by name.

# Arguments
* `handle`:
* `dataset`: The name of the dataset.
* `component`: The name of the component.
# Returns
The pointer to the component with that name. The pointer is permanantly valid. Or a NULL if your input is out of bound.
"""
function PGM_meta_get_component_by_name(handle, dataset, component)
    ccall((:PGM_meta_get_component_by_name, libpower_grid_model_c), Ptr{PGM_MetaComponent}, (Ptr{PGM_Handle}, Ptr{Cchar}, Ptr{Cchar}), handle, dataset, component)
end
# for example: 
# metacomponent = pgm.PGM_meta_get_component_by_name(handle, "input", "asym_line")
# metacomponent = pgm.PGM_meta_get_component_by_name(handle, "sym_output", "node")

"""
    PGM_meta_component_name(handle, component)

Get name of component.

# Arguments
* `handle`:
* `component`: The pointer to the component.
# Returns
The name of the component in a char const*. The pointer is permanantly valid.
"""
function PGM_meta_component_name(handle, component)
    ccall((:PGM_meta_component_name, libpower_grid_model_c), Ptr{Cchar}, (Ptr{PGM_Handle}, Ptr{PGM_MetaComponent}), handle, component)
end
# component_name = pgm.PGM_meta_component_name(handle, metacomponent)

"""
    PGM_meta_component_size(handle, component)

Get size of the component.

# Arguments
* `handle`:
* `component`: The pointer to the component.
# Returns
Size of the component.
"""
function PGM_meta_component_size(handle, component)
    ccall((:PGM_meta_component_size, libpower_grid_model_c), Csize_t, (Ptr{PGM_Handle}, Ptr{PGM_MetaComponent}), handle, component)
end
# comp_size = pgm.PGM_meta_component_size(handle, metacomponent)

"""
    PGM_meta_component_alignment(handle, component)

Get alignment of the component.

# Arguments
* `handle`:
* `component`: The pointer to the component.
# Returns
Alignment of the component.
"""
function PGM_meta_component_alignment(handle, component)
    ccall((:PGM_meta_component_alignment, libpower_grid_model_c), Csize_t, (Ptr{PGM_Handle}, Ptr{PGM_MetaComponent}), handle, component)
end
# comp_align = pgm.PGM_meta_component_alignment(handle, metacomponent)

"""
    PGM_meta_n_attributes(handle, component)

Get number of attributes of the component.

# Arguments
* `handle`:
* `component`: The pointer to the component.
# Returns
Number of attributes.
"""
function PGM_meta_n_attributes(handle, component)
    ccall((:PGM_meta_n_attributes, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle}, Ptr{PGM_MetaComponent}), handle, component)
end
# n_attribs = pgm.PGM_meta_n_attributes(handle, metacomponent)

"""
    PGM_meta_get_attribute_by_idx(handle, component, idx)

Get pointer of idx-th attribute of a component.

# Arguments
* `handle`:
* `component`: The pointer to the component.
* `idx`: The sequence number, should be between [0, [`PGM_meta_n_attributes`](@ref)())
# Returns
The pointer to the idx-th attribute. The pointer is permanantly valid. Or a NULL if your input is out of bound.
"""
function PGM_meta_get_attribute_by_idx(handle, component, idx)
    ccall((:PGM_meta_get_attribute_by_idx, libpower_grid_model_c), Ptr{PGM_MetaAttribute}, (Ptr{PGM_Handle}, Ptr{PGM_MetaComponent}, PGM_Idx), handle, component, idx)
end
# metaattribute = pgm.PGM_meta_get_attribute_by_idx(handle, metacomponent, 1)

"""
    PGM_meta_get_attribute_by_name(handle, dataset, component, attribute)

Get pointer of a attribute by name.

# Arguments
* `handle`:
* `dataset`: The name of the dataset.
* `component`: The name of the component.
* `attribute`: The name of the attribute.
# Returns
The pointer to the component with that name. The pointer is permanantly valid. Or a NULL if your input is out of bound.
"""
function PGM_meta_get_attribute_by_name(handle, dataset, component, attribute)
    ccall((:PGM_meta_get_attribute_by_name, libpower_grid_model_c), Ptr{PGM_MetaAttribute}, (Ptr{PGM_Handle}, Ptr{Cchar}, Ptr{Cchar}, Ptr{Cchar}), handle, dataset, component, attribute)
end
# attribs_by_name = pgm.meta_get_attribute_by_name(handle, "input", "source", "id")

"""
    PGM_meta_attribute_name(handle, attribute)

Get attribute name.

# Arguments
* `handle`:
* `attribute`: The pointer to attribute.
# Returns
The name of the attribute in char const*. The pointer is permanantly valid.
"""
function PGM_meta_attribute_name(handle, attribute)
    ccall((:PGM_meta_attribute_name, libpower_grid_model_c), Ptr{Cchar}, (Ptr{PGM_Handle}, Ptr{PGM_MetaAttribute}), handle, attribute)
end
# attribname = pgm.meta_attribute_name(handle, metaattribute)

"""
    PGM_meta_attribute_ctype(handle, attribute)

Get the type of an attribute.

# Arguments
* `handle`:
* `attribute`: The pointer to attribute.
# Returns
The type of the attribute as in enum [`PGM_CType`](@ref).
"""
function PGM_meta_attribute_ctype(handle, attribute)
    ccall((:PGM_meta_attribute_ctype, libpower_grid_model_c), PGM_Idx, (Ptr{PGM_Handle}, Ptr{PGM_MetaAttribute}), handle, attribute)
end
# attribs_ctype = pgm.meta_attribute_ctype(handle,metaattribute)

"""
    PGM_meta_attribute_offset(handle, attribute)

Get the offset of an attribute in a component.

# Arguments
* `handle`:
* `attribute`: The pointer to attribute.
# Returns
The offset of this attribute.
"""
function PGM_meta_attribute_offset(handle, attribute)
    ccall((:PGM_meta_attribute_offset, libpower_grid_model_c), Csize_t, (Ptr{PGM_Handle}, Ptr{PGM_MetaAttribute}), handle, attribute)
end
# attribs_offset = pgm.PGM_meta_attribute_offset(handle,metaattribute)

"""
    PGM_is_little_endian(handle)

Get whether the system is little endian.

# Arguments
* `handle`:
# Returns
1 if the system is litten endian; 0 if the system is big endian.
"""
function PGM_is_little_endian(handle)
    ccall((:PGM_is_little_endian, libpower_grid_model_c), Cint, (Ptr{PGM_Handle},), handle)
end
# is_little_endian = pgm.is_little_endian(handle)

# ========
# below are non power_grid_model_c API functions
# ========

function dataset_names(handle::Ptr{PGM_Handle})
    n = PGM_meta_n_datasets(handle)
    names = Vector{Symbol}(undef, n)
    for i in 0:(n - 1)
        ds = PGM_meta_get_dataset_by_idx(handle, PGM_Idx(i))
        names[i + 1] = Symbol(unsafe_string(PGM_meta_dataset_name(handle, ds)))
    end
    return names
end

function get_dataset(handle::Ptr{Cvoid}, dset_idx::Int64)
    metadataset = meta_get_dataset_by_idx(handle, dset_idx)
    metadataset
end
# meta_dataset_input = get_dataset(handle, 0)

function get_n_components(handle::Ptr{Cvoid}, dset_idx::Int64)
    n_components = PGM_meta_n_components(handle, PGM_meta_get_dataset_by_idx(handle, dset_idx))
    n_components
end
# meta_n_comps = get_n_components(handle,0)

function get_component(handle::Ptr{Cvoid}, dset_idx::Int64, comp_idx::Int64)
    metacomponent = PGM_meta_get_component_by_idx(handle, PGM_meta_get_dataset_by_idx(handle, dset_idx), comp_idx)
    metacomponent
end
# meta_component = get_component(handle, 0, 0)

function get_comp_name(handle::Ptr{Cvoid}, dset_idx::Int64, comp_idx::Int64)
    # Meestal heet deze meta_component_name in de C-API
    name_ptr = ccall((:PGM_meta_component_name, pgm.pgm_lib), 
                     Cstring, (Ptr{Cvoid}, Ptr{Cvoid}), 
                     handle, get_component(handle, dset_idx, comp_idx))
    return unsafe_string(name_ptr)
end
# meta_comp_name = pgm.get_comp_name(handle, 0, 15)

function get_comp_alignment(handle::Ptr{Cvoid}, dset_idx::Int64, comp_idx::Int64)
    comp_alignment = meta_component_alignment(handle, PGM_meta_get_component_by_idx(handle, PGM_meta_get_dataset_by_idx(handle, dset_idx), comp_idx))
    comp_alignment
end
# meta_comp_alignment = get_comp_alignment(handle, 0, 0)

function get_comp_size(handle::Ptr{Cvoid}, dset_idx::Int64, comp_idx::Int64)
    comp_size = meta_component_size(handle, PGM_meta_get_component_by_idx(handle, PGM_meta_get_dataset_by_idx(handle, dset_idx), comp_idx))
    comp_size
end
# meta_comp_size = get_comp_size(handle, 0, 0)

function get_n_attribs(handle::Ptr{Cvoid}, dset_idx::Int64, comp_idx::Int64)
    n_attribs = meta_n_attributes(handle, PGM_meta_get_component_by_idx(handle, PGM_meta_get_dataset_by_idx(handle, dset_idx), comp_idx))
    n_attribs
end
# meta_n_attribs = get_n_attribs(handle, 0, 0)

function get_attrib_ctype(handle::Ptr{Cvoid}, dset_idx::Int64, comp_idx::Int64, attr_idx::Int64)
    attribs_ctype = meta_attribute_ctype(handle, PGM_meta_get_attribute_by_idx(handle, PGM_meta_get_component_by_idx(handle, meta_get_dataset_by_idx(handle, dset_idx), comp_idx), attr_idx))
    attribs_ctype
end
# meta_n_attrib_csize = get_attrib_ctype(handle, 0, 0, 0)

function get_attrib_offset(handle::Ptr{Cvoid}, dset_idx::Int64, comp_idx::Int64, attr_idx::Int64)
    attribs_offset = meta_attribute_offset(handle, meta_get_attribute_by_idx(handle, PGM_meta_get_component_by_idx(handle, meta_get_dataset_by_idx(handle, dset_idx), comp_idx), attr_idx))
    # for example: node has only 2 attributes (0 and 1). > n_attribs segfaults
    attribs_offset
end
# meta_n_attrib_offset = get_attrib_offset(handle, 0, 0, 0)

function get_attribute_name(handle::Ptr{Cvoid}, datasettype::String, componenttype::String, attr_idx::Int64)
    attribute_name = unsafe_string(meta_attribute_name(handle,meta_get_attribute_by_idx(handle, meta_get_component_by_name(handle, datasettype, componenttype), attr_idx)))
    attribute_name
end

function get_attr_name(handle::Ptr{Cvoid}, dset_idx::Int64, comp_idx::Int64, attr_idx::Int64)
    attr_ptr = ccall((:PGM_meta_get_attribute_by_idx, pgm.pgm_lib), 
                     Ptr{Cvoid}, (Ptr{Cvoid}, Int64), 
                     get_component(handle, dset_idx, comp_idx), attr_idx)
    name_ptr = ccall((:PGM_meta_attribute_name, pgm.pgm_lib), 
                     Cstring, (Ptr{Cvoid}, Ptr{Cvoid}), handle, attr_ptr)
    return unsafe_string(name_ptr)
end

function get_all_component_names(handle::Ptr{Cvoid}, dset_idx::Int64)
    compnames = Array{String}, 1()
    global dset_idx = dset_idx
    global handle = handle
    n_comps = PGM_meta_n_components(handle, PGM_meta_get_dataset_by_idx(handle, dset_idx))
    for i in 1:n_comps
    component_name = unsafe_string(PGM_meta_component_name(handle, PGM_meta_get_component_by_idx(handle, PGM_meta_get_dataset_by_idx(handle, dset_idx), i)))
    push!(compnames, component_name)
    end
    compnames
end
# does not work
# component_name = unsafe_string(pgm.PGM_meta_component_name(handle, pgm.meta_get_component_by_idx(handle, pgm.PGM_meta_get_dataset_by_idx(handle, 0), i)))

function inspect_pgm_blueprint(handle::Ptr{Cvoid})
    # Pak de eerste dataset (idx 0 is meestal de template/input dataset)
    metadataset = PGM_meta_get_dataset_by_idx(handle, 0)
    if metadataset == C_NULL
        println("Geen meta-dataset gevonden op index 0.")
        return
    end

    n_comps = PGM_meta_n_components(handle, metadataset)
    println("Dataset 0 bevat $n_comps component-types.")

    for i in 0:(n_comps - 1)
        comp_ptr = PGM_meta_get_component_by_idx(handle, metadataset, i)
        comp_name = unsafe_string(PGM_meta_component_name(handle, comp_ptr))
        comp_size = PGM_meta_component_size(handle, comp_ptr)
        n_attrs = PGM_meta_n_attributes(handle, comp_ptr)

        println("\n[$i] Component: $comp_name")
        println("    Grootte: $comp_size bytes")
        println("    Aantal attributen: $n_attrs")

        # Optioneel: Print alle attributen voor dit type
        for j in 0:(n_attrs - 1)
            attr_ptr = PGM_meta_get_attribute_by_idx(handle, comp_ptr, j)
            attr_name = unsafe_string(PGM_meta_attribute_name(handle, attr_ptr))
            attr_off  = PGM_meta_attribute_offset(handle, attr_ptr)
            println("      - $attr_name (Offset: $attr_off)")
        end
    end
end
# inspect_pgm_blueprint(generic function with 1 method)
# Draai de inspectie
# inspect_pgm_blueprint(handle)


#================================
================================#
# 1. Definieer de meta-accessors (zodat we zeker weten dat ze bestaan)
function get_n_components(handle, dset_idx)
    metadataset = ccall((:PGM_meta_get_dataset_by_idx, pgm.pgm_lib), Ptr{Cvoid}, (Ptr{Cvoid}, Int64), handle, dset_idx)
    return ccall((:PGM_meta_n_components, pgm.pgm_lib), Int64, (Ptr{Cvoid}, Ptr{Cvoid}), handle, metadataset)
end

function get_comp_info(handle, dset_idx, comp_idx)
    metadataset = ccall((:PGM_meta_get_dataset_by_idx, pgm.pgm_lib), Ptr{Cvoid}, (Ptr{Cvoid}, Int64), handle, dset_idx)
    metacomponent = ccall((:PGM_meta_get_component_by_idx, pgm.pgm_lib), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}, Int64), handle, metadataset, comp_idx)
    
    sz = ccall((:PGM_meta_component_size, pgm.pgm_lib), Int64, (Ptr{Cvoid}, Ptr{Cvoid}), handle, metacomponent)
    al = ccall((:PGM_meta_component_alignment, pgm.pgm_lib), Int64, (Ptr{Cvoid}, Ptr{Cvoid}), handle, metacomponent)
    at = ccall((:PGM_meta_n_attributes, pgm.pgm_lib), Int64, (Ptr{Cvoid}, Ptr{Cvoid}), handle, metacomponent)
    
    return sz, al, at
end

# 2. Voer de inspectie uit op de 'input' dataset (index 0)
#println("\n--- START ENGINE BLUEPRINT SCAN ---")
# handle = pgm.PGM_create_handle()
# ds = pgm.PGM_create_dataset_mutable(handle, "input", 21, 500)

#======
try
    n_comps = get_n_components(handle, 0)
    println("Gevonden component-definities: $n_comps")
    
    for i in 0:(n_comps-1)
        sz, al, at = get_comp_info(handle, 0, i)
        println("Comp ID $i | Size: $sz bytes | Align: $al | Attributes: $at")
    end
catch e
    @error "Scan mislukt" exception=e
end
======#
