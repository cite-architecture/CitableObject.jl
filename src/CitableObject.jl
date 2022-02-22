module CitableObject
using Documenter, DocStringExtensions

import Base: show

using CitableBase 

import CitableBase: supportsversion
import CitableBase: dropversion
import CitableBase: addversion
import CitableBase: versionid

import CitableBase: supportssubref
import CitableBase: dropsubref
import CitableBase: hassubref
import CitableBase: subref

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
export isrange, rangebegin, rangeend

include("cite2urn.jl")
include("validurn.jl")
include("urn_components.jl")
include("urnparts.jl")
include("urn_manipulation.jl")
include("ranges.jl")
include("subreferences.jl")
include("urn_comparison.jl")



module CexUtils
    import ..CitableObject
    using CitableBase
    using CiteEXchange
    include("cexutils.jl")

    export properties
    export collectiondata
    export relations
    export collections_for_model
end # submodule
end # module 
