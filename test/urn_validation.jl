
@testset "URN validation" begin
    @test_throws ArgumentError("Invalid string `this:shouldn't:work:at:all!`: URNs must begin with `urn:`.") Cite2Urn("this:shouldn't:work:at:all!")
end