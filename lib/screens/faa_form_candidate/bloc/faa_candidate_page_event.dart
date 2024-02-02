part of 'faa_candidate_page_bloc.dart';

@immutable
abstract class FaaCandidatePageEvent {}


class FetchMasterDataEvent extends FaaCandidatePageEvent {
  FetchMasterDataEvent();
}

class FetchCandidateDataEvent extends FaaCandidatePageEvent {
  final String candidateId;
  FetchCandidateDataEvent(this.candidateId);
}

class TabTypeInputEvent extends FaaCandidatePageEvent {
  final TabType tabType;

  TabTypeInputEvent(this.tabType);
}

class FirstNameInputEvent extends FaaCandidatePageEvent {
  final String firstName;

  FirstNameInputEvent(this.firstName);
}

class MiddleNameInputEvent extends FaaCandidatePageEvent {
  final String middleName;

  MiddleNameInputEvent(this.middleName);
}

class LastNameInputEvent extends FaaCandidatePageEvent {
  final String lastName;

  LastNameInputEvent(this.lastName);
}

class DobInputEvent extends FaaCandidatePageEvent {
  final String dob;

  DobInputEvent(this.dob);
}

class IdentityNoInputEvent extends FaaCandidatePageEvent {
  final String identityNo;

  IdentityNoInputEvent(this.identityNo);
}

class IdentityImageInputEvent extends FaaCandidatePageEvent {
  final String identityImage;

  IdentityImageInputEvent(this.identityImage);
}

class IdentitySelfieImageInputEvent extends FaaCandidatePageEvent {
  final String identitySelfieImage;

  IdentitySelfieImageInputEvent(this.identitySelfieImage);
}

class KkNoInputEvent extends FaaCandidatePageEvent {
  final String kkNo;

  KkNoInputEvent(this.kkNo);
}

class KkImageInputEvent extends FaaCandidatePageEvent {
  final String kkImage;

  KkImageInputEvent(this.kkImage);
}

class AddressInputEvent extends FaaCandidatePageEvent {
  final String address;

  AddressInputEvent(this.address);
}

class RtRwInputEvent extends FaaCandidatePageEvent {
  final String rtRw;

  RtRwInputEvent(this.rtRw);
}

class KecKelInputEvent extends FaaCandidatePageEvent {
  final String kecKel;

  KecKelInputEvent(this.kecKel);
}

class PostalCodeInputEvent extends FaaCandidatePageEvent {
  final String postalCode;

  PostalCodeInputEvent(this.postalCode);
}

class CountryInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference country;

  CountryInputEvent(this.country);
}

class ProvinceInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference province;

  ProvinceInputEvent(this.province);
}

class CityInputEvent extends FaaCandidatePageEvent {
  final CityMasterReference city;

  CityInputEvent(this.city);
}

class OccupationInputEvent extends FaaCandidatePageEvent {
  final CheckingstatusMasterReference occupation;

  OccupationInputEvent(this.occupation);
}

class AajiCheckedInputEvent extends FaaCandidatePageEvent {
  final bool aajiChecked;

  AajiCheckedInputEvent([this.aajiChecked = false]);
}

class AajiNoInputEvent extends FaaCandidatePageEvent {
  final String aajiNo;

  AajiNoInputEvent(this.aajiNo);
}

class AajiImageInputEvent extends FaaCandidatePageEvent {
  final String aajiImage;

  AajiImageInputEvent(this.aajiImage);
}

class AasiCheckedInputEvent extends FaaCandidatePageEvent {
  final bool aasiChecked;

  AasiCheckedInputEvent([this.aasiChecked = false]);
}

class AasiNoInputEvent extends FaaCandidatePageEvent {
  final String aasiNo;

  AasiNoInputEvent(this.aasiNo);
}

class AasiImageInputEvent extends FaaCandidatePageEvent {
  final String aasiImage;

  AasiImageInputEvent(this.aasiImage);
}

class AauiCheckedInputEvent extends FaaCandidatePageEvent {
  final bool aauiChecked;

  AauiCheckedInputEvent([this.aauiChecked = false]);
}

class AauiNoInputEvent extends FaaCandidatePageEvent {
  final String aauiNo;

  AauiNoInputEvent(this.aauiNo);
}

class AauiImageInputEvent extends FaaCandidatePageEvent {
  final String aauiImage;

  AauiImageInputEvent(this.aauiImage);
}

class MarriedCheckedInputEvent extends FaaCandidatePageEvent {
  final bool marriedChecked;

  MarriedCheckedInputEvent([this.marriedChecked = false]);
}

class FirstNamePartnerInputEvent extends FaaCandidatePageEvent {
  final String firstNamePartner;

  FirstNamePartnerInputEvent(this.firstNamePartner);
}

class MiddleNamePartnerInputEvent extends FaaCandidatePageEvent {
  final String middleNamePartner;

