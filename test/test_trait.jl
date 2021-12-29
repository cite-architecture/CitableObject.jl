@testset "Test URN comparable trait" begin
    citeurn = CiteUrn("urn:cite2:hmt:msA.v1:12r")
    @test urncomparable(citeurn)
end
