jadeVersionNumber "99.0.00";
schemaDefinition
ErewhonInvestmentsODBC subschemaOf ErewhonInvestmentsModelSchema completeDefinition;
constantDefinitions
	categoryDefinition ApplicationNamesODBC
		OdbcNonGuiApp:                 String = "OdbcNonGui";
		OdbcServerApp:                 String = "OdbcServer";
	categoryDefinition ExceptionsODBC
		OdbcInvalidInterfaceException: Integer = 15100;
localeDefinitions
	5129 "English (New Zealand)" schemaDefaultLocale;
translatableStringDefinitions
5129 "English (New Zealand)"
	(
	ErrVwDatabaseNotInitialized = "The database has not been initialized.  Please execute the 'initializeData' JadeScript.";
	ErrVwNoSoftEntities="No Soft Entities defined.  Run script 'createAllSoftValues' to create Soft Entities";
	ErrVwSoftEntitesAlreadyExist = "Soft Entities already exist. Please execute the 'deleteSoftEntities' script to delete.";
	ErrVwSoftEntitiesAlreadyInRV="Soft Entites already defined in Relational View";
	Error = "Error";
	)
typeHeaders
	ErewhonInvestmentsODBC subclassOf ErewhonInvestmentsModelApp transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed;
	GErewhonInvestmentsODBC subclassOf GErewhonInvestmentsModelSchema transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed;
	OdbcSession subclassOf Object transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed;
	QueryNode subclassOf Object abstract, transient, subclassSharedTransientAllowed, subclassTransientAllowed;
	LeafNode subclassOf QueryNode transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed;
	OperatorNode subclassOf QueryNode transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed;
	QueryProvider subclassOf Object transient, sharedTransientAllowed, transientAllowed, subclassSharedTransientAllowed, subclassTransientAllowed;
	SErewhonInvestmentsODBC subclassOf SErewhonInvestmentsModelSchema transient;
	SaleItemsByRegionAndPrice subclassOf ExtKeyDictionary duplicatesAllowed, loadFactor = 66;
membershipDefinitions
	SaleItemsByRegionAndPrice of SaleItem;
