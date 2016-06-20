public with sharing class Summer16ApexDemoController {

    private static Summer16ApexDemoHelper helper = new Summer16ApexDemoHelper();
    private static Summer16ApexDemoDao dao = new Summer16ApexDemoDao();

    /**
     * コンストラクタ
     */
    public Summer16ApexDemoController() {
        
    }

    /**
     * Apex オブジェクトの逐次化時の null 値の抑制
     * - Trueの場合はNullを除外する
     * - 自作のオブジェクトにのみ適用される
     * - sObjectには適用されない
     */
    @RemoteAction
    public static String doSerializeJson(Boolean isSuppressApexObjectNulls) {
        return JSON.serialize(new Summer16ApexDemoSerializeJsonWrapper(), isSuppressApexObjectNulls);
    }

    /**
     * Apex オブジェクトの逐次化時の null 値の抑制
     * - 見栄えのよい印刷形式を使用してインデントされたコンテンツを生成
     */
    @RemoteAction
    public static String doSerializePrettyJson(Boolean isSuppressApexObjectNulls) {
        return JSON.serializePretty(new Summer16ApexDemoSerializeJsonWrapper(), isSuppressApexObjectNulls);
    }

    /**
     * 入力された SObject 項目の対応付けの取得
     */
    @RemoteAction
    public static List<String> doPopulatedFieldsAsMapDemo() {
        // ログインユーザ情報取得
        User loginUser = dao.getPopulatedFieldsAsMapDemoInfo();
        // getPopulatedFieldsAsMapの実行
        Map<String, Object> fieldsToValue = loginUser.getPopulatedFieldsAsMap();
        // 実行結果をリストに追加
        List<String> results = helper.getPopulatedFieldsAsMapDemoResults(fieldsToValue);
        return results;
    }

    /**
     * LIMIT 句を使用した PlatformAction に対する SOQL クエリの実行
     */
    @RemoteAction
    public static List<PlatformAction> doRemovalOfLimitOnPlatformactionQuery() {
        return dao.getPlatformActions();
    }

    /**
     * ToolingAPIのrunTestsAsynchronousとtestLevelパラメータ
     */
    @RemoteAction
    public static String doRunTestsAsynchronous() {
        // テスト対象のApexクラス情報取得
        ApexClass apexClass = dao.getApexClass('Summer16ApexDemoControllerTest');
        // Apexクラス情報取得判定
        if (String.isEmpty(apexClass.Id)) return 'Not Found Target Class';
        // Tooling APIのRequest Body取得
        String requestBody = helper.getRunTestsAsynchronousBody(apexClass);
        // Tooling API実行
        String result = helper.runToolingApi(requestBody);
        return result;
    }

    /**
     * Schema.DescribeSObjectResult クラスの新しいメソッド - isMruEnabled()
     */
    @RemoteAction
    public static List<String> getIsMruEnabledInfo() {
        // isMruEnabled()の実行結果取得
        List<String> results = helper.getIsMruEnabledResult();
        return results;
    }
}