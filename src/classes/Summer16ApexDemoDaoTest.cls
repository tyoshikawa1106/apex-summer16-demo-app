@isTest
private class Summer16ApexDemoDaoTest {

    private static Summer16ApexDemoDao dao = new Summer16ApexDemoDao();
    private static User testAdminUser = new User(Id = UserInfo.getUserId());

    /**
     * コンストラクタ
     */
    static testMethod void Summer16ApexDemoDaoTest() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            // コンストラクタ
            Summer16ApexDemoDao cls = new Summer16ApexDemoDao();

            Test.stopTest();
        }
    }

    /**
     * 入力された SObject 項目の対応付けの取得機能のデモ用情報取得
     */
    static testMethod void getPopulatedFieldsAsMapDemoInfoTest() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            // 入力された SObject 項目の対応付けの取得機能のデモ用情報取得
            User result = dao.getPopulatedFieldsAsMapDemoInfo();

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }

    /**
     * PlatformActionオブジェクトの情報取得
     * 値なし
     */
    static testMethod void getPlatformActionsTest1() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            // PlatformActionオブジェクトの情報取得
            List<PlatformAction> results = dao.getPlatformActions();

            Test.stopTest();

            System.assertEquals(results.isEmpty(), true);
        }
    }

    /**
     * Apexクラス情報取得
     */
    static testMethod void getApexClassTest1() {
        System.runAs(testAdminUser) {
            
            Test.startTest();

            // Apexクラス情報取得
            ApexClass result = dao.getApexClass('Summer16ApexDemoControllerTest');

            Test.stopTest();

            System.assertEquals(String.isNotEmpty(result.Id), true);
        }
    }
}