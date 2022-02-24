@testset "Test retrieving labels for collections" begin
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 

    msb = Cite2Urn("urn:cite2:hmt:msB.v1:")
    expected = "Venetus B manuscript"

    @test cataloglabel(s, msb) == expected
    @test cataloglabel(blocks(s), msb) == expected
    @test cataloglabel(f, msb, FileReader) == expected
    @test cataloglabel(u, msb, UrlReader) == expected
    @test cataloglabel(s, msb, StringReader) == expected
    
end


@testset "Test retrieving labels for relation sets" begin
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 

    dseurn = Cite2Urn("urn:cite2:hmt:hmtdse.v1:all")
    expected = "Homer Multitext project indexing of digital scholarly editions"

    @test relationsetlabel(s, dseurn) == expected
    @test relationsetlabel(blocks(s), dseurn) == expected
    @test relationsetlabel(f, dseurn, FileReader) == expected
    @test relationsetlabel(u, dseurn, UrlReader) == expected
    @test relationsetlabel(s, dseurn, StringReader) == expected

end