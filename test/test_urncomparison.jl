@testset "Test URN comparison" begin
    pages = Cite2Urn("urn:cite2:hmt:msA.v1:")
    page12r = Cite2Urn("urn:cite2:hmt:msA.v1:12r")
    @test urncontains(pages,page12r)
    #@test urnequals(pages,page12r)

end