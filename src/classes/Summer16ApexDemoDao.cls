public with sharing class Summer16ApexDemoDao {

    /**
     * コンストラクタ
     */
    public Summer16ApexDemoDao() {
        
    }

    /**
     * 入力された SObject 項目の対応付けの取得機能のデモ用情報取得
     */
    public User getPopulatedFieldsAsMapDemoInfo() {
        return [
            SELECT
                 Id
                ,Name
                ,Alias
                ,CommunityNickname
                ,Title
                ,CompanyName
                ,UserType
                ,IsActive
                ,TimeZoneSidKey
                ,LocaleSidKey
                ,ManagerId
            FROM
                User
            WHERE
                Id =: UserInfo.getUserId()
            LIMIT 1
        ];
    }
}