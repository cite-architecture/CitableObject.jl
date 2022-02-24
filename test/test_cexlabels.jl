@testset "Test retrieving labels for collections" begin
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 

    msbimg = Cite2Urn("urn:cite2:hmt:msB.v1:")
    expected = "Venetus B manuscript"

    @test cataloglabel(s, msbimg) == expected
    @test cataloglabel(blocks(s), msbimg) == expected
    @test cataloglabel(f, msbimg, FileReader) == expected
    @test cataloglabel(u, msbimg, UrlReader) == expected
    @test cataloglabel(s, msbimg, StringReader) == expected
    
end


@testset "Test retrieving labels for relation sets" begin
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 

    dseurn = Cite2Urn("urn:cite2:hmt:hmtdse.v1:all")
    expected = "Homer Multitext project indexing of digital scholarly editions"

    @test relationsetlabel(s, dseurn) == expected
    @test relationsetlabel(blocks(s), dseurn) == expected

end