typeDefinitions
	Object completeDefinition
	(
	)
	Application completeDefinition
	(
	)
	RootSchemaApp completeDefinition
	(
	)
	CommonSchemaApp completeDefinition
	(
	)
	ErewhonInvestmentsModelApp completeDefinition
	(
	)
	ErewhonInvestmentsODBC completeDefinition
	(
	referenceDefinitions
		myQueryProvider:               QueryProvider ;
		zMyClient:                     Client ;
	jadeMethodDefinitions
		endOdbcSession(sessionObject: Object);
		finalizeOdbcSelect(
			rv: RelationalView; 
			username: String);
		finalizeOdbcServer();
		getClient(): Client;
		initializeOdbcSelect(
			rv: RelationalView; 
			username: String);
		initializeOdbcServer();
		setClient(value: Client) updating;
		startOdbcSession(
			rv: RelationalView; 
			username: String);
	)
	Global completeDefinition
	(
	)
	RootSchemaGlobal completeDefinition
	(
	)
	GCommonSchema completeDefinition
	(
	)
	GErewhonInvestmentsModelSchema completeDefinition
	(
	)
	GErewhonInvestmentsODBC completeDefinition
	(
	jadeMethodDefinitions
		getAndValidateUser(
			usercode: String output; 
			password: String output): Boolean;
		isUserValid(
			usercode: String; 
			password: String): Boolean;
	)
	JadeScript completeDefinition
	(
	jadeMethodDefinitions
		addSoftEntitiesToRV();
		createAllSoftValues();
		createSoftEntity(
			className: String; 
			classNumber: Integer): SoftEntity;
		deleteSoftEntities();
		deleteSoftEntitiesFromRV();
		sampleIsAttributeValid();
	)
	ModelEntity completeDefinition
	(
	jadeMethodDefinitions
		getSoftValue(attribute: SoftAttribute): Any;
	)
	Company completeDefinition
	(
	jadeMethodDefinitions
		getSaleItemsByRegionByCost(
			regionName: String; 
			minPrice: Decimal; 
			maxPrice: Decimal): SaleItemsByRegionAndPrice;
	)
	SaleItem completeDefinition
	(
	jadeMethodDefinitions
		getMySaleStatus(): String;
	)
	TenderSaleItem completeDefinition
	(
	jadeMethodDefinitions
		getMySaleStatus(): String;
	)
	OdbcSession completeDefinition
	(
		documentationText
`Transient only odbc session information. 
Used when running the ODBC Server Application and Thin Client.`
	attributeDefinitions
		userName:                      String[31];
	referenceDefinitions
		zMyClient:                     Client ;
		documentationText
`Client instance for this username (if any).  
If the thin client username is not a valid client, this will be null.`
	)
	QueryNode completeDefinition
	(
	referenceDefinitions
		parentNode:                    QueryNode   explicitEmbeddedInverse;
	jadeMethodDefinitions
		isLeafLiteral(litValue: Any io): Boolean;
		isLeafNode(): Boolean abstract;
		isLeafNonLiteral(obj: Object io): Boolean;
		isLeafSoftAttribute(softAttr: SoftAttribute io): Boolean;
		isOperatorNode(): Boolean abstract;
	)
	LeafNode completeDefinition
	(
	referenceDefinitions
		value:                         Object ;
	jadeMethodDefinitions
		delete() updating;
		isLeafLiteral(litValue: Any io): Boolean;
		isLeafNode(): Boolean;
		isLeafNonLiteral(obj: Object io): Boolean;
		isLeafSoftAttribute(softAttr: SoftAttribute io): Boolean;
		isOperatorNode(): Boolean;
	)
	OperatorNode completeDefinition
	(
	attributeDefinitions
		operator:                      Integer;
	referenceDefinitions
		leftNode:                      QueryNode   explicitEmbeddedInverse;
		rightNode:                     QueryNode   explicitEmbeddedInverse;
	jadeMethodDefinitions
		isLeafNode(): Boolean;
		isOperatorNode(): Boolean;
	)
	QueryProvider completeDefinition
	(
	referenceDefinitions
		myResultSet:                   ObjectSet ;
	jadeMethodDefinitions
		compareAny(
			leftValue: Any; 
			rightValue: Any; 
			operator: Integer): Boolean;
		executeMethodLeaf(
			operator: Integer; 
			leftAttr: Method; 
			rightNode: LeafNode; 
			results: ObjectSet io): Boolean;
		executePrimAttributeLeaf(
			operator: Integer; 
			leftAttr: PrimAttribute; 
			rightNode: LeafNode; 
			results: ObjectSet io): Boolean;
		executeQuery(
			queryNode: OperatorNode; 
			results: ObjectSet io): Boolean;
		executeQueryNot(
			queryNode: QueryNode; 
			results: ObjectSet): Boolean;
		executeSoftAttrToAttrCompare(
			softAttr: SoftAttribute; 
			operator: Integer; 
			rightOperand: Object; 
			results: ObjectSet io): Boolean;
		executeSoftAttrValueToLiteral(
			leftAttr: SoftPrimitiveAttribute; 
			operator: Integer; 
			rightValue: Any; 
			results: ObjectSet io): Boolean;
		executeSoftAttributeLeaf(
			operator: Integer; 
			leftAttr: SoftAttribute; 
			rightNode: LeafNode; 
			results: ObjectSet io): Boolean;
		executeSoftFeatureToLiteral(
			operator: Integer; 
			softAttr: SoftJadeFeature; 
			rightValue: Any; 
			results: ObjectSet io): Boolean;
		getOperandValue(
			obj: Object; 
			operand: Object): Any;
		jrq_BinaryExpression(
			operator: Integer; 
			leftOperand: Object io; 
			rightOperand: Any io; 
			level: Integer): Object updating;
		jrq_ExecuteQuery(expression: Object io): Boolean updating;
		jrq_FinalizeQuery(expression: Object io) updating;
		jrq_GetResultSet(): Collection;
		jrq_UnaryExpression(
			operator: Integer; 
			operand: Object io; 
			level: Integer): Object updating;
	implementInterfaces
		JadeRelationalQueryProviderIF
		(
			binaryExpression is jrq_BinaryExpression;
			executeQuery is jrq_ExecuteQuery;
			finalizeQuery is jrq_FinalizeQuery;
			getResultSet is jrq_GetResultSet;
			unaryExpression is jrq_UnaryExpression;
		)
	)
	SoftAttribute completeDefinition
	(
	jadeMethodDefinitions
		createSoftValue(
			entity: ModelEntity; 
			value: Any) abstract;
		getAttributeType(): String abstract;
		getJadeType(): Type abstract;
		getLength(): Integer abstract;
		getNullValue(): Any abstract;
		isJadeFeature(): Boolean abstract;
		jra_GetJadeType(): Type;
		jra_GetLength(): Integer;
		jra_GetSQLName(): String;
		jra_GetScaleFactor(): Integer;
	implementInterfaces
		JadeRelationalAttributeIF
		(
			getJadeType is jra_GetJadeType;
			getLength is jra_GetLength;
			getSQLName is jra_GetSQLName;
			getScaleFactor is jra_GetScaleFactor;
		)
	)
	SoftJadeFeature completeDefinition
	(
	jadeMethodDefinitions
		createSoftValue(
			entity: ModelEntity; 
			value: Any);
		getAttributeType(): String;
		getJadeType(): Type;
		getLength(): Integer;
		getNullValue(): Any;
		getValueForObject(obj: Object): Any abstract;
		initialize(
			cls: Class; 
			attrName: String; 
			attrType: String; 
			attrLength: Integer; 
			softEntity: SoftEntity) updating;
		isJadeFeature(): Boolean;
	)
	SoftMethod completeDefinition
	(
	jadeMethodDefinitions
		getValueForObject(obj: Object): Any;
	)
	SoftProperty completeDefinition
	(
	jadeMethodDefinitions
		getValueForObject(obj: Object): Any;
	)
	SoftPrimitiveAttribute completeDefinition
	(
	jadeMethodDefinitions
		createIterator(): Iterator abstract;
		getAtKeyGeqStartObject(key: Any): Object abstract;
		getAtKeyGtrStartObject(key: Any): Object abstract;
		getAtKeyStartObject(key: Any): Object abstract;
		initialize(
			attrName: String; 
			attrLength: Integer; 
			softEntity: SoftEntity) updating;
		isJadeFeature(): Boolean;
	)
	SoftBooleanAttribute completeDefinition
	(
	jadeMethodDefinitions
		createIterator(): Iterator;
		createSoftValue(
			entity: ModelEntity; 
			value: Any);
		getAtKeyGeqStartObject(key: Any): Object;
		getAttributeType(): String;
		getJadeType(): Type;
		getNullValue(): Any;
		jra_GetLength(): Integer;
	)
	SoftIntegerAttribute completeDefinition
	(
	jadeMethodDefinitions
		createIterator(): Iterator;
		createSoftValue(
			entity: ModelEntity; 
			value: Any);
		getAtKeyGeqStartObject(key: Any): Object;
		getAtKeyGtrStartObject(key: Any): Object;
		getAtKeyStartObject(key: Any): Object;
		getAttributeType(): String;
		getJadeType(): Type;
		getLength(): Integer;
		getNullValue(): Any;
	)
	SoftStringAttribute completeDefinition
	(
	jadeMethodDefinitions
		createIterator(): Iterator;
		createSoftValue(
			entity: ModelEntity; 
			value: Any);
		getAtKeyGeqStartObject(key: Any): Object;
		getAtKeyGtrStartObject(key: Any): Object;
		getAtKeyStartObject(key: Any): Object;
		getAttributeType(): String;
		getJadeType(): Type;
		getLength(): Integer;
		getNullValue(): Any;
		initialize(
			attrName: String; 
			attrLength: Integer; 
			softEntity: SoftEntity) updating;
	)
	SoftEntity completeDefinition
	(
	jadeMethodDefinitions
		createSoftAttributeMethod(
			methodClass: Class; 
			methodName: String; 
			attrType: String; 
			attrLength: Integer): SoftAttribute;
		createSoftAttributeProperty(
			propertyClass: Class; 
			propertyName: String; 
			propertyType: String; 
			propertyLength: Integer): SoftAttribute;
		createSoftAttributeType(attrType: String): SoftAttribute;
		createSoftAttributeValue(
			attrName: String; 
			attrType: String; 
			attrLength: Integer): SoftAttribute;
		initialize(
			clsName: String; 
			clsNumber: Integer) updating;
		jre_AllInstances(): Collection;
		jre_CallIFAllInstances(): Boolean;
		jre_GetJadeClass(): Class;
		jre_GetPropertyValue(
			entity: Object; 
			attributeDesc: JadeRelationalAttributeIF): Any;
		jre_GetQueryProvider(): JadeRelationalQueryProviderIF;
		jre_GetSQLName(): String;
		jre_IsAttributeValid(attributeDesc: Object): Boolean;
	implementInterfaces
		JadeRelationalEntityIF
		(
			allInstances is jre_AllInstances;
			callIFAllInstances is jre_CallIFAllInstances;
			getJadeClass is jre_GetJadeClass;
			getPropertyValue is jre_GetPropertyValue;
			getQueryProvider is jre_GetQueryProvider;
			getSQLName is jre_GetSQLName;
			isAttributeValid is jre_IsAttributeValid;
		)
	)
	SoftValue completeDefinition
	(
	jadeMethodDefinitions
		getValue(): Any abstract;
	)
	SoftBooleanValue completeDefinition
	(
	jadeMethodDefinitions
		getValue(): Any;
	)
	SoftIntegerValue completeDefinition
	(
	jadeMethodDefinitions
		getValue(): Any;
	)
	SoftStringValue completeDefinition
	(
	jadeMethodDefinitions
		getValue(): Any;
	)
	WebSession completeDefinition
	(
	)
	RootSchemaSession completeDefinition
	(
	)
	SCommonSchema completeDefinition
	(
	)
	SErewhonInvestmentsModelSchema completeDefinition
	(
	)
	SErewhonInvestmentsODBC completeDefinition
	(
	)
	Collection completeDefinition
	(
	)
	Btree completeDefinition
	(
	)
	Dictionary completeDefinition
	(
	)
	ExtKeyDictionary completeDefinition
	(
	)
	SaleItemsByRegionAndPrice completeDefinition
	(
	)
externalKeyDefinitions
	SaleItemsByRegionAndPrice completeDefinition
	(
		regionName:                  String[81];
		price:                       Decimal[12,2];
	)
inverseDefinitions
	rightNode of OperatorNode manual parentOf parentNode of QueryNode automatic;
	leftNode of OperatorNode manual parentOf parentNode of QueryNode automatic;

databaseDefinitions
	ErewhonInvestmentsODBCDb
	(
	databaseFileDefinitions
		"erewhonodbc";
	defaultFileDefinition "erewhonodbc";
	classMapDefinitions
		ErewhonInvestmentsODBC in "_usergui";
		GErewhonInvestmentsODBC in "erewhonodbc";
		LeafNode in "erecustomize";
		OdbcSession in "erecustomize";
		OperatorNode in "erecustomize";
		QueryNode in "erecustomize";
		QueryProvider in "erecustomize";
		SErewhonInvestmentsODBC in "_environ";
		SaleItemsByRegionAndPrice in "erecustomize";
	)
