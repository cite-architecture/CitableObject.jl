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



@testset "Test retrieving labels for implementations of a data model" begin
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 

    codmod = Cite2Urn("urn:cite2:hmt:datamodels.v1:codexmodel")
    expectedcodices =  7
    codexids = citeids(s, codmod)
    @test length(codexids) == expectedcodices

    c1 = codexids[1]
    @test c1.urn == Cite2Urn("urn:cite2:citebl:burney86pages.v1:")
    @test c1.label == "Burney 86 manuscript"

    @test codexids == citeids(blocks(s), codmod)
    @test codexids == citeids(f, codmod, FileReader)
    @test codexids == citeids(u, codmod, UrlReader)
    @test codexids == citeids(s, codmod, StringReader)
    
    # Relation set model:
    txtonpage = Cite2Urn("urn:cite2:hmt:datamodels.v1:textonpage") 
    dsecollections = citeids(s, txtonpage)
    @test length(dsecollections) == 3

    dse1 = dsecollections[1]
    @test dse1.urn == Cite2Urn("urn:cite2:hmt:iliadindex.v1:e4")
    @test dse1.label == "Index of *Iliad* lines to pages where they appear in the Escorial Omega 1.12 manuscript"

    @test dsecollections == citeids(blocks(s), txtonpage)
    @test dsecollections == citeids(f, txtonpage, FileReader)
    @test dsecollections == citeids(u, txtonpage, UrlReader)
    @test dsecollections == citeids(s, txtonpage, StringReader)
end