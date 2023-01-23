/* JADE COMMAND FILE NAME D:\Documents\OdbcWP\ModelODBC.jcf */
jadeVersionNumber "6.3.04";
schemaDefinition
ErewhonInvestmentsModelSchema subschemaOf CommonSchema partialDefinition, patchVersion=1000, patchVersioningEnabled = true;
constantDefinitions
localeDefinitions
	5129 "English (New Zealand)" schemaDefaultLocale;
	10249 "English (Belize)" _cloneOf 5129;
	1033 "English (United States)" _cloneOf 5129;
	11273 "English (Trinidad and Tobago)" _cloneOf 5129;
	2057 "English (United Kingdom)" _cloneOf 5129;
	3081 "English (Australia)" _cloneOf 5129;
	4105 "English (Canada)" _cloneOf 5129;
	6153 "English (Ireland)" _cloneOf 5129;
	7177 "English (South Africa)" _cloneOf 5129;
	8201 "English (Jamaica)" _cloneOf 5129;
	9225 "English (Caribbean)" _cloneOf 5129;
libraryDefinitions
typeHeaders
	SoftAttribute subclassOf Object abstract, transient, highestSubId = 1, highestOrdinal = 8, number = 2049;
	SoftPrimitiveAttribute subclassOf SoftAttribute abstract, transient, number = 2080;
	SoftBooleanAttribute subclassOf SoftPrimitiveAttribute highestSubId = 1, highestOrdinal = 1, number = 2062;
	SoftIntegerAttribute subclassOf SoftPrimitiveAttribute highestSubId = 1, highestOrdinal = 1, number = 2065;
	SoftStringAttribute subclassOf SoftPrimitiveAttribute highestSubId = 1, highestOrdinal = 3, number = 2061;
	SoftJadeFeature subclassOf SoftAttribute abstract, transient, highestOrdinal = 3, number = 2081;
	SoftMethod subclassOf SoftJadeFeature highestOrdinal = 4, number = 2076;
	SoftProperty subclassOf SoftJadeFeature highestOrdinal = 1, number = 2078;
	SoftEntity subclassOf Object highestSubId = 1, highestOrdinal = 5, number = 2048;
	SoftValue subclassOf Object abstract, transient, highestOrdinal = 3, number = 2052;
	SoftBooleanValue subclassOf SoftValue highestOrdinal = 1, number = 2055;
	SoftIntegerValue subclassOf SoftValue highestOrdinal = 1, number = 2054;
	SoftStringValue subclassOf SoftValue highestOrdinal = 2, number = 2053;
	SoftAttributes subclassOf MemberKeyDictionary loadFactor = 66, number = 2051;
	SoftBooleanValuesByValue subclassOf MemberKeyDictionary duplicatesAllowed, loadFactor = 66, number = 2074;
	SoftEntities subclassOf MemberKeyDictionary loadFactor = 66, number = 2050;
	SoftIntegerValuesByValue subclassOf MemberKeyDictionary duplicatesAllowed, loadFactor = 66, number = 2066;
	SoftStringValuesByValue subclassOf MemberKeyDictionary duplicatesAllowed, loadFactor = 66, number = 2056;
	SoftValues subclassOf MemberKeyDictionary loadFactor = 66, number = 2058;
	SoftValuesSet subclassOf ObjectSet loadFactor = 98, number = 2059;
 
interfaceDefs
 
membershipDefinitions
	SoftAttributes of SoftAttribute ;
	SoftBooleanValuesByValue of SoftBooleanValue ;
	SoftEntities of SoftEntity ;
	SoftIntegerValuesByValue of SoftIntegerValue ;
	SoftStringValuesByValue of SoftStringValue ;
	SoftValues of SoftValue ;
	SoftValuesSet of SoftValue ; 

