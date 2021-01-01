
@testset "URN validation" begin
    @test_throws ArgumentError("Invalid string `way:too:short`: Cite2Urns must have five top-level components.") Cite2Urn("way:too:short")
    @test_throws ArgumentError("Invalid string `this:shouldn't:work:at:all!`: URNs must begin with `urn:`.") Cite2Urn("this:shouldn't:work:at:all!")
    @test_throws ArgumentError("Invalid string `urnX:cite2:hmt:msA.v1:12r`: URNs must begin with `urn:`.") Cite2Urn("urnX:cite2:hmt:msA.v1:12r")
    @test_throws ArgumentError("Invalid string `urn:cite2X:hmt:msA.v1:12r`: the URN type must be `cite2`.") Cite2Urn("urn:cite2X:hmt:msA.v1:12r")
    @test_throws ArgumentError("Invalid string `urn:cite2::msA.v1:12r`: CITE namespace cannot be empty.") Cite2Urn("urn:cite2::msA.v1:12r")
    @test_throws ArgumentError("Invalid string `urn:cite2::msA.v1:12r`: CITE namespace cannot be empty.") Cite2Urn("urn:cite2::msA.v1:12r")
    
    # Ok for object component to be empty:
    @test validurn("urn:cite2:hmt:msA.v1:")
    @test validurn("urn:cite2:hmt:msA.v1:12r")
   
end