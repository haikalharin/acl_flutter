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

class PositionInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference value;

  PositionInputEvent(this.value);
}

class IdentityNoInputEvent extends FaaCandidatePageEvent {
  final String identityNo;

  IdentityNoInputEvent(this.identityNo);
}

class MartialStatusInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference value;

  MartialStatusInputEvent(this.value);
}

class DobInputEvent extends FaaCandidatePageEvent {
  final DateTime dob;

  DobInputEvent(this.dob);
}

class PobInputEvent extends FaaCandidatePageEvent {
  final String pob;

  PobInputEvent(this.pob);
}

class GenderInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference gender;

  GenderInputEvent(this.gender);
}

class NationalityInputEvent extends FaaCandidatePageEvent {
  final String value;

  NationalityInputEvent(this.value);
}

class ReligionInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference value;

  ReligionInputEvent(this.value);
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

class PhoneInputEvent extends FaaCandidatePageEvent {
  final String value;

  PhoneInputEvent(this.value);
}

class HandphoneInputEvent extends FaaCandidatePageEvent {
  final String value;

  HandphoneInputEvent(this.value);
}

class EmailInputEvent extends FaaCandidatePageEvent {
  final String value;

  EmailInputEvent(this.value);
}

class OccupationInputEvent extends FaaCandidatePageEvent {
  final CheckingstatusMasterReference occupation;

  OccupationInputEvent(this.occupation);
}

class LastWorkingExperienceInputEvent extends FaaCandidatePageEvent {
  final String value;

  LastWorkingExperienceInputEvent(this.value);
}

class CheckedLastResignDateInputEvent extends FaaCandidatePageEvent {
  final bool checkedLastResign;

  CheckedLastResignDateInputEvent(this.checkedLastResign);
}

class LastResignDateInputEvent extends FaaCandidatePageEvent {
  final DateTime date;

  LastResignDateInputEvent(this.date);
}

class CheckedTerminationDateInputEvent extends FaaCandidatePageEvent {
  final bool checkedTerminationDateInput;

  CheckedTerminationDateInputEvent(this.checkedTerminationDateInput);
}

class TerminationDateInputEvent extends FaaCandidatePageEvent {
  final DateTime date;

  TerminationDateInputEvent(this.date);
}

class PrivateImageInputEvent extends FaaCandidatePageEvent {
  final String image;

  PrivateImageInputEvent(this.image);
}

class IdentityImageInputEvent extends FaaCandidatePageEvent {
  final String identityImage;

  IdentityImageInputEvent(this.identityImage);
}

class IdentitySelfieImageInputEvent extends FaaCandidatePageEvent {
  final String identitySelfieImage;

  IdentitySelfieImageInputEvent(this.identitySelfieImage);
}

class TerminationImageInputEvent extends FaaCandidatePageEvent {
  final String image;

  TerminationImageInputEvent(this.image);
}

class NotTwistingImageInputEvent extends FaaCandidatePageEvent {
  final String image;

  NotTwistingImageInputEvent(this.image);
}

class HeirsNameInputEvent extends FaaCandidatePageEvent {
  final String value;

  HeirsNameInputEvent(this.value);
}

class HeirsRelationInputEvent extends FaaCandidatePageEvent {
  final CityMasterReference value;

  HeirsRelationInputEvent(this.value);
}

class AajiCheckedInputEvent extends FaaCandidatePageEvent {
  final bool aajiChecked;

  AajiCheckedInputEvent([this.aajiChecked = false]);
}

class AajiPrevCompanyInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference prevCompany;

  AajiPrevCompanyInputEvent(this.prevCompany);
}

class AajiNoInputEvent extends FaaCandidatePageEvent {
  final String aajiNo;

  AajiNoInputEvent(this.aajiNo);
}

class AajiLastDateCheckedInputEvent extends FaaCandidatePageEvent {
  final bool aajiLastDateChecked;

  AajiLastDateCheckedInputEvent([this.aajiLastDateChecked = false]);
}

class AajiLastDateInputEvent extends FaaCandidatePageEvent {
  final DateTime value;

  AajiLastDateInputEvent(this.value);
}

class AajiTerminationImageInputEvent extends FaaCandidatePageEvent {
  final String valueImage;

  AajiTerminationImageInputEvent(this.valueImage);
}

class AajiNotTwistingImageInputEvent extends FaaCandidatePageEvent {
  final String valueImage;