typeSources
	ErewhonInvestmentsODBC (
	jadeMethodSources
endOdbcSession
{
endOdbcSession(sessionObject: Object);

// This method is called when the connection from the Thin Client is disconnected. 
// This routine may be used to delete the shared transient session object and perform 
// any other clean up code required. 

// In this implementation, the session information for the Thin Client username is deleted.

vars
	os : OdbcSession;
begin
	write method.name;
	if sessionObject <> null then
		beginTransientTransaction;
		os := sessionObject.OdbcSession;
		delete os;
		commitTransientTransaction;
	endif;
end;
}
finalizeOdbcSelect
{
finalizeOdbcSelect(rv: RelationalView; username: String);

// This method is called when the SELECT statement processing is completed. 
// This routine may be used to clear any app context which may have been set for the user. 
// The next call on this thread may be for a different user.

vars
begin
	write method.name;
	app.setClient(null);
end;
}
finalizeOdbcServer
{
finalizeOdbcServer();

// finalize routine for the ODBC Server Application
// calls RootSchema method to finalize workers

vars

begin
	app.odbcWorkerFinalize;
end;
}
getClient
{
getClient() : Client;
// --------------------------------------------------------------------------------
// Method:		getClient
//
// Purpose:		Returns the (Shop) Client reference
//
// Parameters:	None
//
// Returns:		A reference to the Client instance
// --------------------------------------------------------------------------------
/*
*/
begin
	return self.zMyClient;
end;
}
initializeOdbcSelect
{
initializeOdbcSelect(rv: RelationalView; username: String);

// This method is called when a SELECT statement is to be executed.  
// All user methods for the columns will be called on this thread.  
// This routine may be used to set up the app data as required for this user. 

// The code may call app.getOdbcSessionObject() to retrieve the appropriate 
// session object for this user, if this has be created and saved previously.   

// In this implementation, get the session object and set app.zMyClient for the correct client (if any)

// If the SaleItem:: getMySaleStatus() method is called during the SELECT execution, 
// it will return the correct value based on the correct app.zMyClient value, which may 
// be null if the ODBC login name is not a valid client.

vars
	os : OdbcSession;
begin
	write method.name;
	os := getOdbcSessionObject.OdbcSession;
	if os = null then
		write "Null ODBC Session object";
	else
		if os.userName <> username then
			write "SessionObject username=" & os.userName & ";  select username=" & username;
		else
			app.setClient(os.zMyClient);
		endif;
	endif;
end;
}
initializeOdbcServer
{
initializeOdbcServer();

// initialization routine for the ODBC Server Application
// calls RootSchema method to initialize workers

vars

begin
	app.odbcWorkerInitialize;
end;
}
setClient
{
setClient(value: Client) updating;
// --------------------------------------------------------------------------------
// Method:		setClient
//
// Purpose:		Updates the reference to the Client User
//
// Parameters:	value - A reference to the Client User instance
//
// Returns:		Nothing
// --------------------------------------------------------------------------------
/*
*/
begin
	self.zMyClient := value;
end;
}
startOdbcSession
{
startOdbcSession(rv: RelationalView; username: String);

//   This method is called when the connection from the Thin Client is established, 
//   after Global::isUserValid has been called to verify the validity of the username. 
//   This routine may be used to create a shared transient session object to save any 
//   required user context information for this session.   
//   The code may call app.setOdbcSessionObject(sessionObject) to save the session object 
//   for later retrieval using app.getOdbcSessionObject.   This is required because app cannot 
//   be used to save the session since the next call for this Thin Client may be on a different worker,
//   and the next call on this worker may be for a different Thin Client.

// 	 In this implementation, the value of zMyClient will be null if the user name is not a valid client.
//   This is valid in this application.  If this were not the case, the username value should be checked 
//   in Global::isValidUser and false returned if the userName is not a valid Client.

vars
	os :OdbcSession;
begin
	write method.name;
	beginTransientTransaction;
	create os sharedTransient;
	os.userName := username;
	os.zMyClient := Company.firstInstance.allClients[username];
	commitTransientTransaction;
	setOdbcSessionObject(os);
end;
}
	)
	GErewhonInvestmentsODBC (
	jadeMethodSources
getAndValidateUser
{
getAndValidateUser(usercode: String output; password: String output): Boolean;

vars

begin
	if app.name = OdbcServerApp then
		return true;
	endif;
	return inheritMethod(usercode, password);
end;
}
isUserValid
{
isUserValid(usercode: String; password: String): Boolean;

vars

begin
	if app.name = OdbcNonGuiApp or
	   app.name = OdbcServerApp then
	   return true;
	endif;
	return inheritMethod(usercode, password);
end;
}
	)
	JadeScript (
	jadeMethodSources
addSoftEntitiesToRV
{
addSoftEntitiesToRV();

vars
	rv				: RelationalView;
	company			: Company;
	customEntity	: SoftEntity;
	customAttribute	: SoftAttribute;

begin
	rv := currentSchema.getRelationalView("SoftEntitiesOdbc");
	if rv = null then
		app.raiseModelException(OdbcInvalidInterfaceException);
	endif;
	company := Company.firstInstance;
	if company = null then
		app.msgBox($ErrVwDatabaseNotInitialized, $Error, MsgBox_Stop_Icon + MsgBox_OK_Only);
		return;
	endif;	
	if company.allSoftEntities.size = 0 then
		app.msgBox($ErrVwNoSoftEntities, $Error, MsgBox_Stop_Icon + MsgBox_OK_Only);
		return;
	endif;
	if rv.tableExists(company.allSoftEntities.first.tableName) then
		app.msgBox($ErrVwSoftEntitiesAlreadyInRV, $Error, MsgBox_Stop_Icon + MsgBox_OK_Only);
		return;
	endif;	
	beginTransaction;
	foreach customEntity in company.allSoftEntities do
		rv.addUserTable(customEntity, true, false);
		foreach customAttribute in customEntity.allAttributes do
			rv.addUserAttribute(customEntity, customAttribute);
		endforeach;
	endforeach;
	commitTransaction;
end;
}
createAllSoftValues
{
createAllSoftValues();

// 
// creates Soft Attributes on the classes Agent, Client and Country
// creates Soft Entity called Person which will be mapped to Agent and Client class instances

// on Agent, create and populate the Soft Attribute "agentNumber" which is an Integer value
//             this is defined on all existing Agent instances
// on Client, create and populate the Soft Attribute "current" which is a Boolean value
//             this is defined on all existing Client instances
// on Country, create and populate the Soft Attribute "Continent" which is a String of length 50
//             this is defined on selected Country instances
// on Person, create and populate the Soft Attribute "Nickname" which is a String of length 80
//             this is defined on selected Agent and Client instances
//            create a Soft Attribute for Jade property "name" (defined on AddressableEntity)
//            create a Soft Attribute for Jade method "getNameAndAddress (defined on AddressableEntity)

vars
	softEntity		: SoftEntity;
	softAttribute	: SoftAttribute;
	company			: Company;
	agent			: Agent;
	client			: Client;
	country			: Country;
	number			: Integer;
	bool			: Boolean;
begin
	company := Company.firstInstance;
	if company = null then
		app.msgBox($ErrVwDatabaseNotInitialized, $Error, MsgBox_Stop_Icon + MsgBox_OK_Only);
		return;
	endif;
	if company.allSoftEntities.size <> 0 then
		app.msgBox($ErrVwSoftEntitesAlreadyExist, $Error, MsgBox_Stop_Icon + MsgBox_OK_Only);
		return;
	endif;		
	// create softizedEntity for each class in ModelEntity which will have softized attributes
	//    Note: this could be any or all 
	createSoftEntity("Agent", Agent.number);
	createSoftEntity("Client", Client.number);
	createSoftEntity("Country", Country.number);
	createSoftEntity("SaleItem", SaleItem.number);
	
	// create soft table Person - which will be defined to be Clients and Agents
	createSoftEntity("Person", 0);
	
	// create soft attributes for each softized entity
	softEntity 	:= company.allSoftEntities.getAtKey("Agent");
	softAttribute := softEntity.createSoftAttributeValue("agentNumber", "Integer", 4);
	number := 1;
	foreach agent in company.allAgents do
		softAttribute.createSoftValue(agent, number);
		number := number+1;
	endforeach;

	softEntity 	:= company.allSoftEntities.getAtKey("Client");
	softAttribute := softEntity.createSoftAttributeValue("current", "Boolean", 0);
	foreach client in company.allClients do
		softAttribute.createSoftValue(client, bool);
		bool := not bool;
	endforeach;
	
	softEntity 	:= company.allSoftEntities.getAtKey("Country");
	softAttribute := softEntity.createSoftAttributeValue("Continent", "String", 50);
	country := company.allCountries.getAtKey("UK");
	softAttribute.createSoftValue(country,"Europe");
	country := company.allCountries.getAtKey("USA");
	softAttribute.createSoftValue(country,"North America");	

	// for Person, map selected JADE properties and methods
	softEntity 	:= company.allSoftEntities.getAtKey("Person");

	// in this implementation, in order to map a property or method to the table Person, 
	// the method or property must be defined for both Agent and Client 
	// the implementation could be extended to map properties of Agent or Client, but return
	//    a default value if the instance is not of the appropriate class.
	
	softAttribute := softEntity.createSoftAttributeProperty(Address, "name", "String", 80);
	softAttribute := softEntity.createSoftAttributeMethod(Address, "getNameAndAddress", "String", 236);

	// for Person, create Soft Attribute "Nickname"
	softAttribute := softEntity.createSoftAttributeValue("Nickname", "String", 80);
	agent := company.allAgents.getAtKey("Angela Bettersfield");
	softAttribute.createSoftValue(agent,"Angie");	
	
	client := company.allClients.getAtKey("Andrew Fitzpatrick");
	softAttribute.createSoftValue(client,"Andy");
end;
}
createSoftEntity
{
createSoftEntity(className : String; classNumber : Integer) : SoftEntity;

vars
	softEntity : SoftEntity;
begin
	beginTransaction;
	create softEntity;
	softEntity.initialize(className, classNumber);
	commitTransaction;
	return softEntity;
end;
}
deleteSoftEntities
{
deleteSoftEntities();

vars
	softEntity : SoftEntity;
begin
	beginTransaction;
	foreach softEntity in SoftEntity.instances do
		delete softEntity;
	endforeach;
	commitTransaction;
end;
}
deleteSoftEntitiesFromRV
{
deleteSoftEntitiesFromRV();

vars
	rv				: RelationalView;
	company			: Company;
	customEntity	: SoftEntity;
	
begin
	rv := currentSchema.getRelationalView("SoftEntitiesOdbc");
	if rv = null then
		app.raiseModelException(OdbcInvalidInterfaceException);
	endif;
	company := Company.firstInstance;
	if company = null then
		app.msgBox($ErrVwDatabaseNotInitialized, $Error, MsgBox_Stop_Icon + MsgBox_OK_Only);
		return;
	endif;	
	beginTransaction;
	foreach customEntity in company.allSoftEntities do
		rv.removeTable(customEntity.tableName);
	endforeach;
	commitTransaction;
end;
}
sampleIsAttributeValid
{
sampleIsAttributeValid();

vars
	softEntity		: SoftEntity;
	jre				: JadeRelationalEntityIF;
	softAttribute	: SoftAttribute;
begin
	softEntity		:= Company.firstInstance.allSoftEntities["Agent"];
	jre				:= softEntity;
	softAttribute	:= softEntity.allAttributes["agentNumber"];
	write jre.isAttributeValid(softAttribute);
end;
}
	)
	ModelEntity (
	jadeMethodSources
getSoftValue
{
getSoftValue(attribute : SoftAttribute) : Any;

	// return the value defined for this attribute on this instance, if any
	
vars
	softValue : SoftValue;
begin
	if attribute.isJadeFeature then
		return attribute.SoftJadeFeature.getValueForObject(self);
	endif;
	softValue := allSoftValues.getAtKey(attribute.attributeName);
	if softValue = null then
		return attribute.getNullValue;
	endif;
	return softValue.getValue;
end;
}
	)
	Company (
	jadeMethodSources
getSaleItemsByRegionByCost
{
getSaleItemsByRegionByCost(regionName : String; minPrice : Decimal; maxPrice : Decimal) : SaleItemsByRegionAndPrice;

// this method returns a collection which is used in the RelationalView to create a table which maps Company to SaleItem
// when called for an ODBC SELECT statement, the parameter values are the column values specified in the SELECT, if any
//
// The method creates a transient instance of the ExtKeyDictionary SaleItemsByRegionAndPrice, 
// which is keyed by Region.name and SaleItem.gerPrice.  If the parameters are null 
// (the user has not specified a value), all values are returned. 
// Otherwise, the results are constrained by the parameter values. 

// The following SELECT statement may be used to select all SaleItems in the London region which cost between $1000 and $100,000, ordered by price:
// SELECT RV_SaleItem_0.getPrice, RV_SaleItem_0.shortDescription
// FROM Company_getSaleItemsByRegionByCost RBC, RV_Company RV_Company_0, RV_SaleItem RV_SaleItem_0
// WHERE 
//    RBC.saleItem_oid = RV_SaleItem_0.oid AND 
//    RBC.company_oid = RV_Company_0.oid AND 
//    RV_SaleItem_0.myRegion = RV_Region_0.oid AND 
//    ((RBC.regionName='London') AND 
//     (RBC.maxPrice=100000) AND
//     (RBC.minPrice=1000))

vars
	saleItems : SaleItemsByRegionAndPrice;
	country : Country;
	region : Region;
	saleItem : SaleItem;
	price : Decimal[12,2];
begin
	write method.name & " region=" & regionName & ";min=" & minPrice.String & ";max=" & maxPrice.String;
	create saleItems transient;
	foreach country in Company.firstInstance.allCountries do 
		foreach region in country.allRegions do
			if regionName = null or regionName = region.name then
				foreach saleItem in region.allSaleItems do
					price := saleItem.getPrice;
					if minPrice = null or price >= minPrice then
						if maxPrice = null or price <= maxPrice then
							saleItems.putAtKey(region.name, saleItem.getPrice, saleItem);
						endif;
					endif;
				endforeach;
			endif;
		endforeach;
	endforeach;
	write saleItems.size;
	return saleItems;
end;
}
	)
	SaleItem (
	jadeMethodSources
getMySaleStatus
{
getMySaleStatus() : String;
	
// this method returns the status of this SaleItem for the current Client -- 
//    based on the username the application signed in with
// the correctness of this method depends upon app.getClient returning the correct Client instance (if any)
// when executing this code in an ODBC query in thin client, the value is set when app.initializeOdbcSelect is called

// this method is reimplemented in TenderSaleItem to check for current tenders

vars
begin
	if mySale <> null then
		if mySale.myClient = app.getClient then
			return "Bought:" & mySale.getAmount.String;
		endif;
		// sold, but not to me
		return "Sold";
	endif;
	return "Available:" & getPrice.String;
end;
	
}
	)
	TenderSaleItem (
	jadeMethodSources
getMySaleStatus
{
getMySaleStatus(): String;

// this method returns the status of this TenderSaleItem for the current Client -- 
//    based on the username the application signed in with
// if the item is already sold, use implementation in SaleItem

vars
	tender		: Tender;
	me			: Client;
	retString	: String;
	highBid		: String;
begin
	
	if mySale <> null then
		return inheritMethod();
	endif;
	me := app.getClient;
	tender := allTendersByOfferTime.first;
	if tender <> null then 
		if tender.myClient = me then
			return "Highest Bidder:" & tender.offer.String;
		endif;
		highBid := "; Highest Bid:" & tender.offer.String;
	endif;
	foreach tender in allTendersByOfferTime where tender.myClient = me do
		return "Losing Bidder: " & tender.offer.String & highBid;
	endforeach;
	if retString = "" then
		return "Not Bid On " & highBid;
	endif;
	return retString;
end;		
}
	)
	QueryNode (
	jadeMethodSources
isLeafLiteral
{
isLeafLiteral(litValue : Any io) : Boolean; 

vars

begin
	return false;
end;
}
isLeafNode
{
isLeafNode() : Boolean abstract;
}
isLeafNonLiteral
{
isLeafNonLiteral(obj : Object io) : Boolean;

vars

begin
	return false;
end;
}
isLeafSoftAttribute
{
isLeafSoftAttribute(softAttr : SoftAttribute io) : Boolean;

vars

begin
	return false;
end;
}
isOperatorNode
{
isOperatorNode() : Boolean abstract;
}
	)
	LeafNode (
	jadeMethodSources
delete
{
delete() updating;

vars

begin
	if value.isKindOf(SoftValue) then
		delete value;
	endif;
end;
}
isLeafLiteral
{
isLeafLiteral(litValue : Any io): Boolean;

vars

begin
	if not value.isKindOf(SoftValue) then
		return false;
	endif;
	litValue := value.SoftValue.getValue;
	return true;
end;
}
isLeafNode
{
isLeafNode() : Boolean;

vars

begin
	return true;
end;
}
isLeafNonLiteral
{
isLeafNonLiteral(obj: Object io): Boolean;

vars

begin
	if value.isKindOf(SoftValue) then
		return false;
	endif;
	obj := value;
	return true;
end;
}
isLeafSoftAttribute
{
isLeafSoftAttribute(softAttr : SoftAttribute io): Boolean;

vars

begin
	if not value.isKindOf(SoftAttribute) then
		return false;
	endif;
	softAttr := value.SoftAttribute;
	return true;
end;
}
isOperatorNode
{
isOperatorNode(): Boolean;

vars

begin
	return false;
end;
}
	)
	OperatorNode (
	jadeMethodSources
isLeafNode
{
isLeafNode(): Boolean;

vars

begin
	return false;
end;
}
isOperatorNode
{
isOperatorNode(): Boolean;

vars

begin
	return true;
end;
}
	)
	QueryProvider (
	jadeMethodSources
compareAny
{
compareAny(leftValue : Any; rightValue : Any; operator : Integer) : Boolean;

vars

begin

	if leftValue.isKindOf(String) then
		if not rightValue.isKindOf(String) then
			app.raiseModelException(OdbcInvalidInterfaceException);	
			return false;
		endif;
		if operator = JadeRelationalQueryProviderIF.Op_Equal then
			return leftValue.String = rightValue.String;
		elseif operator = JadeRelationalQueryProviderIF.Op_GreaterThan then
			return leftValue.String > rightValue.String;
		elseif operator = JadeRelationalQueryProviderIF.Op_GreaterThanOrEqual then
			return leftValue.String >= rightValue.String;
		elseif operator = JadeRelationalQueryProviderIF.Op_LessThan then
			return leftValue.String < rightValue.String;
		elseif operator = JadeRelationalQueryProviderIF.Op_LessThanOrEqual then
			return leftValue.String <= rightValue.String;
		endif;
		return false;
	endif;
	if leftValue.isKindOf(Integer) then
		if not rightValue.isKindOf(Integer) then
			app.raiseModelException(OdbcInvalidInterfaceException);	
			return false;
		endif;
		if operator = JadeRelationalQueryProviderIF.Op_Equal then
			return leftValue.Integer = rightValue.Integer;
		elseif operator = JadeRelationalQueryProviderIF.Op_GreaterThan then
			return leftValue.Integer > rightValue.Integer;
		elseif operator = JadeRelationalQueryProviderIF.Op_GreaterThanOrEqual then
			return leftValue.Integer >= rightValue.Integer;
		elseif operator = JadeRelationalQueryProviderIF.Op_LessThan then
			return leftValue.Integer < rightValue.Integer;
		elseif operator = JadeRelationalQueryProviderIF.Op_LessThanOrEqual then
			return leftValue.Integer <= rightValue.Integer;
		endif;
		return false;
	endif;		
	if leftValue.isKindOf(Boolean) then
		// boolean literal will actually be string "true" or "false" or "t" or "f" or integer 0 or 1
		if not rightValue.isKindOf(Boolean) then
			app.raiseModelException(OdbcInvalidInterfaceException);	
			return false;
		endif;
		if operator = JadeRelationalQueryProviderIF.Op_Equal then
			return leftValue.Boolean = rightValue.Boolean;
		endif;
		return false;
	endif;		
	return false;
end;
}
executeMethodLeaf
{
executeMethodLeaf(operator : Integer; leftAttr : Method; rightNode : LeafNode; results : ObjectSet io) : Boolean;

vars

begin
	app.raiseModelException(OdbcInvalidInterfaceException);		
	return false;
end;
}
executePrimAttributeLeaf
{
executePrimAttributeLeaf(operator : Integer; leftAttr : PrimAttribute; rightNode : LeafNode; results : ObjectSet io) : Boolean;

vars

begin
	app.raiseModelException(OdbcInvalidInterfaceException);		
	return false;
end;
}
executeQuery
{
executeQuery(queryNode : OperatorNode; results : ObjectSet io) : Boolean;

vars
	leftResults		: ObjectSet;
	rightResults	: ObjectSet;
	obj				: Object;
	leftAttr		: SoftAttribute;
begin
	create leftResults transient;
	if queryNode.leftNode <> null and queryNode.leftNode.isOperatorNode then
		if not executeQuery(queryNode.leftNode.OperatorNode, leftResults) then
			app.raiseModelException(OdbcInvalidInterfaceException);		
			return false;
		endif;	
	endif;
	create rightResults transient;
	if queryNode.rightNode <> null and queryNode.rightNode.isOperatorNode then
		if not executeQuery(queryNode.rightNode.OperatorNode, rightResults) then
			app.raiseModelException(OdbcInvalidInterfaceException);		
			return false;
		endif;
	endif;
	// combine left and right results using operator AND or OR
	if queryNode.operator = JadeRelationalQueryProviderIF.Op_And then
		foreach obj in leftResults where rightResults.includes(obj) do
			results.add(obj);
		endforeach;
		return true;
	elseif queryNode.operator = JadeRelationalQueryProviderIF.Op_Or then
		leftResults.copy(results);
		foreach obj in rightResults where not leftResults.includes(obj) do
			results.add(obj);
		endforeach;
		return true;
	endif;

	// execute lowest level query operator where A comparison-op B 
	//  A can be a SoftAttribute, Method, or Property
	//  B can be a SoftAttribute, Method, Property or SoftValue (literal value)
	// do actual comparison test
	if queryNode.leftNode.isLeafSoftAttribute(leftAttr) then
		return executeSoftAttributeLeaf(queryNode.operator, leftAttr, queryNode.rightNode.LeafNode, results);
	elseif queryNode.leftNode.isKindOf(PrimAttribute) then
		return executePrimAttributeLeaf(queryNode.operator, queryNode.leftNode.LeafNode.value.PrimAttribute, queryNode.rightNode.LeafNode, results);
	elseif queryNode.leftNode.isKindOf(Method) then
			return executeMethodLeaf(queryNode.operator, queryNode.leftNode.LeafNode.value.Method, queryNode.rightNode.LeafNode, results);
	endif;
	// don't understand this query
	app.raiseModelException(OdbcInvalidInterfaceException);		
	return false;
epilog
	delete leftResults;
	delete rightResults;
end;
}
executeQueryNot
{
executeQueryNot(queryNode : QueryNode; results : ObjectSet) : Boolean;

vars

begin
	return false;
end;
}
executeSoftAttrToAttrCompare
{
executeSoftAttrToAttrCompare(softAttr : SoftAttribute; operator : Integer; rightOperand : Object;
								results : ObjectSet io) : Boolean;

	// for all objects of type cls, compare softAttr value to rightOperand value using operator
	
vars
	obj 		: Object;
	leftValue	: Any;
	rightValue	: Any;
	cls			: Class;
begin
	cls := currentSchema.getClassByNumber(softAttr.myEntity.classNumber);
	foreach obj in cls.instances do
		leftValue := obj.ModelEntity.getSoftValue(softAttr);
		if leftValue = null then
			return null;
		endif;
		rightValue := getOperandValue(obj, rightOperand);
		if rightValue = null then
			return null;
		endif;
		if compareAny(leftValue, rightValue, operator) then
			results.add(obj);
		endif;
	endforeach;
	return true;
end;
}
executeSoftAttrValueToLiteral
{
executeSoftAttrValueToLiteral(leftAttr : SoftPrimitiveAttribute; operator : Integer; rightValue : Any; results : ObjectSet io) : Boolean;

// 
//   comparing a SoftPrimitiveAttribute to a literal value
//   take advantage of dictionary by SoftValue on the attribute to find the required objects
//
vars
	iterator	: Iterator;
	obj			: Object;
	leftValue	: SoftValue;
begin
	iterator := leftAttr.createIterator;
	if operator = JadeRelationalQueryProviderIF.Op_Equal then
		iterator.startAtObject(leftAttr.getAtKeyStartObject(rightValue));
		while iterator.next(obj) do
			leftValue := obj.SoftValue;
			if compareAny(leftValue.getValue, rightValue, JadeRelationalQueryProviderIF.Op_Equal) then
				break;
			endif;
			results.add(leftValue.myInstance);
		endwhile;
		return true;
	elseif operator = JadeRelationalQueryProviderIF.Op_GreaterThan then
		iterator.startAtObject(leftAttr.getAtKeyGtrStartObject(rightValue));
		while iterator.next(obj) do
			leftValue := obj.SoftValue;
			results.add(leftValue.myInstance);
		endwhile;
		return true;
	elseif operator = JadeRelationalQueryProviderIF.Op_GreaterThanOrEqual then
		iterator.startAtObject(leftAttr.getAtKeyGeqStartObject(rightValue));
		while iterator.next(obj) do
			leftValue := obj.SoftValue;
			results.add(leftValue.myInstance);
		endwhile;
		return true;
	elseif operator = JadeRelationalQueryProviderIF.Op_LessThan then
		while iterator.next(obj) do
			leftValue := obj.SoftValue;
			if compareAny(leftValue.getValue, rightValue, JadeRelationalQueryProviderIF.Op_GreaterThanOrEqual) then
				break;
			endif;
			results.add(leftValue.myInstance);
		endwhile;
		return true;
	elseif operator = JadeRelationalQueryProviderIF.Op_LessThanOrEqual then
		while iterator.next(obj) do
			leftValue := obj.SoftValue;
			if compareAny(leftValue.getValue, rightValue, JadeRelationalQueryProviderIF.Op_GreaterThan) then
				break;
			endif;
			results.add(leftValue.myInstance);
		endwhile;
		return true;
	elseif operator = JadeRelationalQueryProviderIF.Op_NotEqual then
		while iterator.next(obj) do
			leftValue := obj.SoftValue;
			if compareAny(leftValue.getValue, rightValue, JadeRelationalQueryProviderIF.Op_NotEqual) then
				break;
			endif;
			results.add(leftValue.myInstance);
		endwhile;
		return true;	
	endif;
	return false;
end;
}
executeSoftAttributeLeaf
{
executeSoftAttributeLeaf(operator : Integer; leftAttr : SoftAttribute; rightNode : LeafNode; results : ObjectSet io) : Boolean;
vars
	rightValue	: Object;
	rightAny	: Any;
begin
	
	if rightNode.isLeafNonLiteral(rightValue) then
		return executeSoftAttrToAttrCompare(leftAttr, operator, rightValue, results);
	endif;
	rightNode.isLeafLiteral(rightAny);
	if leftAttr.isJadeFeature then
		return executeSoftFeatureToLiteral(operator, leftAttr.SoftJadeFeature, rightAny, results);
	endif;
	
	return executeSoftAttrValueToLiteral(leftAttr.SoftPrimitiveAttribute, operator, rightAny, results);
	
end;
}
executeSoftFeatureToLiteral
{
executeSoftFeatureToLiteral(operator : Integer; softAttr : SoftJadeFeature; rightValue : Any; results : ObjectSet io) : Boolean;

vars
	softEntity	: SoftEntity;
	obj			: Object;
	cls			: Class;
begin
	
	softEntity := softAttr.myEntity;

	cls := currentSchema.getClassByNumber(softEntity.classNumber);
	if cls <> null then
		foreach obj in cls.instances do
			if compareAny(softAttr.getValueForObject(obj), rightValue, operator) then
				results.add(obj);
			endif;
		endforeach;
		return true;
	endif;

	if softEntity.tableName = "Person" then
		// special knowledge of what classes are in Person
		foreach obj in Client.instances do
			if compareAny(softAttr.getValueForObject(obj), rightValue, operator) then
				results.add(obj);
			endif;
		endforeach;		
		foreach obj in Agent.instances do
			if compareAny(softAttr.getValueForObject(obj), rightValue, operator) then
				results.add(obj);
			endif;
		endforeach;	
		return true;
	endif;
	
	app.raiseModelException(OdbcInvalidInterfaceException);		
	return false;
end;
}
getOperandValue
{
getOperandValue(obj : Object; operand : Object) : Any;

vars

begin
	if operand.isKindOf(SoftAttribute) then
		return obj.ModelEntity.getSoftValue(operand.SoftAttribute);
	elseif operand.isKindOf(PrimAttribute) then
		return obj.getPropertyValue(operand.PrimAttribute.name);
	elseif operand.isKindOf(Method) then
		return obj.sendMsg(operand.Method.name);
	endif;
	return null;		
end;
}
jrq_BinaryExpression
{
jrq_BinaryExpression(operator : Integer; leftOperand : Object io; rightOperand : Any io; level : Integer) : Object updating;


	// called for Binary expression in WHERE clause 
	//     leftOperand  operator   rightOperand
	// return internal representation of this expression
	// this internal representation may be passed back into binaryExpression (or unaryExpression) as an operand
	//      or may be passed into executeQuery for execution
	
vars
	queryNode		: OperatorNode;
	leafNode		: LeafNode;
begin
	write method.name & " " & operator.String & " " & level.String & ' ' & leftOperand.String & " " & rightOperand.String;
	if operator = JadeRelationalQueryProviderIF.Op_Like or operator = JadeRelationalQueryProviderIF.Op_NotLike then
		// these operators are not implemented in this QueryProvider
		return null;
	endif;
	//Build an operator node for the saved query
	create queryNode transient;	
	queryNode.operator := operator;
	
	if leftOperand.isKindOf(QueryNode) then
		queryNode.leftNode := leftOperand.QueryNode;
	else
		create leafNode transient;
		leafNode.value := leftOperand;
		queryNode.leftNode := leafNode;
	endif;
	if rightOperand.isKindOf(QueryNode) then
		queryNode.rightNode := rightOperand.QueryNode;
	elseif rightOperand.isKindOf(String) then
		create leafNode transient;
		create leafNode.value as SoftStringValue transient;
		leafNode.value.SoftStringValue.stringValue := rightOperand.String;
		queryNode.rightNode := leafNode;
	elseif rightOperand.isKindOf(Integer) then	
		create leafNode transient;
		create leafNode.value as SoftIntegerValue transient;
		leafNode.value.SoftIntegerValue.intValue := rightOperand.Integer;
		queryNode.rightNode := leafNode;
	elseif rightOperand.isKindOf(Object) then
		create leafNode transient;
		leafNode.value := rightOperand.Object;
		queryNode.rightNode := leafNode;
	else
		// type not handled by this queryProvider
		app.raiseModelException(OdbcInvalidInterfaceException);		
	endif;

	return queryNode;
end;
}
jrq_ExecuteQuery
{
jrq_ExecuteQuery(expression : Object io) : Boolean updating;

	/*
		this method is called to execute the query 
		the expression parameter will be of type QueryNode (as built by binaryExpression or unaryExpression calls)
		returns true if the result set built successfully, else false
	*/

vars
begin

	if not expression.isKindOf(OperatorNode) then
		app.raiseModelException(OdbcInvalidInterfaceException);		
	endif;
	if myResultSet = null then
		create myResultSet transient;
	else
		myResultSet.clear;
	endif;
	return executeQuery(expression.OperatorNode, myResultSet);
end;
}
jrq_FinalizeQuery
{
jrq_FinalizeQuery(expression : Object io) updating;

	/*
		this method stub has been automatically generated by Jade to satisfy interface implementation requirements
	*/

vars

begin
	delete expression;
	app.myQueryProvider := null;
	delete self;
end;
}
jrq_GetResultSet
{
jrq_GetResultSet() : Collection;

	/*
		this method stub has been automatically generated by Jade to satisfy interface implementation requirements
	*/

vars

begin

	return myResultSet;
end;
}
jrq_UnaryExpression
{
jrq_UnaryExpression(operator : Integer; operand : Object io; level : Integer) : Object updating;

	// called for Unary expression in WHERE clause 
	//     operator   operand
	// return internal representation of this expression
	// this internal representation may be passed back into binaryExpression (or unaryExpression) or into executeQuery
	
vars
	queryNode	: OperatorNode;
	leafNode	: LeafNode;
begin
	//Build a node for saved query
	create queryNode transient;	
	queryNode.operator := operator;
	
	if operand.isKindOf(QueryNode) then
		queryNode.leftNode := operand.QueryNode;
	else
		create leafNode transient;
		leafNode.value := operand;
		queryNode.rightNode := leafNode;
	endif;

	return queryNode;
end;
}
	)
	SoftAttribute (
	jadeMethodSources
createSoftValue
{
createSoftValue(entity : ModelEntity; value : Any) abstract;
}
getAttributeType
{
getAttributeType() : String abstract;
}
getJadeType
{
getJadeType() : Type abstract;
}
getLength
{
getLength() : Integer abstract;
}
getNullValue
{
getNullValue() : Any abstract;
}
isJadeFeature
{
isJadeFeature() : Boolean abstract;
}
jra_GetJadeType
{
jra_GetJadeType() : Type;

	/*
		return the type of this attribute
	*/

vars

begin
	return getJadeType;
end;
}
jra_GetLength
{
jra_GetLength() : Integer;

	/*
		returns the length of the atrribute -- only used for variable length types -- String, Binary, Decimal
	*/

vars

begin
	return getLength;
end;
}
jra_GetSQLName
{
jra_GetSQLName() : String;

	/*
		return name to be used for column in Relational Table
	*/

vars

begin

	return attributeName;
end;
}
jra_GetScaleFactor
{
jra_GetScaleFactor() : Integer;

	/*
		return scale factor (number of decimal digits) ; only used for Decimal types
		no decimal types currently defined
	*/

vars

begin
	return 0;
end;
}
	)
	SoftJadeFeature (
	jadeMethodSources
createSoftValue
{
createSoftValue(entity: ModelEntity; value: Any);

vars

begin
	app.raiseModelException(OdbcInvalidInterfaceException);
	return;
end;
}
getAttributeType
{
getAttributeType(): String;

vars

begin
	return attributeType;
end;
}
getJadeType
{
getJadeType(): Type;

vars

begin
	return currentSchema.getPrimitive(attributeType);
end;
}
getLength
{
getLength(): Integer;

vars

begin
	return attributeLength;
end;
}
getNullValue
{
getNullValue(): Any;

	// return valid null value for the attribute type
	
vars

begin
	if attributeType = "String" then
		return '';
	elseif attributeType = "Integer" then
		return 0;
	elseif attributeType = "Boolean" then
	    return false;
	else
		app.raiseModelException(OdbcInvalidInterfaceException);
	endif;
	return null;
end;
}
getValueForObject
{
getValueForObject(obj : Object) : Any abstract;
}
initialize
{
initialize(cls : Class; attrName : String; attrType : String; attrLength : Integer; softEntity : SoftEntity) updating;

vars

begin
	if currentSchema.getPrimitive(attrType) = null then
		app.raiseModelException(OdbcInvalidInterfaceException);
		return;
	endif;	
	if softEntity.allAttributes.getAtKey(attrName) <> null then
		app.raiseModelException(OdbcInvalidInterfaceException);
		return;
	endif;	
	classNumber 	:= cls.number;
	attributeName	:= attrName;
	attributeType	:= attrType;
	attributeLength	:= attrLength;
	myEntity		:= softEntity;
end;
}
isJadeFeature
{
isJadeFeature(): Boolean;

vars

begin
	return true;
end;
}
	)
	SoftMethod (
	jadeMethodSources
getValueForObject
{
getValueForObject(obj: Object): Any;

vars

begin
	return obj.sendMsg(attributeName);
end;
}
	)
	SoftProperty (
	jadeMethodSources
getValueForObject
{
getValueForObject(obj: Object): Any;

vars

begin
	return obj.getPropertyValue(attributeName);
end;
}
	)
	SoftPrimitiveAttribute (
	jadeMethodSources
createIterator
{
createIterator() : Iterator abstract;
}
getAtKeyGeqStartObject
{
getAtKeyGeqStartObject(key : Any) : Object abstract;
}
getAtKeyGtrStartObject
{
getAtKeyGtrStartObject(key : Any) : Object abstract;
}
getAtKeyStartObject
{
getAtKeyStartObject(key : Any) : Object abstract;
}
initialize
{
initialize(attrName: String; attrLength: Integer; softEntity: SoftEntity) updating;

vars

begin
	attributeName	:= attrName;
	myEntity		:= softEntity;
end;
}
isJadeFeature
{
isJadeFeature(): Boolean;

vars

begin
	return false;
end;
}
	)
	SoftBooleanAttribute (
	jadeMethodSources
createIterator
{
createIterator(): Iterator;

vars

begin
	return allSoftBooleanValues.createIterator;
end;
}
createSoftValue
{
createSoftValue(entity: ModelEntity; value: Any);

vars
	softBoolean : SoftBooleanValue;
begin
	beginTransaction;
	create softBoolean;
	softBoolean.myAttribute	:= self;
	softBoolean.myInstance	:= entity;
	softBoolean.boolValue	:= value.Boolean;
	commitTransaction;	
end;
}
getAtKeyGeqStartObject
{
getAtKeyGeqStartObject(key: Any): Object;

vars

begin
	// booleans will not be compared to booleans in sql select
	// literal will come in as string "true" or "false"  
	//           or as integer 0 or 1 (depending on tool)
	
	return allSoftBooleanValues.getAtKeyGeq(key.Boolean);
end;
}
getAttributeType
{
getAttributeType(): String;

vars

begin
	return "Boolean";
end;
}
getJadeType
{
getJadeType(): Type;

vars

begin
	return Boolean;
end;
}
getNullValue
{
getNullValue(): Any;

vars

begin
	return false;
end;
}
jra_GetLength
{
jra_GetLength(): Integer;

vars

begin
	return 0;
end;
}
	)
	SoftIntegerAttribute (
	jadeMethodSources
createIterator
{
createIterator(): Iterator;

vars

begin
	return allSoftIntegerValues.createIterator;
end;
}
createSoftValue
{
createSoftValue(entity: ModelEntity; value: Any);

vars
	softInteger : SoftIntegerValue;
begin
	beginTransaction;
	create softInteger;
	softInteger.myAttribute	:= self;
	softInteger.myInstance	:= entity;
	softInteger.intValue	:= value.Integer;
	commitTransaction;	
end;
}
getAtKeyGeqStartObject
{
getAtKeyGeqStartObject(key: Any): Object;

vars

begin
	return allSoftIntegerValues.getAtKeyGeq(key.Integer);
end;
}
getAtKeyGtrStartObject
{
getAtKeyGtrStartObject(key: Any): Object;

vars

begin
	return allSoftIntegerValues.getAtKeyGtr(key.Integer);
end;
}
getAtKeyStartObject
{
getAtKeyStartObject(key: Any): Object;

vars

begin
	return allSoftIntegerValues.getAtKey(key.Integer);
end;
}
getAttributeType
{
getAttributeType(): String;

vars

begin
	return "Integer";
end;
}
getJadeType
{
getJadeType(): Type;

vars

begin
	return Integer;
end;
}
getLength
{
getLength(): Integer;

vars

begin
	return 0;
end;
}
getNullValue
{
getNullValue(): Any;

vars

begin
	return 0;
end;
}
	)
	SoftStringAttribute (
	jadeMethodSources
createIterator
{
createIterator(): Iterator;

vars

begin
	return allSoftStringValues.createIterator;
end;
}
createSoftValue
{
createSoftValue(entity: ModelEntity; value: Any);

vars
	softString : SoftStringValue;
begin
	beginTransaction;
	create softString;
	softString.myAttribute	:= self;
	softString.myInstance		:= entity;
	softString.stringValue	:= value.String;
	commitTransaction;	
end;
}
getAtKeyGeqStartObject
{
getAtKeyGeqStartObject(key: Any): Object;

vars

begin
	return allSoftStringValues.getAtKeyGeq(key.String);
end;
}
getAtKeyGtrStartObject
{
getAtKeyGtrStartObject(key: Any): Object;

vars

begin
	return allSoftStringValues.getAtKeyGtr(key.String);
end;
}
getAtKeyStartObject
{
getAtKeyStartObject(key: Any): Object;

vars

begin
	return allSoftStringValues.getAtKey(key.String);
end;
}
getAttributeType
{
getAttributeType(): String;

vars

begin
	return "String";
end;
}
getJadeType
{
getJadeType(): Type;

vars

begin
	return String;
end;
}
getLength
{
getLength(): Integer;

vars

begin
	return attributeLength;
end;
}
getNullValue
{
getNullValue(): Any;

vars

begin
	return '';
end;
}
initialize
{
initialize(attrName: String; attrLength: Integer; softEntity: SoftEntity) updating;

vars

begin
	attributeLength := attrLength;
	inheritMethod(attrName, attrLength, softEntity);
end;
}
	)
	SoftEntity (
	jadeMethodSources
createSoftAttributeMethod
{
createSoftAttributeMethod(methodClass : Class; methodName : String; 
                            attrType : String; attrLength : Integer) : SoftAttribute;

//
//	Map a method to a Soft Entity which is not mapped to a JADE class
//  The parameters define the class on which the method is defined and the method name.
//  The attrType must match the actual method return type.
//  In the current implementation, no checks are done on the class or method or return type.
//  For methods that return unbounded values, the attrLength may bound the Soft Attribute value
//

vars
	softAttribute : SoftMethod;
begin
	if classNumber <> 0 then
		app.raiseModelException(OdbcInvalidInterfaceException);	
		return null;
	endif;
	if tableName <> 'Person' then
		app.raiseModelException(OdbcInvalidInterfaceException);	
		return null;
	endif;	
	beginTransaction;
	create softAttribute;
	softAttribute.initialize(methodClass, methodName, attrType, attrLength, self);
	commitTransaction;
	return softAttribute;
end;
}
createSoftAttributeProperty
{
createSoftAttributeProperty(propertyClass : Class; propertyName : String; 
                              propertyType : String; propertyLength : Integer) : SoftAttribute;

//
//	Map a property to a Soft Entity which is not mapped to a JADE class
//  The parameters define the class on which the property is defined and the property name.
//  The attrType must match the actual property type.
//  In the current implementation, no checks are done on the class or property or type.
//  For unbounded properties, the attrLength may bound the Soft Attribute value
//


vars
	softAttribute : SoftProperty;
begin
	if classNumber <> 0 then
		app.raiseModelException(OdbcInvalidInterfaceException);	
		return null;
	endif;
	if tableName <> 'Person' then
		app.raiseModelException(OdbcInvalidInterfaceException);	
		return null;
	endif;	
	beginTransaction;
	create softAttribute;
	softAttribute.initialize(propertyClass, propertyName, propertyType, propertyLength, self);
	commitTransaction;
	return softAttribute;
end;
}
createSoftAttributeType
{
createSoftAttributeType(attrType : String) : SoftAttribute;

//
//	Create a Soft Attribute based on the attrType
//  The current implementation defines a limited subset of possible Primitive Types
//

vars
	softAttribute : SoftAttribute;
begin
	if attrType = "String" then
		create softAttribute as SoftStringAttribute;
	elseif attrType = "Boolean" then
		create softAttribute as SoftBooleanAttribute;
	elseif attrType = "Integer" then
		create softAttribute as SoftIntegerAttribute;
	else
		// unimplemented SoftAttribute type
		app.raiseModelException(OdbcInvalidInterfaceException);	
	endif;
	return softAttribute;
end;
}
createSoftAttributeValue
{
createSoftAttributeValue(attrName : String; attrType : String; attrLength : Integer) : SoftAttribute;

//
//	Create a Soft Attribute as defined in the parameters
//  The current implementation defines a limited subset of possible Primitive Types and 
//     does not validate the values for consistency
//

vars
	softAttribute : SoftAttribute;
begin
	beginTransaction;
	softAttribute := createSoftAttributeType(attrType);
	softAttribute.SoftPrimitiveAttribute.initialize(attrName, attrLength, self);
	commitTransaction;
	return softAttribute;
end;
}
initialize
{
initialize(clsName : String; clsNumber : Integer) updating;

// 
// initialize the SoftEntity
// In this implementation, no validation is done on the class definition.
// 
vars

begin
	tableName	:= clsName;
	classNumber	:= clsNumber;
	myCompany	:= Company.firstInstance;
end;
}
jre_AllInstances
{
jre_AllInstances() : Collection;

	/*
		return all instances of the table -- which is not mapped to a real Jade Class.
		this should only be called (based on this implementation of jre_CallIFAllInstances) if the
		   table is not mapped to a real Jade class.
		return collection of all instances which should be mapped to this table
	*/

vars
	coll	: ObjectSet;
begin
	if classNumber <> 0 then
		// this should not happen -- raise exception
		app.raiseModelException(OdbcInvalidInterfaceException);
	endif;

	// specific code here based on tableName to populate the instances collection as required

	if tableName = "Person" then
		create coll transient;
		// the soft entity Person is defined by all instances of Client and all instances of Agent
		Company.firstInstance.allClients.copy(coll);
		Company.firstInstance.allAgents.copy(coll);
	else
		// this should not happen -- raise exception
		app.raiseModelException(OdbcInvalidInterfaceException);	
	endif;
	return coll;
end;
}
jre_CallIFAllInstances
{
jre_CallIFAllInstances() : Boolean;

	/*
		return true if the jre_Allinstances method should be called when allInstances is required

		return false if the odbc driver should retreive all instances of the Jade Class
		
		For our implementation, we want 
		     the jre_AllInstances to be called if the table is mapped to a "Soft Class" --
			                         not to a real Jade Class, so return true
			 if the table is mapped to a real Jade class, return false
	*/

vars

begin
	return classNumber = 0;
end;
}
jre_GetJadeClass
{
jre_GetJadeClass() : Class;

	/*
		return the real Jade Class to which this table is mapped
		if the table is not mapped to a real Jade Class then return null
		this method is called when the relational view is defined
	*/

vars

begin
	if classNumber = 0 then
		return null;
	endif;

	return currentSchema.getClassByNumber(classNumber);
end;
}
jre_GetPropertyValue
{
jre_GetPropertyValue(entity : Object; attributeDesc : JadeRelationalAttributeIF) : Any;

	/*
		return the attribute value defined by attributeDesc for the entity instance, if any
	*/

vars
	obj			: Object;
begin
	// in our implementation, only subclass of ModelEntity may have soft attributes
	if not entity.isKindOf(ModelEntity) then
		app.raiseModelException(OdbcInvalidInterfaceException);
	endif;
	// in our implementation, only the SoftAttribute class implements the interface,
	// so the following check is not really required
	obj := attributeDesc.Object;
	if not obj.isKindOf(SoftAttribute) then
		app.raiseModelException(OdbcInvalidInterfaceException);
	endif;
	// return the soft attribute value; will return a default value if the attribute is not
	//     defined for this instance
	return entity.ModelEntity.getSoftValue(attributeDesc.Object.SoftAttribute);
end;
}
jre_GetQueryProvider
{
jre_GetQueryProvider() : JadeRelationalQueryProviderIF;

	/*
		return the query provider for this soft entity, if any
		for our implementation, we will use the QueryProvider only for the Soft Entities which
		   are not mapped to real Jade classes
	*/

vars

begin
	if classNumber = 0 then
		if app.myQueryProvider = null then
			create app.myQueryProvider transient;
		endif;
		return app.myQueryProvider;
	endif;
	return null;
end;
}
jre_GetSQLName
{
jre_GetSQLName() : String;

	/*
		return the name to be used as the table name
		in this case, use the className
	*/

vars

begin

	return tableName;
end;
}
jre_IsAttributeValid
{
jre_IsAttributeValid(attributeDesc : Object) : Boolean;

	/*
		validate the attributeDesc which was saved when the RelationalView was created
		return true if this attribute is still valid
		return false if the attribute is not valid.  
		      If the attribute is not valid, the column will be set to null for all instances.
	*/

vars
	obj : Object;
begin
	obj := attributeDesc;
	if not obj.isKindOf(SoftAttribute) then
		app.raiseModelException(OdbcInvalidInterfaceException);
	endif;
	return allAttributes.includes(obj.SoftAttribute);
end;
}
	)
	SoftValue (
	jadeMethodSources
getValue
{
getValue() : Any abstract;
}
	)
	SoftBooleanValue (
	jadeMethodSources
getValue
{
getValue(): Any;

vars

begin
	return boolValue;
end;
}
	)
	SoftIntegerValue (
	jadeMethodSources
getValue
{
getValue(): Any;

vars

begin
	return intValue;
end;
}
	)
	SoftStringValue (
	jadeMethodSources
getValue
{
getValue(): Any;

vars

begin
	return stringValue;
end;
}
	)
