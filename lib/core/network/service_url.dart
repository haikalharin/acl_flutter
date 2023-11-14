class ServiceUrl {
  static String subHost = '/v2/acl/api/';
  static String login = "${subHost}authentication/login/agent";
  static String listMyAgent = "${subHost}restcandidate/getCandidateList";
  static String listNotify = "${subHost}notification/getPushNotificationListAuth";
}