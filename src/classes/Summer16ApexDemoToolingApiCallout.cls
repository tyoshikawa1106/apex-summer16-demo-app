@isTest
public with sharing class Summer16ApexDemoToolingApiCallout implements HttpCalloutMock {

    /**
     * Tooling APIの実行用 CalloutMock
     */
    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse res = new HttpResponse();
        req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
        req.setHeader('Content-Type', 'application/json');
        req.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm() + '/services/data/v37.0/tooling/runTestsAsynchronous');
        res.setBody('{"foo":"bar"}');
        res.setStatusCode(200);
        return res;
    }
}