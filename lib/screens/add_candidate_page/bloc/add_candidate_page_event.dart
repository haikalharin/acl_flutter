part of 'add_candidate_page_bloc.dart';

@immutable
abstract class AddCandidatePageEvent {}

class FetchMasterDataEvent extends AddCandidatePageEvent {
  FetchMasterDataEvent();
}

class FirstNameInputEvent extends AddCandidatePageEvent {
  final String firstName;

  FirstNameInputEvent(this.firstName);
}

class MiddleNameInputEvent extends AddCandidatePageEvent {
  final String middleName;

  MiddleNameInputEvent(this.middleName);
}

class LastNameInputEvent extends AddCandidatePageEvent {
  final String lastName;

  LastNameInputEvent(this.lastName);
}

class DobInputEvent extends AddCandidatePageEvent {
  final String dob;

  DobInputEvent(this.dob);
}

class IdentityNoInputEvent extends AddCandidatePageEvent {
  final String identityNo;

  IdentityNoInputEvent(this.identityNo);
}

class IdentityImageInputEvent extends AddCandidatePageEvent {
  final String identityImage;

  IdentityImageInputEvent(this.identityImage);
}

class IdentitySelfieImageInputEvent extends AddCandidatePageEvent {
  final String identitySelfieImage;

  IdentitySelfieImageInputEvent(this.identitySelfieImage);
}

class KkNoInputEvent extends AddCandidatePageEvent {
  final String kkNo;

  KkNoInputEvent(this.kkNo);
}

class KkImageInputEvent extends AddCandidatePageEvent {
  final String kkImage;

  KkImageInputEvent(this.kkImage);
}

class AddressInputEvent extends AddCandidatePageEvent {
  final String address;

  AddressInputEvent(this.address);
}

class RtRwInputEvent extends AddCandidatePageEvent {
  final String rtRw;

  RtRwInputEvent(this.rtRw);
}

class KecKelInputEvent extends AddCandidatePageEvent {
  final String kecKel;

  KecKelInputEvent(this.kecKel);
}

class PostalCodeInputEvent extends AddCandidatePageEvent {
  final String postalCode;

  PostalCodeInputEvent(this.postalCode);
}

class CountryInputEvent extends AddCandidatePageEvent {
  final AajicityMasterReference country;

  CountryInputEvent(this.country);
}

class ProvinceInputEvent extends AddCandidatePageEvent {
  final AajicityMasterReference province;

  ProvinceInputEvent(this.province);
}

class CityInputEvent extends AddCandidatePageEvent {
  final CityMasterReference city;

  CityInputEvent(this.city);
}

class OccupationInputEvent extends AddCandidatePageEvent {
  final CheckingstatusMasterReference occupation;

  OccupationInputEvent(this.occupation);
}

class AajiCheckedInputEvent extends AddCandidatePageEvent {
  final bool aajiChecked;

  AajiCheckedInputEvent([this.aajiChecked = false]);
}

class AajiNoInputEvent extends AddCandidatePageEvent {
  final String aajiNo;

  AajiNoInputEvent(this.aajiNo);
}

class AajiImageInputEvent extends AddCandidatePageEvent {
  final String aajiImage;

  AajiImageInputEvent(this.aajiImage);
}

class AasiCheckedInputEvent extends AddCandidatePageEvent {
  final bool aasiChecked;

  AasiCheckedInputEvent([this.aasiChecked = false]);
}

class AasiNoInputEvent extends AddCandidatePageEvent {
  final String aasiNo;

  AasiNoInputEvent(this.aasiNo);
}

class AasiImageInputEvent extends AddCandidatePageEvent {
  final String aasiImage;

  AasiImageInputEvent(this.aasiImage);
}

class AauiCheckedInputEvent extends AddCandidatePageEvent {
  final bool aauiChecked;

  AauiCheckedInputEvent([this.aauiChecked = false]);
}

class AauiNoInputEvent extends AddCandidatePageEvent {
  final String aauiNo;

  AauiNoInputEvent(this.aauiNo);
}

class AauiImageInputEvent extends AddCandidatePageEvent {
  final String aauiImage;

  AauiImageInputEvent(this.aauiImage);
}

class MarriedCheckedInputEvent extends AddCandidatePageEvent {
  final bool marriedChecked;

  MarriedCheckedInputEvent([this.marriedChecked = false]);
}

class FirstNamePartnerInputEvent extends AddCandidatePageEvent {
  final String firstNamePartner;

  FirstNamePartnerInputEvent(this.firstNamePartner);
}

class MiddleNamePartnerInputEvent extends AddCandidatePageEvent {
  final String middleNamePartner;

  MiddleNamePartnerInputEvent(this.middleNamePartner);
}

class LastNamePartnerInputEvent extends AddCandidatePageEvent {
  final String lastNamePartner;

  LastNamePartnerInputEvent(this.lastNamePartner);
}

class DobPartnerInputEvent extends AddCandidatePageEvent {
  final String dobPartner;

  DobPartnerInputEvent(this.dobPartner);
}

class PartnerIdentityNoInputEvent extends AddCandidatePageEvent {
  final String partnerIdentityNo;

  PartnerIdentityNoInputEvent(this.partnerIdentityNo);
}

class GenderPartnerInputEvent extends AddCandidatePageEvent {
  final AajicityMasterReference gender;

  GenderPartnerInputEvent(this.gender);
}

class RelationPartnerInputEvent extends AddCandidatePageEvent {
  final AajicityMasterReference relation;

  RelationPartnerInputEvent(this.relation);
}

class AddAgentSubmittedEvent extends AddCandidatePageEvent {
  AddAgentSubmittedEvent();
}

class AddCandidatePageInitialEvent extends AddCandidatePageEvent {
  AddCandidatePageInitialEvent();
}
