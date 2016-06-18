public with sharing class Summer16ApexDemoController {

    private static Summer16ApexDemoHelper helper = new Summer16ApexDemoHelper();

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
     * Apex オブジェクトの逐次化時の null 値の抑制 (見栄えのよい印刷形式を使用してインデントされたコンテンツを生成)
     */
    @RemoteAction
    public static String doSerializePrettyJson(Boolean isSuppressApexObjectNulls) {
        return JSON.serializePretty(new Summer16ApexDemoSerializeJsonWrapper(), isSuppressApexObjectNulls);
    }
}