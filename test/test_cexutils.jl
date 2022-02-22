@testset "Test retrieving properties by URN" begin
    f = joinpath(pwd(), "data", "hmt-2022i.cex")
    s = read(f) |> String
    msbimg = Cite2Urn("urn:cite2:hmt:msB.v1:")
    msbprops = properties(s, msbimg)
    expected = [
        "urn:cite2:hmt:msB.v1.sequence:|Page sequence|Number|",
        "urn:cite2:hmt:msB.v1.urn:|URN|Cite2Urn|",
        "urn:cite2:hmt:msB.v1.rv:|Recto or Verso|String|recto,verso",
        "urn:cite2:hmt:msB.v1.label:|Label|String|",
        "urn:cite2:hmt:msB.v1.image:|TBS image|Cite2Urn|"
    ]
    @test msbprops ==  expected
    
end