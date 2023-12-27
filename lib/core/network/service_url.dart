class ServiceUrl {
  static String subHost = '/v2/acl/api/';
  static String login = "${subHost}authentication/login/agent";
  static String listMyAgent = "${subHost}restcandidate/getCandidateList";
  static String listBeAgent = "${subHost}aclopt/getCandidateReviewListAuth";
  static String listNotify = "${subHost}notification/getPushNotificationListAuth";
  static String masterData = "${subHost}startup/init-cores";
  static String listTracking = "${subHost}restcandidate/getCandidateTracking";
  static String addRegisterCandidate = "${subHost}restcandidate/registrationCandidateStart";
  static String addRegisterCandidateDoc = "${subHost}AclDms/uploadDoc";
  static String addRegisterCandidateFolderDoc = "${subHost}AclDms/createFolder";
  static String addSepouseCandidate = "${subHost}restcandidate/insertFamilyCard";
  static String submitPendingSimpleChecking = "${subHost}restcandidate/submitPendingSimpleChecking";
}