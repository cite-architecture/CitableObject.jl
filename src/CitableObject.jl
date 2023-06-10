module CitableObject
using Documenter, DocStringExtensions

import Base: show

using CitableBase 

import CitableBase: supportsversion, versionid
import CitableBase: addversion, dropversion

import CitableBase: supportssubref


import CitableBase: urncomparisontrait
import CitableBase: urnequals
import CitableBase: urncontains
import CitableBase: urnsimilar

export Cite2Urn
export CitableByCite2Urn
export Cite2UrnComparable

export validurn, namespace, collectioncomponent, objectcomponent
export collectionid, versionid, propertyid
export dropobject, addobject
export dropproperty, addproperty


include("cite2urn.jl")
include("validurn.jl")
include("urn_components.jl")
include("urnparts.jl")
include("urn_manipulation.jl")
include("urn_comparison.jl")



module CexUtils
    import ..CitableObject
    using Documenter, DocStringExtensions
    using Downloads

    using CitableBase: urncontains
    using CitableBase: ReaderType
    using CitableBase: FileReader
    using CitableBase: StringReader
    using CitableBase: UrlReader
    using CiteEXchange

    include("cexutils/properties.jl")
    include("cexutils/collections.jl")
    include("cexutils/columnindex.jl")
    include("cexutils/models.jl")
    include("cexutils/modelsdata.jl")
    include("cexutils/relations.jl")
    include("cexutils/relationsdata.jl")
    include("cexutils/cataloglabels.jl")
    include("cexutils/relationslabel.jl")
    include("cexutils/citeids.jl")
    

    export Block
    export properties
    export collectiondata
    export collectionblock
    export columnindex
    export implementations
    export data_for_model
    export relations
    export relations_for_model
    export cataloglabel
    export relationsetlabel
    export citeids 
end # submodule
end # module 
