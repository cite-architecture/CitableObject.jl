# Use this from root directory of repository, e.g.,
# julia --project=docs/ docs/make.jl
using Pkg
Pkg.activate(".")
Pkg.instantiate()


using Documenter, DocStringExtensions
using CitableObject

makedocs(
    sitename = "CitableObject.jl",
    pages = [
        "Home" => "index.md",
        "API documentation" => "apis.md"
    ]
    )

deploydocs(
    repo = "github.com/cite-architecture/CitableObject.jl.git",
) 
