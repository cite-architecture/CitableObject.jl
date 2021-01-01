module CitableObject

using CitableBase, Documenter, DocStringExtensions

export Cite2Urn
export  validurn, namespace, workcomponent, objectcomponent


include("cite2urn.jl")
include("validurn.jl")
include("urn_components.jl")

end # module
