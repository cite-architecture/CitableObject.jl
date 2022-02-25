
@testset "Test indexing column headers" begin
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    blocklist = blocks(f, FileReader)
end


@testset "Test identifyiing cite data block by URN" begin
    f = joinpath(pwd(), "data", "hmt-2022k.cex")
    s = read(f) |> String
    u = "https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex" 

    coll = Cite2Urn("urn:cite2:citebl:burney86pages.v1:")

    expectedheader = "sequence|image|urn|rv|label"

    blk = CitableObject.CexUtils.collectionblock(s, coll) 
    @test blk isa Block
    @test blk.lines[1] == expectedheader

    expecteddict = Dict( "label"    => 5,
        "rv"       => 4,
        "urn"      => 3,
        "sequence" => 1,
        "image"    => 2
    )
    @test columnindex(blk) == expecteddict

#=    @test collectionblock(blocks(s), blk)  == blk
    @test collectionblock(s, blk, StringReader) == blk
    @test collectionblock(f, blk, FileReader)  == blk
    @test collectionblock(u, blk, UrlReader)  == blk
    =#
end 
