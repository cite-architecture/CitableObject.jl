var documenterSearchIndex = {"docs":
[{"location":"guide/#Users'-guide:-the-Cite2Urn","page":"The Cite2Urn","title":"Users' guide: the Cite2Urn","text":"","category":"section"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"The CitableObject module defines functions for working with Cite2Urns.  (The API documentation has a more complete list.) Construct a Cite2Urn from a string value.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"using CitableObject\npageurn = Cite2Urn(\"urn:cite2:hmt:msA.v1:12r\")","category":"page"},{"location":"guide/#Components-and-parts","page":"The Cite2Urn","title":"Components and parts","text":"","category":"section"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"Include the CitableBase module for to use the generic components and parts functions.  These return Vectors of string values. ","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"using CitableBase\ncomponents(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"A Cite2Urn always has five top-level components. It is legal for the object component to be empty.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"pagecollection =  Cite2Urn(\"urn:cite2:hmt:msA.v1:\")\ncomponents(pagecollection)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"You can use the following functions to extract top-level components by name.  They return a string value.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"namespace(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"collectioncomponent(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"objectcomponent(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"You can also retrieve individual parts of the collection component:","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"collectionid(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"versionid(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"propurn =  Cite2Urn(\"urn:cite2:hmt:msA.v1.side:12r\")\npropertyid(propurn)","category":"page"},{"location":"guide/#URN-manipulation","page":"The Cite2Urn","title":"URN manipulation","text":"","category":"section"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"Several functions use a Cite2Urn to create a new, modified Cite2Urn.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"dropversion(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"Verify that the result is a new Cite2Urn.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"dropversion(pageurn) |> typeof","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"addversion(pageurn, \"v2\")","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"dropobject(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"addobject(pageurn, \"1r\")","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"dropproperty(propurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"addproperty(pageurn, \"side\")","category":"page"},{"location":"guide/#URN-comparison","page":"The Cite2Urn","title":"URN comparison","text":"","category":"section"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"In addition to comparing for equality with ==, you can compare a pair of CITE2 URNs for URN containment or URN similarity.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"urncontains(pagecollection, pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"Two URNs are similar if they are equal, or if either contains the other.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"urnsimilar(pagecollection, pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"Note that this definition means the function is symmetric.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"urnsimilar(pagecollection, pageurn) == urnsimilar(pageurn, pagecollection)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"For Cite2Urns, urnequals and == return identical results.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"urnequals(pagecollection, pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"pagecollection == pageurn","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"urnsimilar(pagecollection,dropobject(pageurn))","category":"page"},{"location":"guide/#Ranges","page":"The Cite2Urn","title":"Ranges","text":"","category":"section"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"Cite2Urns can identify ranges (sequences) of objects in ordered collections.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"pages = Cite2Urn(\"urn:cite2:hmt:msA.v1:1r-11v\")\nisrange(pages)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"rangebegin(pages)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"rangeend(pages)","category":"page"},{"location":"guide/#Extended-identifiers-(\"subreferences\")","page":"The Cite2Urn","title":"Extended identifiers (\"subreferences\")","text":"","category":"section"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"In some collections, extended identifiers (\"subreferences\") may be appropriate.  You can determine if a Cite2Urn includes an extended identifier, extract the subreference, or drop it.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"imgurn = Cite2Urn(\"urn:cite2:hmt:vaimg.2017a:VA012RN_0013@0.2005,0.2073,0.1774,0.02351\")\nhassubref(imgurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"The subref functions returns a string value.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"subref(imgurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"The dropsubref function returns a new Cite2Urn.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"dropsubref(imgurn)","category":"page"},{"location":"apis/#API-Documentation","page":"API documentation","title":"API Documentation","text":"","category":"section"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"CurrentModule = CitableObject","category":"page"},{"location":"apis/#Types","page":"API documentation","title":"Types","text":"","category":"section"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"Cite2Urn\nCitableByCite2Urn\nCite2UrnComparable","category":"page"},{"location":"apis/#CitableObject.Cite2Urn","page":"API documentation","title":"CitableObject.Cite2Urn","text":"Implementation of the Cite Object URN. See  http://cite-architecture.org/cite2urn/.\n\n\n\n\n\n","category":"type"},{"location":"apis/#CitableObject.CitableByCite2Urn","page":"API documentation","title":"CitableObject.CitableByCite2Urn","text":"A value of CitableBase.CitableTrait that can be used for content citable by CtsUrn.\n\n\n\n\n\n","category":"type"},{"location":"apis/#CitableObject.Cite2UrnComparable","page":"API documentation","title":"CitableObject.Cite2UrnComparable","text":"Value for URN comparison trait on CtsUrnDocStringExtensions\n\n\n\n\n\n","category":"type"},{"location":"apis/#Functions","page":"API documentation","title":"Functions","text":"","category":"section"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"Manipulating Cite2Urns:","category":"page"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"namespace\ncollectioncomponent\nobjectcomponent\nisrange\nrangebegin\nrangeend\nhassubref\nsubref\ndropsubref\ndropversion\naddversion\ndropproperty\naddproperty","category":"page"},{"location":"apis/#CitableObject.namespace","page":"API documentation","title":"CitableObject.namespace","text":"namespace(u)\n\n\nExtract CITE2 namespace from a CtsUrn.\n\nExamples\n\njulia>\nnamespace(Cite2Urn(\"urn:cite2:hmt:msA.v1:12r\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.collectioncomponent","page":"API documentation","title":"CitableObject.collectioncomponent","text":"collectioncomponent(u)\n\n\nExtract CITE2 work component from a CtsUrn.\n\nExamples\n\njulia>\ncollectioncomponent(Cite2Urn(\"urn:cite2:hmt:msA.v1:12r\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.objectcomponent","page":"API documentation","title":"CitableObject.objectcomponent","text":"objectcomponent(u)\n\n\nExtract CITE2 object component from a CtsUrn.\n\nExamples\n\njulia>\nobjectcomponent(Cite2Urn(\"urn:cite2:hmt:msA.v1:12r\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.isrange","page":"API documentation","title":"CitableObject.isrange","text":"isrange(obj)\n\n\nTrue if obj is a range expression.\n\n\n\n\n\nisrange(urn)\n\n\nTrue if the object component of urn is a range expression.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.rangebegin","page":"API documentation","title":"CitableObject.rangebegin","text":"rangebegin(s)\n\n\nExtract first part from a range expression.\n\n\n\n\n\nrangebegin(u)\n\n\nExtract first range part from a URN's object identifier.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.rangeend","page":"API documentation","title":"CitableObject.rangeend","text":"rangeend(s)\n\n\nExtract second part from a range expression.\n\n\n\n\n\nrangeend(urn)\n\n\nExtract second range part from a URN's object identifier.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.hassubref","page":"API documentation","title":"CitableObject.hassubref","text":"hassubref(obj)\n\n\nTrue if String has a subreference.\n\n\n\n\n\nhassubref(urn)\n\n\nTrue if urn has a subreference.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.subref","page":"API documentation","title":"CitableObject.subref","text":"subref(s)\n\n\nExtract subreference from a string.\n\n\n\n\n\nsubref(u)\n\n\nExtract subreference from a URN.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.dropsubref","page":"API documentation","title":"CitableObject.dropsubref","text":"dropsubref(s)\n\n\nRemove any subreference substrings in a string. If s is a range expression, separately drop subreference from each of range-begin and range-end parts.\n\n\n\n\n\ndropsubref(u)\n\n\nRemove any subreferences from a CtsUrn.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.dropversion","page":"API documentation","title":"CitableBase.dropversion","text":"Urn subtypes should implement dropversion(urn::U)::U.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.addversion","page":"API documentation","title":"CitableBase.addversion","text":"Urn subtypes should implement addversion(urn::U, versionid)::U.  \n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.dropproperty","page":"API documentation","title":"CitableObject.dropproperty","text":"Create a new Cite2Urn by dropping the version part of a given Cite2Urn.\n\ndropproperty(u)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.addproperty","page":"API documentation","title":"CitableObject.addproperty","text":"Create a new Cite2Urn by setting the version part of a given Cite2Urn to a given value.\n\naddproperty(u, propid)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"Comparing a pair of Cite2Urns:","category":"page"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"urncontains\nurnequals\nurnsimilar","category":"page"},{"location":"apis/#CitableBase.urncontains","page":"API documentation","title":"CitableBase.urncontains","text":"URN-comparable objects must implement urncontains.\n\nurncontains(x, y)\n\n\n\n\n\n\nurncontains(u1, u2)\n\n\nTrue if  urn1 contains or is equal to urn2 accroding to URN logic.\n\n```\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.urnequals","page":"API documentation","title":"CitableBase.urnequals","text":"For subtypes of Urn, implement urnequals concretely.\n\nurnequals(u1, u2)\n\n\n\n\n\n\nURN-comparable objects must implement urnequals.\n\n\n\n\n\nurnequals(urn1, urn2)\n\n\nOverride urnequals function for Cite2Urns.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.urnsimilar","page":"API documentation","title":"CitableBase.urnsimilar","text":"URN-comparable objects must implement urnsimilar.\n\n\n\n\n\nurnsimilar(urn1, urn2)\n\n\nOverride similar function to be true if urn1 and urn1 are similar by URN logic.\n\n\n\n\n\n","category":"function"},{"location":"trait/#The-CitableTrait","page":"The CitableByCite2Urn trait","title":"The CitableTrait","text":"","category":"section"},{"location":"trait/","page":"The CitableByCite2Urn trait","title":"The CitableByCite2Urn trait","text":"The CitableBase package defines a CitableTrait. For any Julia type, the value of the trait is identified by a singleton value returned by the citabletrait function. By default, the value of the trait isNotCitable(). (See a fuller discussion in the documentation for CitableBase).","category":"page"},{"location":"trait/","page":"The CitableByCite2Urn trait","title":"The CitableByCite2Urn trait","text":"The CitableObject package defines a singleton-type CitableByCite2Urn which you use as the value for CitableTrait for your own types of content identified by Cite2Urns. Here is a brief example.","category":"page"},{"location":"trait/","page":"The CitableByCite2Urn trait","title":"The CitableByCite2Urn trait","text":"First define your type with a Cite2Urn.","category":"page"},{"location":"trait/","page":"The CitableByCite2Urn trait","title":"The CitableByCite2Urn trait","text":"using CitableBase, CitableObject\n\nstruct TinyThing <: Citable\n    urn::Cite2Urn\n    data::AbstractString\nend\nciteurn = Cite2Urn(\"urn:cite2:hmt:msA.v1:12r\")\ndata = \"Manuscript page data\"\ntiny = TinyThing(citeurn, data)","category":"page"},{"location":"trait/","page":"The CitableByCite2Urn trait","title":"The CitableByCite2Urn trait","text":"Override the citabletrait function when its parameter is the type TinyThing, and return the concrete value `CitableByCite2Urn().","category":"page"},{"location":"trait/","page":"The CitableByCite2Urn trait","title":"The CitableByCite2Urn trait","text":"import CitableBase: citabletrait\nfunction citabletrait(::Type{TinyThing})\n    CitableByCite2Urn()\nend","category":"page"},{"location":"trait/","page":"The CitableByCite2Urn trait","title":"The CitableByCite2Urn trait","text":"Check the result:","category":"page"},{"location":"trait/","page":"The CitableByCite2Urn trait","title":"The CitableByCite2Urn trait","text":"citabletrait(typeof(tiny))","category":"page"},{"location":"trait/","page":"The CitableByCite2Urn trait","title":"The CitableByCite2Urn trait","text":"Now you can use the citable function (from CitableBase) to check whether individual objects of your new type are citable.","category":"page"},{"location":"trait/","page":"The CitableByCite2Urn trait","title":"The CitableByCite2Urn trait","text":"citable(tiny)","category":"page"},{"location":"trait/","page":"The CitableByCite2Urn trait","title":"The CitableByCite2Urn trait","text":"At this point, you can also implement the required functions of the CitableTrait, urn and label.","category":"page"},{"location":"trait/","page":"The CitableByCite2Urn trait","title":"The CitableByCite2Urn trait","text":"import CitableBase: urn\nfunction urn(tinyThing::TinyThing)\n    tinyThing.urn\nend\n\nimport CitableBase: label\n\nfunction urn(tinyThing::TinyThing)\n    string(tinyThing.urn) * \" with data \" * tinyThing.data\nend","category":"page"},{"location":"#CitableObject.jl-Documentation","page":"Overview","title":"CitableObject.jl Documentation","text":"","category":"section"},{"location":"","page":"Overview","title":"Overview","text":"The CitableObject.jl module defines the Cite2Urn, a URN notation for canonically citing versioned objects.","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"A Cite2Urn can be instantiated from a string value. The generic show function displays this value to an IOStream.","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"using CitableObject\nurn = Cite2Urn(\"urn:cite2:hmt:msA.v1:12r\")","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"The following pages include:","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"a brief user's guide to working with Cite2Urns\nAPI documentation of public functions and types","category":"page"}]
}
