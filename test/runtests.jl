using CitableObject
using CitableObject.CexUtils
using CiteEXchange
using CitableBase
import CitableBase: CitableTrait
import CitableBase: urn

using Test


include("test_urn_validation.jl")
include("test_urn_components.jl")
include("test_componentparts.jl")
include("test_urn_manipulation.jl")
include("test_ranges.jl")
include("test_subreferences.jl")
include("test_urncomparison.jl")
include("test_cexutils.jl")
include("test_cexlabels.jl")
include("test_colindex.jl")
