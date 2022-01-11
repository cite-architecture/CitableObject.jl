module CitableObject
using Documenter, DocStringExtensions

import Base: show

using CitableBase 

import CitableBase: supportsversion
import CitableBase: dropversion
import CitableBase: addversion

import CitableBase: urncomparisontrait
import CitableBase: urnequals
import CitableBase: urncontains
import CitableBase: urnsimilar

import CitableBase: supportssubref
import CitableBase: addsubref
import CitableBase: dropsubref
import CitableBase: hassubref
import CitableBase: subref
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

end # module
