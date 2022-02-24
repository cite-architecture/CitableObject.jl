@testset "Test retrieving labels for collections" begin
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 

    msbimg = Cite2Urn("urn:cite2:hmt:msB.v1:")
    expected = "Venetus B manuscript"

    @test cataloglabel(s, msbimg) == expected
    @test cataloglabel(blocks(s), msbimg) == expected
    #=
    @test properties(s, msbimg) ==  expected
    @test properties(blocks(s), msbimg) == expected
    @test properties(f, msbimg, FileReader) == expected
    @test properties(u, msbimg, UrlReader) == expected
    @test properties(s, msbimg, StringReader) ==  expected 
    =#
end