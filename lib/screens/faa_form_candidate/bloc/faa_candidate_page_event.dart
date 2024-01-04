part of 'faa_candidate_page_bloc.dart';

@immutable
abstract class FaaCandidatePageEvent {}

class FetchMasterDataEvent extends FaaCandidatePageEvent {
  FetchMasterDataEvent();
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
