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

    /**
     * PlatformActionオブジェクトの情報取得
     */
    public List<PlatformAction> getPlatformActions() {
        return [
            SELECT
                 ActionTargetType
                ,ApiName
                ,Category
                ,ConfirmationMessage
                ,ExternalId
                ,GroupId
                ,IconUrl
                ,IconContentType
                ,IconHeight
                ,IconWidth
                ,PrimaryColor
                ,InvocationStatus
                ,InvokedByUserId
                ,IsGroupDefault
                ,Label
                ,LastModifiedDate
                ,Subtype
                ,SourceEntity
                ,Type 
            FROM
                PlatformAction
            WHERE
                SourceEntity = 'Task'
            AND
                ActionListContext = 'Record'
            LIMIT 5
        ];
    }
}