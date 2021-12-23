module CitableObject

import Base: print
import Base: show

using CitableBase 
import CitableBase: CitableTrait

import CitableBase: dropversion
import CitableBase: addversion

import CitableBase: UrnComparisonTrait
import CitableBase: urnequals
import CitableBase: urncontains
import CitableBase: urnsimilar

using Documenter, DocStringExtensions

export Cite2Urn
export CitableByCite2Urn

export validurn, namespace, collectioncomponent, objectcomponent
export collectionid, versionid, propertyid
export dropobject, addobject
export dropproperty, addproperty
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
