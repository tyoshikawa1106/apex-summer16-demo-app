@isTest
public with sharing class Summer16ApexDemoSoslApiCallout implements HttpCalloutMock {

    /**
     * Tooling APIの実行用 CalloutMock
     */
    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v37.0/search?q=');
        res.setBody('{"foo":"bar"}');
        req.setMethod('GET');
        res.setStatusCode(200);
        return res;
    }
}