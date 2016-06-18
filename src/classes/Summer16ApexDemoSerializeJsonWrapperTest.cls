@isTest
private class Summer16ApexDemoSerializeJsonWrapperTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void Summer16ApexDemoSerializeJsonWrapperTest1() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            // コンストラクタ
            Summer16ApexDemoSerializeJsonWrapper result = new Summer16ApexDemoSerializeJsonWrapper();

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.name), true);
            System.assertEquals(String.isNotEmpty(result.code), true);
            System.assertEquals(String.isEmpty(result.postalCode), true);
            System.assertEquals(String.isEmpty(result.state), true);
            System.assertEquals(String.isEmpty(result.city), true);
            System.assertEquals(String.isEmpty(result.street), true);
            System.assertEquals(String.isEmpty(result.phone), true);
            System.assertEquals(String.isEmpty(result.email), true);
        }
    }
}