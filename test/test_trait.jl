@testset "Test URN comparable trait" begin
    citeurn = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
    @test urncomparable(citeurn)
end
