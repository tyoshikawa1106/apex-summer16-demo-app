@isTest
private class Summer16ApexDemoHelperTest {

    private static Summer16ApexDemoHelper helper = new Summer16ApexDemoHelper();
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
}