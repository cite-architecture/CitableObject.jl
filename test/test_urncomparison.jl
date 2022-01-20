@testset "Test URN comparison" begin
    pages = Cite2Urn("urn:cite2:hmt:msA.v1:")
    page12r = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
    @test urncontains(pages,page12r)
    @test urnsimilar(pages,page12r)
    @test urnequals(pages,page12r) == false
    @test urnsimilar(pages,dropobject(page12r))
    
    lsjurn = Cite2Urn("urn:cite2:hmt:lsj.chicago_md:")
    @test urncontains(lsjurn, pages) == false

end