  MiddleNamePartnerInputEvent(this.middleNamePartner);
}

class LastNamePartnerInputEvent extends FaaCandidatePageEvent {
  final String lastNamePartner;

  LastNamePartnerInputEvent(this.lastNamePartner);
}

class DobPartnerInputEvent extends FaaCandidatePageEvent {
  final String dobPartner;

  DobPartnerInputEvent(this.dobPartner);
}

class PartnerIdentityNoInputEvent extends FaaCandidatePageEvent {
  final String partnerIdentityNo;

  PartnerIdentityNoInputEvent(this.partnerIdentityNo);
}

class GenderPartnerInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference gender;

  GenderPartnerInputEvent(this.gender);
}

class RelationPartnerInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference relation;

  RelationPartnerInputEvent(this.relation);
}

class AddAgentSubmittedEvent extends FaaCandidatePageEvent {
  AddAgentSubmittedEvent();
}

class AddAgentDocSubmittedEvent extends FaaCandidatePageEvent {
  AddAgentDocSubmittedEvent();
}

class FaaCandidatePageInitialEvent extends FaaCandidatePageEvent {
  FaaCandidatePageInitialEvent();
}


///Work Experience



class CheckEmployeeInputEvent extends FaaCandidatePageEvent {
  final String value;

  CheckEmployeeInputEvent([this.value ='tidak']);
}
class UnitNameExperienceInputEvent extends FaaCandidatePageEvent {
  final String unitName;

  UnitNameExperienceInputEvent(this.unitName);
}
class LastDepartmentExperienceInputEvent extends FaaCandidatePageEvent {
  final String lastDepartment;

  LastDepartmentExperienceInputEvent(this.lastDepartment);
}
class DirectLeaderExperienceInputEvent extends FaaCandidatePageEvent {
  final String leader;

  DirectLeaderExperienceInputEvent(this.leader);
}


class CompanyNameExperienceInputEvent extends FaaCandidatePageEvent {
  final String companyName;

  CompanyNameExperienceInputEvent(this.companyName);
}
class CompanyTypeExperienceInputEvent extends FaaCandidatePageEvent {
  final String companyType;

  CompanyTypeExperienceInputEvent(this.companyType);
}
class DepartmentExperienceInputEvent extends FaaCandidatePageEvent {
  final String department;

  DepartmentExperienceInputEvent(this.department);
}

class StartWorkingExperienceInputEvent extends FaaCandidatePageEvent {
  final DateTime startWorking;

  StartWorkingExperienceInputEvent(this.startWorking);
}
class EndWorkingExperienceInputEvent extends FaaCandidatePageEvent {
  final DateTime endWorking;

  EndWorkingExperienceInputEvent(this.endWorking);
}

class StatusEmployeeInputEvent extends FaaCandidatePageEvent {
  final String value;

  StatusEmployeeInputEvent(this.value);
}

class CheckStillWorkingInputEvent extends FaaCandidatePageEvent {
  final bool? isCheck;

  CheckStillWorkingInputEvent([this.isCheck= false]);
}

class AddWorkingExperienceEvent extends FaaCandidatePageEvent {
  final bool isDelete;
  AddWorkingExperienceEvent({this.isDelete = false});
}

class SubmitWorkingExperienceEvent extends FaaCandidatePageEvent {
  SubmitWorkingExperienceEvent();
}


///Education

class EducationLevelInputEvent extends FaaCandidatePageEvent {
  final CityMasterReference value;

  EducationLevelInputEvent(this.value);
}
class EducationPlaceNameInputEvent extends FaaCandidatePageEvent {
  final String value;

  EducationPlaceNameInputEvent(this.value);
}
class EducationDescriptionInputEvent extends FaaCandidatePageEvent {
  final String value;

  EducationDescriptionInputEvent(this.value);
}

class EducationStartInputEvent extends FaaCandidatePageEvent {
  final DateTime educationStart;

  EducationStartInputEvent(this.educationStart);
}
class EducationEndInputEvent extends FaaCandidatePageEvent {
  final DateTime educationEnd;

  EducationEndInputEvent(this.educationEnd);
}

class EducationStatusInputEvent extends FaaCandidatePageEvent {
  final String value;

  EducationStatusInputEvent(this.value);
}

class CheckStillLearnInputEvent extends FaaCandidatePageEvent {
  final bool? isCheck;

  CheckStillLearnInputEvent([this.isCheck= false]);
}

class AddEducationEvent extends FaaCandidatePageEvent {
  final bool isDelete;
  AddEducationEvent({this.isDelete = false});
}

class SubmitEducationEvent extends FaaCandidatePageEvent {
  SubmitEducationEvent();
}





class  WorkExperienceCandidateInitialEvent extends FaaCandidatePageEvent {
  WorkExperienceCandidateInitialEvent();
}
