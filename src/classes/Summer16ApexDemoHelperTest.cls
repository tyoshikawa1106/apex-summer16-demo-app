@isTest
private class Summer16ApexDemoHelperTest {

    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void Summer16ApexDemoHelperTest() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            // コンストラクタ
            Summer16ApexDemoHelper helper = new Summer16ApexDemoHelper();

            Test.stopTest();
        }
    }
}