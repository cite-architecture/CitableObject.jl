

@testset "Test subreferences" begin
    imgwroi = Cite2Urn("urn:cite2:ecod:bern88imgs.v1:bern88_004v@0.2658,0.1119,0.3911,0.02654")
    @test hassubref(imgwroi)
    img = Cite2Urn("urn:cite2:ecod:bern88imgs.v1:bern88_004v")
    @test hassubref(img) == false
    
    
    
    #@test_throws ArgumentError("XX") Cite2Urn("urn:cite2:ecod:bern88imgs.v1:bern88_004v@")
end

@testset "Test extracting subreferences" begin
    
    roi = "0.2658,0.1119,0.3911,0.02654"

    imgwroistring = "urn:cite2:ecod:bern88imgs.v1:bern88_004v@0.2658,0.1119,0.3911,0.02654"
    @test subref(imgwroistring) == roi
    imgwroi = Cite2Urn(imgwroistring)
    @test subref(imgwroi) == roi

    simpleobject = Cite2Urn("urn:cite2:ecod:bern88imgs.v1:bern88_004v")
    @test dropsubref(simpleobject) == simpleobject


end