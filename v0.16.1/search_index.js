var documenterSearchIndex = {"docs":
[{"location":"guide/#Users'-guide:-the-Cite2Urn","page":"The Cite2Urn","title":"Users' guide: the Cite2Urn","text":"","category":"section"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"The CitableObject module defines functions for working with Cite2Urns.  (The API documentation has a more complete list.) Construct a Cite2Urn from a string value.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"using CitableObject\npageurn = Cite2Urn(\"urn:cite2:hmt:msA.v1:12r\")","category":"page"},{"location":"guide/#Components-and-parts","page":"The Cite2Urn","title":"Components and parts","text":"","category":"section"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"Include the CitableBase module for to use the generic components and parts functions.  These return Vectors of string values. ","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"using CitableBase\ncomponents(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"A Cite2Urn always has five top-level components. It is legal for the object component to be empty.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"pagecollection =  Cite2Urn(\"urn:cite2:hmt:msA.v1:\")\ncomponents(pagecollection)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"You can use the following functions to extract top-level components by name.  They return a string value.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"namespace(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"collectioncomponent(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"objectcomponent(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"You can also retrieve individual parts of the collection component:","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"collectionid(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"versionid(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"propurn =  Cite2Urn(\"urn:cite2:hmt:msA.v1.side:12r\")\npropertyid(propurn)","category":"page"},{"location":"guide/#URN-manipulation","page":"The Cite2Urn","title":"URN manipulation","text":"","category":"section"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"Several functions use a Cite2Urn to create a new, modified Cite2Urn.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"dropversion(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"Verify that the result is a new Cite2Urn.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"dropversion(pageurn) |> typeof","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"addversion(pageurn, \"v2\")","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"dropobject(pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"addobject(pageurn, \"1r\")","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"dropproperty(propurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"addproperty(pageurn, \"side\")","category":"page"},{"location":"guide/#URN-comparison","page":"The Cite2Urn","title":"URN comparison","text":"","category":"section"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"In addition to comparing for equality with ==, you can compare a pair of CITE2 URNs for URN containment or URN similarity.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"urncontains(pagecollection, pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"Two URNs are similar if they are equal, or if either contains the other.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"urnsimilar(pagecollection, pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"Note that this definition means the function is symmetric.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"urnsimilar(pagecollection, pageurn) == urnsimilar(pageurn, pagecollection)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"For Cite2Urns, urnequals and == return identical results.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"urnequals(pagecollection, pageurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"pagecollection == pageurn","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"urnsimilar(pagecollection,dropobject(pageurn))","category":"page"},{"location":"guide/#Ranges","page":"The Cite2Urn","title":"Ranges","text":"","category":"section"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"Cite2Urns can identify ranges (sequences) of objects in ordered collections.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"pages = Cite2Urn(\"urn:cite2:hmt:msA.v1:1r-11v\")\nisrange(pages)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"range_begin(pages)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"range_end(pages)","category":"page"},{"location":"guide/#Extended-identifiers-(\"subreferences\")","page":"The Cite2Urn","title":"Extended identifiers (\"subreferences\")","text":"","category":"section"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"In some collections, extended identifiers (\"subreferences\") may be appropriate.  You can determine if a Cite2Urn includes an extended identifier, extract the subreference, or drop it.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"imgurn = Cite2Urn(\"urn:cite2:hmt:vaimg.2017a:VA012RN_0013@0.2005,0.2073,0.1774,0.02351\")\nhassubref(imgurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"The subref functions returns a string value.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"subref(imgurn)","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"The dropsubref function returns a new Cite2Urn.","category":"page"},{"location":"guide/","page":"The Cite2Urn","title":"The Cite2Urn","text":"dropsubref(imgurn)","category":"page"},{"location":"apis/#API-Documentation","page":"API documentation","title":"API Documentation","text":"","category":"section"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"CurrentModule = CitableObject","category":"page"},{"location":"apis/#Types","page":"API documentation","title":"Types","text":"","category":"section"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"Cite2Urn\nCitableByCite2Urn\nCite2UrnComparable","category":"page"},{"location":"apis/#CitableObject.Cite2Urn","page":"API documentation","title":"CitableObject.Cite2Urn","text":"Implementation of the Cite Object URN. See  http://cite-architecture.org/cite2urn/.\n\n\n\n\n\n","category":"type"},{"location":"apis/#CitableObject.CitableByCite2Urn","page":"API documentation","title":"CitableObject.CitableByCite2Urn","text":"A value of CitableBase.CitableTrait that can be used for content citable by CtsUrn.\n\n\n\n\n\n","category":"type"},{"location":"apis/#CitableObject.Cite2UrnComparable","page":"API documentation","title":"CitableObject.Cite2UrnComparable","text":"Value for URN comparison trait on CtsUrnDocStringExtensions\n\n\n\n\n\n","category":"type"},{"location":"apis/#Functions","page":"API documentation","title":"Functions","text":"","category":"section"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"Manipulating Cite2Urns:","category":"page"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"namespace\ncollectioncomponent\nobjectcomponent\nisrange\nrange_begin\nrange_end\nsupportssubref\nhassubref\nsubref\ndropsubref\nsupportsversion\ndropversion\naddversion\nversionid\ndropproperty\naddproperty","category":"page"},{"location":"apis/#CitableObject.namespace","page":"API documentation","title":"CitableObject.namespace","text":"namespace(u)\n\n\nExtract CITE2 namespace from a CtsUrn.\n\nExamples\n\njulia>\nnamespace(Cite2Urn(\"urn:cite2:hmt:msA.v1:12r\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.collectioncomponent","page":"API documentation","title":"CitableObject.collectioncomponent","text":"collectioncomponent(u)\n\n\nExtract CITE2 work component from a CtsUrn.\n\nExamples\n\njulia>\ncollectioncomponent(Cite2Urn(\"urn:cite2:hmt:msA.v1:12r\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.objectcomponent","page":"API documentation","title":"CitableObject.objectcomponent","text":"objectcomponent(u)\n\n\nExtract CITE2 object component from a CtsUrn.\n\nExamples\n\njulia>\nobjectcomponent(Cite2Urn(\"urn:cite2:hmt:msA.v1:12r\"))\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.isrange","page":"API documentation","title":"CitableBase.isrange","text":"True if u is a range-type URN.\n\nisrange(u)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.range_begin","page":"API documentation","title":"CitableBase.range_begin","text":"range_begin(u)\n\n\nExtract first part from a range expression in URN u.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.range_end","page":"API documentation","title":"CitableBase.range_end","text":"range_end(u)\n\n\nExtract second part from a range expression in URN u.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.supportssubref","page":"API documentation","title":"CitableBase.supportssubref","text":"True for URN types that support subreferences.\n\nsupportssubref(u)\n\n\n\n\n\n\nCite2Urns support subreferences.\n\nsupportssubref(u)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.hassubref","page":"API documentation","title":"CitableBase.hassubref","text":"True for URN types that support subreferences.\n\nhassubref(u)\n\n\n\n\n\n\nTrue if last component of u has a sub-reference.\n\nhassubref(u)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.subref","page":"API documentation","title":"CitableBase.subref","text":"Urn subtypes should implement dropversion(urn::U)::U.\n\nsubref(u)\n\n\n\n\n\n\nsubref(u)\n\n\nExtract subreference from a a URN, or empty string if there is no subreference.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.dropsubref","page":"API documentation","title":"CitableBase.dropsubref","text":"Urn subtypes should implement dropversion(urn::U)::U.\n\ndropsubref(u)\n\n\n\n\n\n\ndropsubref(u)\n\n\nRemove any subreferences in URN u. If u is a range, separately drop subreference from each of range-begin and range-end parts.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.supportsversion","page":"API documentation","title":"CitableBase.supportsversion","text":"True for URN types that support versioning.\n\nsupportsversion(u)\n\n\n\n\n\n\nCite2Urns support version ids.\n\nsupportsversion(u)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.dropversion","page":"API documentation","title":"CitableBase.dropversion","text":"Urn subtypes should implement dropversion(urn::U)::U.\n\ndropversion(u)\n\n\n\n\n\n\nCreate a new Cite2Urn by dropping the version part of a given Cite2Urn.\n\ndropversion(u)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.addversion","page":"API documentation","title":"CitableBase.addversion","text":"Urn subtypes should implement addversion(urn::U, versionid)::U.  \n\naddversion(u, versioninfo)\n\n\n\n\n\n\nCreate a new Cite2Urn by setting the version part of a given Cite2Urn to a given value.\n\naddversion(u, versid)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.versionid","page":"API documentation","title":"CitableBase.versionid","text":"Urn subtypes should implement addversion(urn::U, versionid)::U.  \n\nversionid(u)\n\n\n\n\n\n\nversionid(u)\n\n\nExtract CITE2 collection identifer from a Cite2Urn.\n\nExamples\n\njulia>\nurn = Cite2Urn(\"urn:cite2:hmt:msA.v1:12r\")\ncollectionid(urn)\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.dropproperty","page":"API documentation","title":"CitableObject.dropproperty","text":"Create a new Cite2Urn by dropping the version part of a given Cite2Urn.\n\ndropproperty(u)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.addproperty","page":"API documentation","title":"CitableObject.addproperty","text":"Create a new Cite2Urn by setting the version part of a given Cite2Urn to a given value.\n\naddproperty(u, propid)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"Comparing a pair of Cite2Urns:","category":"page"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"urncontains\nurnequals\nurnsimilar","category":"page"},{"location":"apis/#CitableBase.urncontains","page":"API documentation","title":"CitableBase.urncontains","text":"URN-comparable objects must implement urncontains.\n\nurncontains(x, y)\n\n\n\n\n\n\nurncontains(u1, u2)\n\n\nTrue if  urn1 contains or is equal to urn2 accroding to URN logic.\n\n```\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.urnequals","page":"API documentation","title":"CitableBase.urnequals","text":"For subtypes of Urn, implement urnequals concretely.\n\nurnequals(u1, u2)\n\n\n\n\n\n\nURN-comparable objects must implement urnequals.\n\nurnequals(x, y)\n\n\n\n\n\n\nurnequals(urn1, urn2)\n\n\nOverride urnequals function for Cite2Urns.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableBase.urnsimilar","page":"API documentation","title":"CitableBase.urnsimilar","text":"URN-comparable objects must implement urnsimilar.\n\nurnsimilar(x, y)\n\n\n\n\n\n\nurnsimilar(urn1, urn2)\n\n\nOverride similar function to be true if urn1 and urn1 are similar by URN logic.\n\n\n\n\n\n","category":"function"},{"location":"apis/#CexUtils-submodule","page":"API documentation","title":"CexUtils submodule","text":"","category":"section"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"Finding data by URN value:","category":"page"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"CitableObject.CexUtils.properties\nCitableObject.CexUtils.collectiondata\nCitableObject.CexUtils.implementations\nCitableObject.CexUtils.data_for_model\nCitableObject.CexUtils.relations_for_model","category":"page"},{"location":"apis/#CitableObject.CexUtils.properties","page":"API documentation","title":"CitableObject.CexUtils.properties","text":"Find all property definitions in the CEX string s contained by u.\n\nproperties(s, u)\n\n\n\n\n\n\nFind all property definitions in blks contained by u.\n\nproperties(blks, u)\n\n\n\n\n\n\nDispatch properties on T.\n\nproperties(cexsrc, u, reader)\n\n\n\n\n\n\nFind all property definitions in CEX file filesrc contained by u.\n\nproperties(filesrc, u, freader)\n\n\n\n\n\n\nFind all property definitions in CEX at URL url contained by u.\n\nproperties(url, u, ureader)\n\n\n\n\n\n\nFind all property definitions in CEX at URL url contained by u.\n\nproperties(s, u, sreader)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.CexUtils.collectiondata","page":"API documentation","title":"CitableObject.CexUtils.collectiondata","text":"Find all data lines in blkscontained byu`.\n\ncollectiondata(blks, u; delimiter)\n\n\n\n\n\n\nFind all data lines in the CEX string s contained by u.\n\ncollectiondata(s, u; delimiter)\n\n\n\n\n\n\nDispatch collectiondata on T.\n\ncollectiondata(cexsrc, u, reader; delimiter)\n\n\n\n\n\n\nFind all data lines in CEX file filesrc contained by u.\n\ncollectiondata(filesrc, u, freader; delimiter)\n\n\n\n\n\n\nFind all data lines in CEX at URL url contained by u.\n\ncollectiondata(url, u, ureader; delimiter)\n\n\n\n\n\n\nFind all datalines in CEX s contained by u.\n\ncollectiondata(s, u, sreader; delimiter)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.CexUtils.implementations","page":"API documentation","title":"CitableObject.CexUtils.implementations","text":"Find Cite2Urns for all collections in s implementing datamodel.\n\nimplementations(s, datamodel; delimiter)\n\n\n\n\n\n\nFind Cite2Urns for all collections in blks implementing datamodel.\n\nimplementations(blks, datamodel; delimiter)\n\n\n\n\n\n\nDispatch implementations on T.\n\nimplementations(cexsrc, datamodel, reader; delimiter)\n\n\n\n\n\n\nFind  Cite2Urns for all collections in CEX file filesrc implementing datamodel.\n\nimplementations(filesrc, datamodel, freader; delimiter)\n\n\n\n\n\n\nFind  Cite2Urns for all collections in CEX file filesrc implementing datamodel.\n\nimplementations(url, datamodel, freader; delimiter)\n\n\n\n\n\n\nFind  Cite2Urns for all collections in CEX file filesrc implementing datamodel.\n\nimplementations(s, datamodel, freader; delimiter)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.CexUtils.data_for_model","page":"API documentation","title":"CitableObject.CexUtils.data_for_model","text":"Find all data lines in the CEX string s for collections implementing datamodel.\n\ndata_for_model(s, datamodel; delimiter)\n\n\n\n\n\n\nFind all data lines in blks for collections implementing datamodel.\n\ndata_for_model(blks, datamodel; delimiter)\n\n\n\n\n\n\nDispatch data_for_model on T.\n\ndata_for_model(cexsrc, datamodel, reader; delimiter)\n\n\n\n\n\n\nFind all data lines in file filesrc for collections implementing datamodel.\n\ndata_for_model(filesrc, datamodel, freader; delimiter)\n\n\n\n\n\n\nFind all data lines in content of url implementing datamodel.\n\ndata_for_model(url, datamodel, freader; delimiter)\n\n\n\n\n\n\nFind  all data lines in s implementing datamodel.\n\ndata_for_model(s, datamodel, freader; delimiter)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/#CitableObject.CexUtils.relations_for_model","page":"API documentation","title":"CitableObject.CexUtils.relations_for_model","text":"Find relations data for all relation sets in s implementing data model dm.\n\nrelations_for_model(s, dm)\n\n\n\n\n\n\nFind relations data for all relation sets in blks implementing data model dm.\n\nrelations_for_model(blks, dm)\n\n\n\n\n\n\nDispatch relations on T.\n\nrelations_for_model(cexsrc, dm, reader)\n\n\n\n\n\n\nFind relations data for all relation sets in CEX file filesrc implementing data model dm.\n\nrelations_for_model(filesrc, dm, freader)\n\n\n\n\n\n\nFind relations data for all relation sets from CEX at URL url implementing data model dm.\n\nrelations_for_model(url, dm, freader)\n\n\n\n\n\n\nFind relations data for all relation sets in s implementing data model dm.\n\nrelations_for_model(s, dm, freader)\n\n\n\n\n\n\n","category":"function"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"Finding human-readable labels by URN value:","category":"page"},{"location":"apis/","page":"API documentation","title":"API documentation","text":"CitableObject.CexUtils.cataloglabel","category":"page"},{"location":"apis/#CitableObject.CexUtils.cataloglabel","page":"API documentation","title":"CitableObject.CexUtils.cataloglabel","text":"Find catalog label, if any, for u in CEX source s. If no catalog found, compose machine-generated label.\n\ncataloglabel(s, u; delimiter)\n\n\n\n\n\n\nFind catalog label, if any, for u in CEX source s. If no catalog found, compose machine-generated label.\n\ncataloglabel(blks, u; delimiter)\n\n\n\n\n\n\nDispatch properties on T.\n\ncataloglabel(cexsrc, u, reader)\n\n\n\n\n\n\nFind catalog label, if any, in CEX file filesrc contained by u.\n\ncataloglabel(filesrc, u, freader)\n\n\n\n\n\n\nFind catalog label, if any, in CEX at URL url contained by u.\n\ncataloglabel(url, u, freader)\n\n\n\n\n\n\nFind catalog label, if any, in CEX at URL url contained by u.\n\ncataloglabel(s, u, sreader)\n\n\n\n\n\n\n","category":"function"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"using CiteEXchange\nroot = pwd() |> dirname |> dirname |> dirname\nf = joinpath(root, \"test\", \"data\", \"hmt-2022k.cex\")\ns = read(f) |> String\nu = \"https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex\" \nblks = blocks(s) ","category":"page"},{"location":"cexutils/relations/#Utilities-for-working-with-citable-relation-sets","page":"Citable relation sets","title":"Utilities for working with citable relation sets","text":"","category":"section"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"The citerelationset block of a CEX source defines a single citable object containing one or more relations among other citable content.  The Homer Multitext project data set that we used on the previous page, for example, includes relation sets recording that passages of text appear on particular pages of a manuscript.","category":"page"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"With the CexUtils submodule, you can collect relations data for a specific relation set, or for all relation sets belonging to a specified collection of relation sets.   ","category":"page"},{"location":"cexutils/relations/#Collect-relations-data-for-a-single-relation-set","page":"Citable relation sets","title":"Collect relations data for a single relation set","text":"","category":"section"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"urn:cite2:hmt:iliadindex.v1:e4 identifies a specific relation recording data for a single manuscript.","category":"page"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"using CitableObject\nusing CitableObject.CexUtils\nrelationset = Cite2Urn(\"urn:cite2:hmt:iliadindex.v1:e4\")\ne4_relations_string = relations(s, relationset)\nlength(e4_relations_string)","category":"page"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"Reading from different types of CEX sources produces equivalent results.","category":"page"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"using CitableBase: FileReader\nusing CitableBase: UrlReader\ne4_relations_blocks = relations(blocks(s), relationset)\ne4_relations_file = relations(f, relationset, FileReader)\ne4_relations_url = relations(u, relationset, UrlReader)\ne4_relations_string == e4_relations_blocks == e4_relations_file == e4_relations_url","category":"page"},{"location":"cexutils/relations/#Collect-relations-data-for-a-collection-of-relation-sets","page":"Citable relation sets","title":"Collect relations data for a collection of relation sets","text":"","category":"section"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"The Homer Multitext data include other relation sets belonging to the same collection.","category":"page"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"relationsetcollection = Cite2Urn(\"urn:cite2:hmt:iliadindex.v1:\")\ns_relations = relations(s, relationsetcollection)\nlength(s_relations)","category":"page"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"b_relations = relations(blocks(s), relationsetcollection)\nf_relations = relations(f, relationsetcollection, FileReader)\nu_relations = relations(u, relationsetcollection, UrlReader)\ns_relations == b_relations ==  f_relations == u_relations","category":"page"},{"location":"cexutils/relations/#Collect-relations-data-implementing-a-data-model","page":"Citable relation sets","title":"Collect relations data implementing a data model","text":"","category":"section"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"Like any other citable collection, collections of relation sets can be associated with a data model.  Use the relations_for_model function to collect all relations for relation sets implementing a model.  In our sample data set, all the relation ssets implementing the \"Text on page\" model belong to the same citable collection, so the results will be identical to the previous examples.","category":"page"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"model = Cite2Urn(\"urn:cite2:hmt:datamodels.v1:textonpage\")\ns_modeldata = relations_for_model(s, model)\nlength(s_modeldata)","category":"page"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"b_modeldata = relations_for_model(blocks(s), model)\nf_modeldata = relations_for_model(f, model, FileReader)\nu_modeldata = relations_for_model(u, model, UrlReader)\ns_modeldata == b_modeldata ==  f_modeldata == u_modeldata","category":"page"},{"location":"cexutils/relations/#Find-a-human-readable-label-for-a-relation-set","page":"Citable relation sets","title":"Find a human-readable label for a relation set","text":"","category":"section"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"The relationsetlabel function finds the description property of an individual relation set.","category":"page"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"dseurn = Cite2Urn(\"urn:cite2:hmt:hmtdse.v1:all\")\ns_label = relationsetlabel(s, dseurn)","category":"page"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"Or from any other source:","category":"page"},{"location":"cexutils/relations/","page":"Citable relation sets","title":"Citable relation sets","text":"b_label = relationsetlabel(blocks(s), dseurn)\nf_label = relationsetlabel(f, dseurn, FileReader)\nu_label = relationsetlabel(u, dseurn, UrlReader)\ns_label == b_label == f_label == u_label","category":"page"},{"location":"cexutils/relations/#Find-URN/label-pairs-for-relation-set-implementing-a-data-model","page":"Citable relation sets","title":"Find URN/label pairs for relation set implementing a data model","text":"","category":"section"},{"location":"cexutils/#Utilties-for-working-with-CEX-data:-the-CexUtils-module","page":"CEX utilities","title":"Utilties for working with CEX data: the CexUtils module","text":"","category":"section"},{"location":"cexutils/","page":"CEX utilities","title":"CEX utilities","text":"CEX is a plain-text format for organizing citable data.  As a file format, CEX does not specify what kinds of URN values may be used to identify scholarly resources.  The generically applicable Cite2Urn can be used to identify the contents of citable collections and sets of relations among citable resources.  The CexUtils submodule provides utilities for filtering and extracting content from CEX sources identified by Cite2Urns.","category":"page"},{"location":"#CitableObject.jl-Documentation","page":"Overview","title":"CitableObject.jl Documentation","text":"","category":"section"},{"location":"","page":"Overview","title":"Overview","text":"The CitableObject.jl module defines the Cite2Urn, a URN notation for canonically citing versioned objects.","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"A Cite2Urn can be instantiated from a string value. The generic show function displays this value to an IOStream.","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"using CitableObject\nurn = Cite2Urn(\"urn:cite2:hmt:msA.v1:12r\")","category":"page"},{"location":"#The-CexUtils-submodule","page":"Overview","title":"The CexUtils submodule","text":"","category":"section"},{"location":"","page":"Overview","title":"Overview","text":"CEX is a plain-text format for organizing citable data.  The CexUtils submodule  provides functions using Cite2Urns to identify and extract data from CEX sources.","category":"page"},{"location":"#Contents","page":"Overview","title":"Contents","text":"","category":"section"},{"location":"","page":"Overview","title":"Overview","text":"The following pages include:","category":"page"},{"location":"","page":"Overview","title":"Overview","text":"a brief user's guide to working with Cite2Urns\nan overview of the CexUtils submodule\nAPI documentation of public functions and types","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"root = pwd() |> dirname |> dirname |> dirname","category":"page"},{"location":"cexutils/collections/#Utilities-for-working-with-citable-collections","page":"Citable collections","title":"Utilities for working with citable collections","text":"","category":"section"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"In the CEX format, citedata blocks contain tables of data.  Metadata about the structure of these data can be added in citeproperties blocks.  Semantic models for those structures can be specified in datamodels blocks.  The CexUtils submodule simplifies coordinating these three facets of a collection: data, structural metadata, semantic model.","category":"page"},{"location":"cexutils/collections/#Data-used-in-these-examples","page":"Citable collections","title":"Data used in these examples","text":"","category":"section"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"The utility functions documented here are designed to work identically with multiple kinds of CEX sources: pure CEX strings, blocks of CEX data parsed into the CiteEXchange module's Block structure, files with CEX data, or CEX content located at a URL.","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"The examples in the following pages are illustrated using the hmt-2022k.cex published release of the Homer Multitext project, a complex CEX source with roughly 18 Mb of plain-text data.  A copy of that file is in the test/data directory of this repository. ","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"f = joinpath(root, \"test\", \"data\", \"hmt-2022k.cex\")\ns = read(f) |> String\nu = \"https://raw.githubusercontent.com/cite-architecture/CitableObject.jl/main/test/data/hmt-2022k.cex\" \nusing CiteEXchange\nblks = blocks(s) \n# Length in characters:\nlength(s)","category":"page"},{"location":"cexutils/collections/#Find-properties-of-a-citable-collection","page":"Citable collections","title":"Find properties of a citable collection","text":"","category":"section"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"urn:cite2:hmt:msB.v1: identifies a collection of images of a particular manuscript.  Let's use the CEX string to find structural metadata – the properties of that collection. (Concretely, that means finding the relevant content of all citeproperties blocks in the CEX source).","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"using CitableObject\nusing CitableObject.CexUtils\nmsbimgs = Cite2Urn(\"urn:cite2:hmt:msB.v1:\")\nsprops = properties(s, msbimgs)","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"We get the same result if we read a Vector of Blocks.","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"bprops = properties(blks, msbimgs)\nsprops == bprops","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"We can also read from files or URL sources.","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"using CitableBase: FileReader\nfprops = properties(f, msbimgs, FileReader)\n\nusing CitableBase: UrlReader\nuprops = properties(u, msbimgs, UrlReader)\n\nfprops == uprops == sprops","category":"page"},{"location":"cexutils/collections/#Find-data-lines-of-a-citable-collection","page":"Citable collections","title":"Find data lines of a citable collection","text":"","category":"section"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"Now let's find the data for the same collection (that is, the relevant content of all citedata blocks in the CEX source).","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"We can use a pure string of CEX data.","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"sdata = collectiondata(s, msbimgs)\nlength(sdata)","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"Or again, we can read from files, URLs, or lists of Blocks.","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"bdata = collectiondata(blks, msbimgs)\nfdata = collectiondata(f, msbimgs, FileReader)\nudata = collectiondata(u, msbimgs, UrlReader)\n\nlength(sdata) == length(bdata) == length(fdata) == length(udata)","category":"page"},{"location":"cexutils/collections/#Find-collections-implementing-a-datamodel","page":"Citable collections","title":"Find collections implementing a datamodel","text":"","category":"section"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"Like everything else in the CITE architecture, we identify data models with a URN. The Homer Multitext project defines a data model for the structure of a manuscript (or codex).","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"model = Cite2Urn(\"urn:cite2:hmt:datamodels.v1:codexmodel\")","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"We can find Cite2Urns for all collections implementing this model.","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"implementations(s, model)","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"The results are the same no matter what kind of source we read from.","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"bmodelurns = implementations(blks, msbimgs)\nfmodelurns = implementations(f, msbimgs, FileReader)\numodelurns = implementations(u, msbimgs, UrlReader)\n\nbmodelurns == fmodelurns == umodelurns","category":"page"},{"location":"cexutils/collections/#Find-collection-data-for-a-datamodel","page":"Citable collections","title":"Find collection data for a datamodel","text":"","category":"section"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"We could manually collect URNs for collections implementing a data model, then find data for each collection, but with the data_for_model function we can collect all data for all collections implementing a model in a single step.","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"s_implementingdata = data_for_model(s, model)","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"Of course this works with any CEX source.","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"b_implementingdata = data_for_model(blks, model)\nf_implementingdata = data_for_model(f, model, FileReader) \nu_implementingdata =  data_for_model(u, model, UrlReader)\ns_implementingdata == b_implementingdata == f_implementingdata == u_implementingdata","category":"page"},{"location":"cexutils/collections/#Find-a-human-readable-label-for-a-collection","page":"Citable collections","title":"Find a human-readable label for a collection","text":"","category":"section"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"The cataloglabel function finds the description property of the catalog entry for a given collection.  (If the collection is not cataloged, it generates a generic label.)","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"msb = Cite2Urn(\"urn:cite2:hmt:msB.v1:\")\ns_label = cataloglabel(s, msb)","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"Or from any other source:","category":"page"},{"location":"cexutils/collections/","page":"Citable collections","title":"Citable collections","text":"b_label = cataloglabel(blocks(s), msb)\nf_label = cataloglabel(f, msb, FileReader)\nu_label = cataloglabel(u, msb, UrlReader)\ns_label == b_label == f_label == u_label","category":"page"},{"location":"cexutils/collections/#Find-URN/label-pairs-for-collections-implementing-a-data-model","page":"Citable collections","title":"Find URN/label pairs for collections implementing a data model","text":"","category":"section"}]
}
