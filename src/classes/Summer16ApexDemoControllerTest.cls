@isTest
private class Summer16ApexDemoControllerTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void Summer16ApexDemoControllerTest1() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            // コンストラクタ
            Summer16ApexDemoController cls = new Summer16ApexDemoController();

            Test.stopTest();
        }
    }

    /**
     * Apex オブジェクトの逐次化時の null 値の抑制
     */
    static testMethod void doSerializeJsonTest1() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            Boolean isSuppressApexObjectNulls = true;
            String result = Summer16ApexDemoController.doSerializeJson(isSuppressApexObjectNulls);

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result), true);
        }
    }

    /**
     * Apex オブジェクトの逐次化時の null 値の抑制
     */
    static testMethod void doSerializePrettyJsonTest1() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            Boolean isSuppressApexObjectNulls = true;
            String result = Summer16ApexDemoController.doSerializePrettyJson(isSuppressApexObjectNulls);

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result), true);
        }
    }

    /**
     * 入力された SObject 項目の対応付けの取得
     */
    static testMethod void doPopulatedFieldsAsMapDemoTest1() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            List<String> results = Summer16ApexDemoController.doPopulatedFieldsAsMapDemo();

            Test.stopTest();

            System.assertEquals(results.size(), 11);
        }
    }

    /**
     * LIMIT 句を使用した PlatformAction に対する SOQL クエリの実行
     */
    static testMethod void doRemovalOfLimitOnPlatformactionQueryTest1() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            List<PlatformAction> results = Summer16ApexDemoController.doRemovalOfLimitOnPlatformactionQuery();

            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * ToolingAPIのrunTestsAsynchronousとtestLevelパラメータ
     */
    static testMethod void doRunTestsAsynchronousTest1() {
        System.runAs(testAdminUser) {

            Test.setMock(HttpCalloutMock.class, new Summer16ApexDemoToolingApiCallout());
            
            Test.startTest();

            String result = Summer16ApexDemoController.doRunTestsAsynchronous();

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result), true);
        }
    }

    /**
     * Schema.DescribeSObjectResult クラスの新しいメソッド - isMruEnabled()
     */
    static testMethod void getIsMruEnabledInfoTest1() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            List<String> results = Summer16ApexDemoController.getIsMruEnabledInfo();

            Test.stopTest();

            System.assertEquals(results.isEmpty(), false);
        }
    }

    /**
     * SOSLのFORMATをつかってローカライズされた書式の適用
     */
    static testMethod void doSoslFormatQueryTest1() {
        System.runAs(testAdminUser) {

            Test.setMock(HttpCalloutMock.class, new Summer16ApexDemoSoslApiCallout());
            String searchKey = 'keyword';
            
            Test.startTest();

            List<List<Object>> results = Summer16ApexDemoController.doSoslFormatQuery(searchKey);

            Test.stopTest();

            System.assertEquals(results.isEmpty(), false);
        }
    }

    /**
     * SOSLのSNIPPETをつかってキーワードのハイライト
     */
    static testMethod void doSoslSnippetQueryTest1() {
        System.runAs(testAdminUser) {

            Test.setMock(HttpCalloutMock.class, new Summer16ApexDemoSoslApiCallout());
            String searchKey = 'keyword';
            
            Test.startTest();

            String result = Summer16ApexDemoController.doSoslSnippetQuery(searchKey);

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result), true);
        }
    }

    /**
     * SOSLとMetadata
     */
    static testMethod void doSoslMetadataQueryTest1() {
        System.runAs(testAdminUser) {

            Test.setMock(HttpCalloutMock.class, new Summer16ApexDemoSoslApiCallout());
            String searchKey = 'keyword';
            
            Test.startTest();

            String result = Summer16ApexDemoController.doSoslMetadataQuery(searchKey);

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result), true);
        }
    }
}