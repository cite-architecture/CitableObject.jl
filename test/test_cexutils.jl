@testset "Test retrieving properties from CEX by Cite2Urn" begin
    f = joinpath(pwd(), "data", "hmt-2022i.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022i.cex" 
    msbimg = Cite2Urn("urn:cite2:hmt:msB.v1:")

    expected = [
        "urn:cite2:hmt:msB.v1.sequence:|Page sequence|Number|",
        "urn:cite2:hmt:msB.v1.urn:|URN|Cite2Urn|",
        "urn:cite2:hmt:msB.v1.rv:|Recto or Verso|String|recto,verso",
        "urn:cite2:hmt:msB.v1.label:|Label|String|",
        "urn:cite2:hmt:msB.v1.image:|TBS image|Cite2Urn|"
    ]
    @test properties(s, msbimg) ==  expected
    @test properties(blocks(s), msbimg) == expected
    @test properties(f, msbimg, FileReader) == expected
    @test properties(u, msbimg, UrlReader) == expected
    @test properties(s, msbimg, StringReader) ==  expected 
end


@testset "Test retrieving CITE data from CEX by Cite2Urn" begin
    f = joinpath(pwd(), "data", "hmt-2022i.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022i.cex" 
    msbimg = Cite2Urn("urn:cite2:hmt:msB.v1:")

    expectedlength = 683
    @test collectiondata(s, msbimg) |> length == expectedlength

end