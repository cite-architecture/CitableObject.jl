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
    @test collectiondata(blocks(s), msbimg) |> length == expectedlength
    @test collectiondata(s, msbimg, StringReader) |> length == expectedlength
    @test collectiondata(f, msbimg, FileReader) |> length == expectedlength
    @test collectiondata(u, msbimg, UrlReader) |> length == expectedlength

end


@testset "Test finding collections for data model in CEX" begin
    f = joinpath(pwd(), "data", "hmt-2022i.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022i.cex"
    dm = Cite2Urn("urn:cite2:hmt:datamodels.v1:textonpage")
    expected = [
    Cite2Urn("urn:cite2:hmt:iliadindex.v1:e4"),
    Cite2Urn("urn:cite2:hmt:iliadindex.v1:u4"),
    Cite2Urn("urn:cite2:hmt:iliadindex.v1:msB")
    ]
    @test collectionurns_for_model(s, dm) == expected
    @test collectionurns_for_model(blocks(s), dm) == expected
    @test collectionurns_for_model(s, dm, StringReader) == expected
    @test collectionurns_for_model(f, dm, FileReader) == expected
    @test collectionurns_for_model(u, dm, UrlReader) == expected
end
    