module CitableObject

using CitableBase 
import CitableBase: dropversion
import CitableBase: addversion

using Documenter, DocStringExtensions


export Cite2Urn
export validurn, namespace, collectioncomponent, objectcomponent
export collectionid, versionid
export dropobject, addobject, dropversion, addversion
export isrange, rangebegin, rangeend
export hassubref, subref, dropsubref
export dropversion, addversion
export urncontains

include("cite2urn.jl")
include("validurn.jl")
include("urn_components.jl")
include("urnparts.jl")
include("urn_manipulation.jl")
include("ranges.jl")
include("subreferences.jl")
include("urn_comparison.jl")

end # module
