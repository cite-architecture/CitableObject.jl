@testset "Test retrieving properties from CEX by Cite2Urn" begin
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 
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
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 
    msbimg = Cite2Urn("urn:cite2:hmt:msB.v1:")

    expectedlength = 683
    @test collectiondata(s, msbimg) |> length == expectedlength
    @test collectiondata(blocks(s), msbimg) |> length == expectedlength
    @test collectiondata(s, msbimg, StringReader) |> length == expectedlength
    @test collectiondata(f, msbimg, FileReader) |> length == expectedlength
    @test collectiondata(u, msbimg, UrlReader) |> length == expectedlength

end


@testset "Test finding collections for data model in CEX" begin
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex"
    dm = Cite2Urn("urn:cite2:hmt:datamodels.v1:textonpage")
    expected = [
    Cite2Urn("urn:cite2:hmt:iliadindex.v1:e4"),
    Cite2Urn("urn:cite2:hmt:iliadindex.v1:u4"),
    Cite2Urn("urn:cite2:hmt:iliadindex.v1:msB")
    ]
    @test implementations(s, dm) == expected
    @test implementations(blocks(s), dm) == expected
    @test implementations(s, dm, StringReader) == expected
    @test implementations(f, dm, FileReader) == expected
    @test implementations(u, dm, UrlReader) == expected
end
    
@testset "Test finding data in CEX for a data model" begin
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex"
    dm = Cite2Urn("urn:cite2:hmt:datamodels.v1:codexmodel")

    expected = 4254
    @test data_for_model(s, dm) |> length == expected
    @test data_for_model(blocks(s), dm) |> length == expected
    @test data_for_model(s, dm, StringReader) |> length == expected
    @test data_for_model(f, dm, FileReader) |> length == expected
    @test data_for_model(u, dm, UrlReader) |> length == expected
end

@testset "Test find CITE relation set data" begin
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex"
    #Find specific set object: 
    relobj = Cite2Urn("urn:cite2:hmt:iliadindex.v1:e4")
    expected_e4 = 15633
    s_rels = relations(s, relobj) |> length
    b_rels = relations(blocks(s), relobj) |> length
    f_rels = relations(f, relobj, FileReader) |> length
    u_rels = relations(u, relobj, UrlReader) |> length

    @test s_rels == expected_e4
    @test b_rels == expected_e4
    @test f_rels == expected_e4
    @test u_rels == expected_e4

    #Find set collection: urn:cite2:hmt:iliadindex.v1:
    expected_all = 38115
    s_rels_all = relations(s, dropobject(relobj)) |> length
    b_rels_all = relations(blocks(s), dropobject(relobj)) |> length
    f_rels_all = relations(f, dropobject(relobj), FileReader) |> length
    u_rels_all = relations(u, dropobject(relobj), UrlReader) |> length


    @test s_rels_all == expected_all
    @test b_rels_all == expected_all
    @test f_rels_all == expected_all
    @test u_rels_all == expected_all

    #Find by data model: urn:cite2:hmt:datamodels.v1:textonpage:
end