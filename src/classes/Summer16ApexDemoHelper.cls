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
}