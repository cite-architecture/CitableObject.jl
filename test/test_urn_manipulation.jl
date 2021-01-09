@testset "Test URN manipulation" begin
    urn = Cite2Urn("urn:cite2:hmt:msA:12r")
    @test dropobject(urn) ==  Cite2Urn("urn:cite2:hmt:msA:")
end