typeDefinitions
	ModelEntity
	(
	referenceDefinitions
		allSoftValues:                 SoftValues   explicitInverse, subId = 1, number = 1, ordinal = 1;
	)
 
	Company
	(
	referenceDefinitions
		allSoftEntities:               SoftEntities   explicitInverse, subId = 7, number = 8, ordinal = 8;
	)
 
	SoftAttribute completeDefinition
	(
	attributeDefinitions
		attributeName:                 String[31] number = 1, ordinal = 1;
	referenceDefinitions
		myEntity:                      SoftEntity   explicitEmbeddedInverse, number = 5, ordinal = 5;
	)
	SoftPrimitiveAttribute completeDefinition
	(
	)
	SoftBooleanAttribute completeDefinition
	(
	referenceDefinitions
		allSoftBooleanValues:          SoftBooleanValuesByValue   explicitInverse, subId = 1, number = 1, ordinal = 1;
	)
	SoftIntegerAttribute completeDefinition
	(
	referenceDefinitions
		allSoftIntegerValues:          SoftIntegerValuesByValue   explicitInverse, subId = 1, number = 1, ordinal = 1;
	)
	SoftStringAttribute completeDefinition
	(
	attributeDefinitions
		attributeLength:               Integer number = 2, ordinal = 3;
	referenceDefinitions
		allSoftStringValues:           SoftStringValuesByValue   explicitInverse, subId = 1, number = 1, ordinal = 2;
	)
	SoftJadeFeature completeDefinition
	(
	attributeDefinitions
		attributeLength:               Integer number = 1, ordinal = 1;
		attributeType:                 String[31] number = 3, ordinal = 3;
		classNumber:                   Integer number = 2, ordinal = 2;
	)
	SoftMethod completeDefinition
	(
	)
	SoftProperty completeDefinition
	(
	)
	SoftEntity completeDefinition
	(
	attributeDefinitions
		classNumber:                   Integer number = 3, ordinal = 3;
		tableName:                     String[31] number = 1, ordinal = 1;
	referenceDefinitions
		allAttributes:                 SoftAttributes   explicitInverse, subId = 1, number = 4, ordinal = 4;
		myCompany:                     Company   explicitEmbeddedInverse, number = 2, ordinal = 5;
	)
	SoftValue completeDefinition
	(
	referenceDefinitions
		myAttribute:                   SoftAttribute   explicitEmbeddedInverse, number = 2, ordinal = 2;
		myInstance:                    ModelEntity   explicitEmbeddedInverse, number = 1, ordinal = 3;
	)
	SoftBooleanValue completeDefinition
	(
	attributeDefinitions
		boolValue:                     Boolean number = 1, ordinal = 1;
	)
	SoftIntegerValue completeDefinition
	(
	attributeDefinitions
		intValue:                      Integer number = 1, ordinal = 1;
	)
	SoftStringValue completeDefinition
	(
	attributeDefinitions
		stringValue:                   String[501] number = 1, ordinal = 1;
	)
	SoftAttributes completeDefinition
	(
	)
	SoftBooleanValuesByValue completeDefinition
	(
	)
	SoftEntities completeDefinition
	(
	)
	SoftIntegerValuesByValue completeDefinition
	(
	)
	SoftStringValuesByValue completeDefinition
	(
	)
	SoftValues completeDefinition
	(
	)
	SoftValuesSet completeDefinition
	(
	)
 
memberKeyDefinitions
	SoftAttributes completeDefinition
	(
		attributeName;
	)
	SoftBooleanValuesByValue completeDefinition
	(
		boolValue;
	)
	SoftEntities completeDefinition
	(
		tableName;
	)
	SoftIntegerValuesByValue completeDefinition
	(
		intValue;
	)
	SoftStringValuesByValue completeDefinition
	(
		stringValue;
	)
	SoftValues completeDefinition
	(
		myAttribute.attributeName;
	)

inverseDefinitions
	allSoftValues of ModelEntity automatic peerOf myInstance of SoftValue manual;
	allSoftEntities of Company automatic peerOf myCompany of SoftEntity manual;
	allAttributes of SoftEntity automatic parentOf myEntity of SoftAttribute manual;
	allSoftBooleanValues of SoftBooleanAttribute automatic parentOf myAttribute of SoftValue manual;
	allSoftIntegerValues of SoftIntegerAttribute automatic parentOf myAttribute of SoftValue manual;
	allSoftStringValues of SoftStringAttribute automatic parentOf myAttribute of SoftValue manual;
databaseDefinitions
ErewhonInvestmentsModelSchema
	(
	databaseFileDefinitions
		"erecustomize" number=51;
		"eredef" number=106;
	defaultFileDefinition "eredef";
	classMapDefinitions
		ModelEntity in "eredef";
		Company in "eredef";
		SoftAttribute in "erecustomize";
		SoftPrimitiveAttribute in "erecustomize";
		SoftBooleanAttribute in "erecustomize";
		SoftIntegerAttribute in "erecustomize";
		SoftStringAttribute in "erecustomize";
		SoftJadeFeature in "erecustomize";
		SoftMethod in "erecustomize";
		SoftProperty in "erecustomize";
		SoftEntity in "erecustomize";
		SoftValue in "erecustomize";
		SoftBooleanValue in "erecustomize";
		SoftIntegerValue in "erecustomize";
		SoftStringValue in "erecustomize";
		SoftAttributes in "erecustomize";
		SoftBooleanValuesByValue in "erecustomize";
		SoftEntities in "erecustomize";
		SoftIntegerValuesByValue in "erecustomize";
		SoftStringValuesByValue in "erecustomize";
		SoftValues in "erecustomize";
		SoftValuesSet in "erecustomize";
	)
externalFunctionSources
typeSources
