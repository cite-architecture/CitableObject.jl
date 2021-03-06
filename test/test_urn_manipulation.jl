@testset "Test URN manipulation" begin
    urn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
    @test dropobject(urn) ==  Cite2Urn("urn:cite2:hmt:msA.v1:")
    @test addobject(urn, "12v") ==  Cite2Urn("urn:cite2:hmt:msA.v1:12v")
    @test dropversion(urn) ==  Cite2Urn("urn:cite2:hmt:msA:12r")
    @test addversion(urn, "v2") ==  Cite2Urn("urn:cite2:hmt:msA.v2:12r")
end