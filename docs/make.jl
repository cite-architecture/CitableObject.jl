# Build docs from root directory of repository:
#
#   julia --project=docs/ docs/make.jl
#
# Serve docs this repository root to serve:
#
#   julia -e 'using LiveServer; serve(dir="docs/build")'julia -e 'using LiveServer; serve(dir="docs/build")' 
#
using Pkg
Pkg.activate(".")
Pkg.instantiate()


using Documenter, DocStringExtensions
using CitableObject

makedocs(
    sitename = "CitableObject.jl",
    pages = [
        "Overview" => "index.md",
        "User's guide" => Any[
            "The Cite2Urn" => "guide.md",
            "The CitableByCite2Urn trait" => "trait.md"
        ],
        "API documentation" => "apis.md"
    ]
    )

deploydocs(
    repo = "github.com/cite-architecture/CitableObject.jl.git",
) 
