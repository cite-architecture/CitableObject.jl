using Pkg
pkg"activate .."
push!(LOAD_PATH,"../src/")
using Documenter, DocStringExtensions, CitableObject

makedocs(sitename = "CitableObject Documentation")
