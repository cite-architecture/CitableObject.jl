@testset "Text CitableTrait" begin
    struct TinyThing <: Citable
        urn::Cite2Urn
        data::AbstractString
    end

    function urn(tinyThing::TinyThing)
        tinyThing.urn
    end
    CitableTrait(::Type{TinyThing}) = CitableByCite2Urn()    
    citeurn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
    data = "Manuscript page data"
    tiny = TinyThing(citeurn, data)
    
    @test citable(tiny) 
    @test CitableTrait(typeof(tiny)) == CitableByCite2Urn()
end