  AajiNotTwistingImageInputEvent(this.valueImage);
}

class AajiMobileActivationExamImageInputEvent extends FaaCandidatePageEvent {
  final String valueImage;

  AajiMobileActivationExamImageInputEvent(this.valueImage);
}

class AajiImageInputEvent extends FaaCandidatePageEvent {
  final String aajiImage;

  AajiImageInputEvent(this.aajiImage);
}

class AasiCheckedInputEvent extends FaaCandidatePageEvent {
  final bool aasiChecked;

  AasiCheckedInputEvent([this.aasiChecked = false]);
}

class AasiPrevCompanyInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference prevCompany;

  AasiPrevCompanyInputEvent(this.prevCompany);
}

class AasiNoInputEvent extends FaaCandidatePageEvent {
  final String aasiNo;

  AasiNoInputEvent(this.aasiNo);
}

class AasiLastDateCheckedInputEvent extends FaaCandidatePageEvent {
  final bool aasiLastDateChecked;

  AasiLastDateCheckedInputEvent([this.aasiLastDateChecked = false]);
}

class AasiLastDateInputEvent extends FaaCandidatePageEvent {
  final DateTime value;

  AasiLastDateInputEvent(this.value);
}

class AasiTerminationImageInputEvent extends FaaCandidatePageEvent {
  final String valueImage;

  AasiTerminationImageInputEvent(this.valueImage);
}

class AasiNotTwistingImageInputEvent extends FaaCandidatePageEvent {
  final String valueImage;

  AasiNotTwistingImageInputEvent(this.valueImage);
}

class AasiMobileActivationExamImageInputEvent extends FaaCandidatePageEvent {
  final String valueImage;

  AasiMobileActivationExamImageInputEvent(this.valueImage);
}

class AasiImageInputEvent extends FaaCandidatePageEvent {
  final String aasiImage;

  AasiImageInputEvent(this.aasiImage);
}

class AauiCheckedInputEvent extends FaaCandidatePageEvent {
  final bool aauiChecked;

  AauiCheckedInputEvent([this.aauiChecked = false]);
}

class AauiPrevCompanyInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference prevCompany;

  AauiPrevCompanyInputEvent(this.prevCompany);
}

class AauiNoInputEvent extends FaaCandidatePageEvent {
  final String aauiNo;

  AauiNoInputEvent(this.aauiNo);
}

class AauiLastDateCheckedInputEvent extends FaaCandidatePageEvent {
  final bool aauiLastDateChecked;

  AauiLastDateCheckedInputEvent([this.aauiLastDateChecked = false]);
}

class AauiLastDateInputEvent extends FaaCandidatePageEvent {
  final DateTime value;

  AauiLastDateInputEvent(this.value);
}

class AauiTerminationImageInputEvent extends FaaCandidatePageEvent {
  final String valueImage;

  AauiTerminationImageInputEvent(this.valueImage);
}

class AauiNotTwistingImageInputEvent extends FaaCandidatePageEvent {
  final String valueImage;

  AauiNotTwistingImageInputEvent(this.valueImage);
}

class AauiMobileActivationExamImageInputEvent extends FaaCandidatePageEvent {
  final String valueImage;

  AauiMobileActivationExamImageInputEvent(this.valueImage);
}

class AauiImageInputEvent extends FaaCandidatePageEvent {
  final String aauiImage;

  AauiImageInputEvent(this.aauiImage);
}

//todo
///Spouse and family
class PutDataTypeEvent extends FaaCandidatePageEvent {
  final PutDataType putDataType;

  PutDataTypeEvent(this.putDataType);
}

class AddDataFamilyEvent extends FaaCandidatePageEvent {
  final String agentCode;

  AddDataFamilyEvent(this.agentCode);
}

class DeleteDataFamilyEvent extends FaaCandidatePageEvent {
  final String agentCode;

  DeleteDataFamilyEvent(this.agentCode);
}

class FamilyPersonNameInputEvent extends FaaCandidatePageEvent {
  final String value;

  FamilyPersonNameInputEvent(this.value);
}

class FamilyPersonRelationInputEvent extends FaaCandidatePageEvent {
  final CityMasterReference value;

  FamilyPersonRelationInputEvent(this.value);
}

class FamilyDirectNameInputEvent extends FaaCandidatePageEvent {
  final String value;

  FamilyDirectNameInputEvent(this.value);
}

class FamilyPositionInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference value;

  FamilyPositionInputEvent(this.value);
}

class FamilyAgentCodeInputEvent extends FaaCandidatePageEvent {
  final String value;

  FamilyAgentCodeInputEvent(this.value);
}

class FamilyCompanyInputEvent extends FaaCandidatePageEvent {
  final String value;

  FamilyCompanyInputEvent(this.value);
}


class SubmitFamiliesDataEvent extends FaaCandidatePageEvent {
  final PutDataType type;
  final int? id;

  SubmitFamiliesDataEvent(this.type, {this.id});
}

///

class NpwpNoInputEvent extends FaaCandidatePageEvent {
  final String value;

  NpwpNoInputEvent(this.value);
}

class BankNoInputEvent extends FaaCandidatePageEvent {
  final String value;

  BankNoInputEvent(this.value);
}

class BankUserNameInputEvent extends FaaCandidatePageEvent {
  final String value;

  BankUserNameInputEvent(this.value);
}

class BankNameInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference value;

  BankNameInputEvent(this.value);
}

class BankBranchInputEvent extends FaaCandidatePageEvent {
  final String value;

  BankBranchInputEvent(this.value);
}

class NpwpImageInputEvent extends FaaCandidatePageEvent {
  final String value;

  NpwpImageInputEvent(this.value);
}

class BankUserBookImageInputEvent extends FaaCandidatePageEvent {
  final String value;

  BankUserBookImageInputEvent(this.value);
}

class SourceInformationInputEvent extends FaaCandidatePageEvent {
  final String value;

  SourceInformationInputEvent(this.value);
}

class AppendixInputEvent extends FaaCandidatePageEvent {
  final SupportingDocument value;

  AppendixInputEvent(this.value);
}

class AppendixImageInputEvent extends FaaCandidatePageEvent {
  final String value;

  AppendixImageInputEvent(this.value);
}

class SpouseIsAgentInputEvent extends FaaCandidatePageEvent {
  final String value;

  SpouseIsAgentInputEvent(this.value);
}

class FirstNamePartnerInputEvent extends FaaCandidatePageEvent {
  final String firstNamePartner;

  FirstNamePartnerInputEvent(this.firstNamePartner);
}

class RelationPartnerInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference relation;

  RelationPartnerInputEvent(this.relation);
}

class DirectUnitNameInputEvent extends FaaCandidatePageEvent {
  final String value;

  DirectUnitNameInputEvent(this.value);
}

class PositionSpouseInputEvent extends FaaCandidatePageEvent {
  final AajicityMasterReference value;

  PositionSpouseInputEvent(this.value);
}

class AgentCodeInputEvent extends FaaCandidatePageEvent {
  final String value;

  AgentCodeInputEvent(this.value);
}




class FaaAddAgentSubmittedEvent extends FaaCandidatePageEvent {
  FaaAddAgentSubmittedEvent();
}

class FaaAddAgentDocSubmittedEvent extends FaaCandidatePageEvent {
  final String typeDoc;

  FaaAddAgentDocSubmittedEvent(this.typeDoc);
}

class KkNoInputEvent extends FaaCandidatePageEvent {
  final String kkNo;

  KkNoInputEvent(this.kkNo);
}

class KkImageInputEvent extends FaaCandidatePageEvent {
  final String kkImage;

  KkImageInputEvent(this.kkImage);
}

class MarriedCheckedInputEvent extends FaaCandidatePageEvent {
  final bool marriedChecked;

  MarriedCheckedInputEvent([this.marriedChecked = false]);
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

class FaaCandidatePageInitialEvent extends FaaCandidatePageEvent {
  FaaCandidatePageInitialEvent();
}

///Work Experience

class CheckEmployeeInputEvent extends FaaCandidatePageEvent {
  final String value;

  CheckEmployeeInputEvent(this.value);
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

  CheckStillWorkingInputEvent([this.isCheck = false]);
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

  CheckStillLearnInputEvent([this.isCheck = false]);
}

class AddEducationEvent extends FaaCandidatePageEvent {
  final bool isDelete;

  AddEducationEvent({this.isDelete = false});
}

class SubmitEducationEvent extends FaaCandidatePageEvent {
  SubmitEducationEvent();
}

class WorkExperienceCandidateInitialEvent extends FaaCandidatePageEvent {
  WorkExperienceCandidateInitialEvent();
}
