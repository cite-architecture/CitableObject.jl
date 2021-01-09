module CitableObject

using CitableBase, Documenter, DocStringExtensions

export Cite2Urn
export  validurn, namespace, collectioncomponent, objectcomponent
export isrange, rangebegin, rangeend

include("cite2urn.jl")
include("validurn.jl")
include("urn_components.jl")
include("ranges.jl")

end # module
