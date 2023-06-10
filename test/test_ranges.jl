
@testset "Test range expressions" begin
    singleobject = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
    rangereference = Cite2Urn("urn:cite2:hmt:msA.v1:12r-12v")
    @test isrange(rangereference)
    @test isrange(singleobject) == false
    @test_throws ArgumentError isrange(Cite2Urn("-12r"))
    @test_throws ArgumentError isrange(Cite2Urn("12r-"))
    @test_throws ArgumentError isrange(Cite2Urn("1r-11v-12r"))

    emptyobject = Cite2Urn("urn:cite2:hmt:msA.v1:") 
    @test isrange(emptyobject) == false
end


@testset "Extract range parts" begin
    rangeurn = Cite2Urn("urn:cite2:hmt:msA.v1:12r-12v") 
    @test range_begin(rangeurn) == "12r"
    @test range_end(rangeurn) == "12v"

    singleobject = Cite2Urn("urn:cite2:hmt:msA.v1:12r") 
    @test_throws ArgumentError range_begin(singleobject)
    @test_throws ArgumentError range_end(singleobject)
    emptyobject = Cite2Urn("urn:cite2:hmt:msA.v1:") 
    @test_throws ArgumentError range_begin(emptyobject)
    @test_throws ArgumentError range_end(emptyobject)
end