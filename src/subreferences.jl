
"""
$(SIGNATURES)
True if String has a subreference.
"""
function hassubref(obj::AbstractString)::Bool
    if isrange(obj)
        hassubref(rangebegin(obj)) || hassubref(rangeend(obj))
        #throw(ArgumentError("Function `hassubref` applies only to single-node URNs or passage-component Strings not to ranges like `$(obj)`."))
    else
        # Kludge to work around some kind of error when first
        # range element is empty
        if obj == ""
            false
        elseif obj[1] == "@"
            throw(ArgumentError("Invalid passage component `$(obj)`.  Subreference without canonical node reference."))
        end

        refparts = split(obj,"@")
        partcount = size(refparts,1)
        if (partcount > 2)
            throw(ArgumentError("Invalid passage component `$(obj)`.  Too many @-delimited parts."))
        elseif partcount == 2
            if "" in refparts
                throw(ArgumentError("Invalid passage component `$(obj)`.  Subreference may not be empty."))
            else
                true
            end

        else
            # No subref if 0 or 1 part
            false
        end
    end
end

"""
$(SIGNATURES)
True if `urn` has a subreference.
"""
function hassubref(urn::Cite2Urn)::Bool
    if objectcomponent(urn) === nothing
        false
    else
        hassubref(objectcomponent(urn))
    end
end


function subref(s::AbstractString)
    ""
end

function subref(u::Cite2Urn)
    if objectcomponent(urn) === nothing
        nothing
    else
        subref(u)
    end
end