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
}