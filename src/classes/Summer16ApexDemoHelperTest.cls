@isTest
private class Summer16ApexDemoHelperTest {

    private static Summer16ApexDemoHelper helper = new Summer16ApexDemoHelper();
    private static Summer16ApexDemoDao dao = new Summer16ApexDemoDao();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void Summer16ApexDemoHelperTest() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            // コンストラクタ
            Summer16ApexDemoHelper cls = new Summer16ApexDemoHelper();

            Test.stopTest();
        }
    }

    /**
     * 入力された SObject 項目の対応付けの取得のデモ用情報取得
     * - 値なし
     */
    static testMethod void getPopulatedFieldsAsMapDemoResultsTest1() {
        System.runAs(testAdminUser) {
            
            Map<String, Object> fieldsToValue = new Map<String, Object>();

            Test.startTest();

            // 入力された SObject 項目の対応付けの取得のデモ用情報取得
            List<String> results = helper.getPopulatedFieldsAsMapDemoResults(fieldsToValue);

            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * 入力された SObject 項目の対応付けの取得のデモ用情報取得
     * - 値あり
     */
    static testMethod void getPopulatedFieldsAsMapDemoResultsTest2() {
        System.runAs(testAdminUser) {

            Account account = new Account(Name = 'salesforce.com', AccountNumber = 'SF-001');
            Map<String, Object> fieldsToValue = account.getPopulatedFieldsAsMap();

            Test.startTest();

            // 入力された SObject 項目の対応付けの取得のデモ用情報取得
            List<String> results = helper.getPopulatedFieldsAsMapDemoResults(fieldsToValue);

            Test.stopTest();

            System.assertEquals(results.size(), 2);
        }
    }

    /**
     * Tooling APIのRequest Body取得
     */
    static testMethod void getRunTestsAsynchronousBodyTest1() {
        System.runAs(testAdminUser) {

            ApexClass apexClass = dao.getApexClass('Summer16ApexDemoController');
            System.assertEquals(String.isNotEmpty(apexClass.Id), true);

            Test.startTest();

            // Tooling APIのRequest Body取得
            String result = helper.getRunTestsAsynchronousBody(apexClass);

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result), true);
        }
    }

    /**
     * Tooling APIの実行
     */
    static testMethod void runToolingApiTest1() {
        System.runAs(testAdminUser) {

            Test.setMock(HttpCalloutMock.class, new Summer16ApexDemoToolingApiCallout());
            String requestBody = '';

            Test.startTest();

            // Tooling APIの実行
            String result = helper.runToolingApi(requestBody);

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result), true);
        }
    }

    /**
     * isMruEnabled()の実行結果取得
     */
    static testMethod void getIsMruEnabledResultTest1() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            List<String> results = helper.getIsMruEnabledResult();

            Test.stopTest();

            System.assertEquals(results.isEmpty(), false);
        }
    }
}