@testset "Extract top-level components from CITE2 URN" begin
    u = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
    @test namespace(u)== "hmt"
    @test collectioncomponent(u) == "msA.v1"

    @test objectcomponent(Cite2Urn("urn:cite2:hmt:msA.v1:")) === nothing
end