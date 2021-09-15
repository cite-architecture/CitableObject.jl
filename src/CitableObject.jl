module CitableObject

import Base: print
import Base: show

using CitableBase 
import CitableBase: dropversion
import CitableBase: addversion
import CitableBase: urncontains
import CitableBase: urnsimilar
import CitableBase: urn
import CitableBase: label
import CitableBase: cex

using Documenter, DocStringExtensions


export Cite2Urn
export dropversion, addversion
export urncontains, urnsimilar

export validurn, namespace, collectioncomponent, objectcomponent
export collectionid, versionid
export dropobject, addobject
export isrange, rangebegin, rangeend
export hassubref, subref, dropsubref



include("cite2urn.jl")
include("validurn.jl")
include("urn_components.jl")
include("urnparts.jl")
include("urn_manipulation.jl")
include("ranges.jl")
include("subreferences.jl")
include("urn_comparison.jl")

end # module
