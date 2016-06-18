public with sharing class Summer16ApexDemoSerializeJsonWrapper {

    public String name {get; set;}
    public String code {get; set;}
    public String postalCode {get; set;}
    public String state {get; set;}
    public String city {get; set;}
    public String street {get; set;}
    public String phone {get; set;}
    public String email {get; set;}

    /**
     * コンストラクタ
     */
    public Summer16ApexDemoSerializeJsonWrapper() {
        this.name = 'salesforce.com';
        this.code = 'sf-001';
        this.postalCode = null;
        this.state = null;
        this.city = null;
        this.street = null;
        this.phone = '';
        this.email = '';
    }
}