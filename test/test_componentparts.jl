@testset "Extract parts of work component from CITE2 URN" begin
    u = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
    @test collectionid(u)== "msA"
    @test versionid(u) == "v1"
end

@testset "Return nothing for nonexistent work parts CITE2 URN" begin
    u = Cite2Urn("urn:cite2:hmt:msA:")
 
    @test versionid(u) |> isnothing
end