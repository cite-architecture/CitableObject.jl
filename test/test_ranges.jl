
@testset "Test range expressions" begin
    singleobject = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
    rangereference = Cite2Urn("urn:cite2:hmt:msA.v1:12r-12v")
    @test isrange(rangereference)
    @test isrange(singleobject) == false
    @test_throws ArgumentError("Invalid object identifer `-12r`.  Range parts may not be empty.") isrange("-12r")
    @test_throws ArgumentError("Invalid object identifer `12r-`.  Range parts may not be empty.") isrange("12r-")
    @test_throws ArgumentError("Invalid object identifer `1r-11v-12r`.  Too many hyphen-delimited parts.") isrange("1r-11v-12r")

    emptyobject = Cite2Urn("urn:cite2:hmt:msA.v1:") 
    @test isrange(emptyobject) == false
end


@testset "Extract range parts" begin
    rangeurn = Cite2Urn("urn:cite2:hmt:msA.v1:12r-12v") 
    @test rangebegin(rangeurn) == "12r"
    @test rangeend(rangeurn) == "12v"

    singleobject = Cite2Urn("urn:cite2:hmt:msA.v1:12r") 
    @test_throws ArgumentError("Object identifier 12r is not a range.") rangebegin(singleobject)
    @test_throws ArgumentError("Object identifier 12r is not a range.") rangeend(singleobject)
    emptyobject = Cite2Urn("urn:cite2:hmt:msA.v1:") 
    @test_throws ArgumentError("URN `urn:cite2:hmt:msA.v1:` is not a range.") rangebegin(emptyobject)
    @test_throws ArgumentError("URN `urn:cite2:hmt:msA.v1:` is not a range.") rangeend(emptyobject)
end