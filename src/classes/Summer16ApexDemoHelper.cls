public with sharing class Summer16ApexDemoHelper {

    /**
     * コンストラクタ
     */
    public Summer16ApexDemoHelper() {
        
    }

    /**
     * 入力された SObject 項目の対応付けの取得のデモ用情報取得
     */
    public List<String> getPopulatedFieldsAsMapDemoResults(Map<String, Object> fieldsToValue) {
        List<String> results = new List<String>();
        for (String fieldName : fieldsToValue.keySet()){
            results.add('field name is ' + fieldName + ', value is ' + fieldsToValue.get(fieldName));
        }

        return results;
    }

    /**
     * Tooling APIのRequest Body取得
     * - testLevelオプションを指定時にエラーが発生したためコメントアウト
     */
    public String getRunTestsAsynchronousBody(ApexClass apexClass) {
        String requestBody = '{';
        requestBody += '    "tests": [';
        requestBody += '        {';
        requestBody += '            "classId": "' + apexClass.Id + '",';
        requestBody += '            "testMethods": ["Summer16ApexDemoControllerTest1","doSerializeJsonTest1", "doSerializePrettyJsonTest1"]';
        //requestBody += '        },{';
        //requestBody += '            "testLevel": "RunSpecifiedTests"';
        requestBody += '        }';
        requestBody += '    ]';
        requestBody += '}';
        System.debug(requestBody);
        return requestBody;
    }

    /**
     * Tooling APIの実行
     */
    public String runToolingApi(String requestBody) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/json');
        req.setBody(requestBody);
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v37.0/tooling/runTestsAsynchronous');
        req.setMethod('POST');
        HttpResponse res = http.send(req);
        System.debug(res);
        String result = res.getBody();
        System.debug(result);
        return result;
    }

    /**
     * isMruEnabled()の実行結果取得
     */
    public List<String> getIsMruEnabledResult() {
        List<String> results = new List<String>();
        results.add('Account.sObjectType.getDescribe().isMruEnabled() = ' + Account.sObjectType.getDescribe().isMruEnabled());
        results.add('Contact.sObjectType.getDescribe().isMruEnabled() = ' + Contact.sObjectType.getDescribe().isMruEnabled());
        results.add('Opportunity.sObjectType.getDescribe().isMruEnabled() = ' + Opportunity.sObjectType.getDescribe().isMruEnabled());
        results.add('Lead.sObjectType.getDescribe().isMruEnabled() = ' + Lead.sObjectType.getDescribe().isMruEnabled());
        results.add('Case.sObjectType.getDescribe().isMruEnabled() = ' + Case.sObjectType.getDescribe().isMruEnabled());
        results.add('Event.sObjectType.getDescribe().isMruEnabled() = ' + Event.sObjectType.getDescribe().isMruEnabled());
        results.add('Task.sObjectType.getDescribe().isMruEnabled() = ' + Task.sObjectType.getDescribe().isMruEnabled());
        results.add('User.sObjectType.getDescribe().isMruEnabled() = ' + User.sObjectType.getDescribe().isMruEnabled());
        results.add('Group.sObjectType.getDescribe().isMruEnabled() = ' + Group.sObjectType.getDescribe().isMruEnabled());
        return results;
    }

    /**
     * SOSL(Format)クエリ実行
     */
    public String getSoslFormatQuery(String searchKey) {
        return 'FIND {' + searchKey + '} RETURNING Account(Id, Name, LastModifiedDate, FORMAT(LastModifiedDate) FormattedDate ORDER BY Name ASC)';
    }

    /**
     * SOSL(Snippet)クエリ実行
     */
    public String getSoslSnippetQuery(String searchKey) {
        return 'FIND+{' + searchKey + '}+IN+ALL+FIELDS+RETURNING+Case(Subject,+Description+ORDER+BY+Subject+ASC)+WITH+SNIPPET';
    }

    /**
     * SOSL(Metadata)クエリ実行
     */
    public String getSoslMetadataQuery(String searchKey) {
        return 'FIND+{' + searchKey + '}+RETURNING+Account(Id,+Name,+AccountNumber+ORDER+BY+Name+ASC)+,Opportunity(Name+ORDER+BY+Name+ASC)+WITH+METADATA=\'LABELS\'';
    }

    /**
     * SOSL API 実行
     */
    public String runSoslApi(String soslQuery) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v37.0/search?q=' + soslQuery);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        System.debug(res);
        String result = res.getBody();
        System.debug(result);
        return result;
    }
}