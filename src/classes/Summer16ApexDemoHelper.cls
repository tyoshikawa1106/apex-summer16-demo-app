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
}