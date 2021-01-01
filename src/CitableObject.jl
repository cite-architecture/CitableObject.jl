module CitableObject

using CitableBase, Documenter, DocStringExtensions

export Cite2Urn
export  validurn


include("cite2urn.jl")
include("validurn.jl")

end # module
