@testset begin
    u = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
    @test namespace(u)== "hmt"
end