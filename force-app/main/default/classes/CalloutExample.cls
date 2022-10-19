public with sharing class CalloutExample {
    public static String makeCallout() {
        Http httpObject = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://postman-echo.com/get?foo1=bar1&foo2=bar2');
        request.setMethod('GET');
        HttpResponse response = httpObject.send(request);
        String responseBody = response.getBody();
        System.debug('responseBody: ' + responseBody);
        return String.valueOf(responseBody);
    }
}

