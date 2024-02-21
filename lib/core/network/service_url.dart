class ServiceUrl {
  static String subHost = '/v2/acl/api/';
  static String login = "${subHost}authentication/login/agent";
  static String listMyAgent = "${subHost}restcandidate/getCandidateList";
  static String listBeAgent = "${subHost}aclopt/getCandidateReviewListAuth";
  static String listNotify = "${subHost}notification/getPushNotificationListAuth";
  static String masterData = "${subHost}startup/init-cores";
  static String listTracking = "${subHost}restcandidate/getCandidateTracking";
  static String getCandidateData = "${subHost}restcandidate/getCandidateData";
  static String addRegisterCandidate = "${subHost}restcandidate/registrationCandidateStart";
  static String addRegisterCandidateFaa = "${subHost}restcandidate/registrationCandidate";
  static String submitPendingSimpleChecking = "${subHost}restcandidate/submitPendingSimpleChecking";
  static String addRegisterCandidateFolderDoc = "${subHost}AclDms/createFolder";
  static String addRegisterCandidateDoc = "${subHost}AclDms/uploadDoc";
  static String getCandidateDataDoc = "${subHost}AclDms/getDocuments";
  static String addSepouseCandidate = "${subHost}restcandidate/insertFamilyCard";
  static String startProcessInstance = "${subHost}restcandidate/startProcessInstance";
  static String addPrivateDataCandidate = "${subHost}restcandidate/registrationCandidate";
  static String addWorkExperienceCandidate = "${subHost}restcandidate/addCandidateWorkExperience";
  static String addEducationCandidate = "${subHost}restcandidate/addCandidateEducation";
  static String getDataAgent = "/v2/acl/aclopusproc/agentInquiryAuth";
}