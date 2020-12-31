module CitableObject

using CitableBase, Documenter, DocStringExtensions

export Cite2Urn,
    validUrn


include("cite2urn.jl")
include("validurn.jl")

end # module
