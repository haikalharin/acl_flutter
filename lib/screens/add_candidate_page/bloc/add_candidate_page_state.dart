part of 'add_candidate_page_bloc.dart';

class AddCandidatePageState extends Equatable with FormzMixin {
  final FormzSubmissionStatus submitStatus;
  final MandatoryFieldValidator firstName;
  final MandatoryFieldValidator middleName;
  final MasterDataModel? masterDataModel;
  final AajicityMasterReference? province;
  final DropdownFieldValidator? provinceId;
  final String? moveTo;
  final bool checkedValueAAJI;
  final bool checkedValueAASI;
  final bool checkedNeedValueAAUI;
  final bool checkedValueAAUI;
  final bool checkedValueMarriage;

  const AddCandidatePageState({
    this.province,
    this.provinceId = const DropdownFieldValidator.pure(),
    this.firstName = const MandatoryFieldValidator.pure(),
    this.middleName = const MandatoryFieldValidator.pure(),
    this.masterDataModel,
    this.moveTo,
    this.checkedValueAAJI = false,
    this.checkedValueAASI = false,
    this.checkedNeedValueAAUI = false,
    this.checkedValueAAUI = false,
    this.checkedValueMarriage = false,
    this.submitStatus = FormzSubmissionStatus.initial,
  });

  @override
  List<Object?> get props =>
      [firstName, middleName, submitStatus, masterDataModel,provinceId,province];

  @override
  List<FormzInput> get inputs {
    List<FormzInput> data = [firstName];
    if (checkedValueAAJI) data.add(middleName);
    return data;
  }

  AddCandidatePageState copyWith({
    MandatoryFieldValidator? firstName,
    MandatoryFieldValidator? middleName,
    MasterDataModel? masterDataModel,
    String? moveTo,
    bool? checkedValueAAJI,
    bool? checkedValueAASI,
    bool? checkedNeedValueAAUI,
    bool? checkedValueAAUI,
    bool? checkedValueMarriage,
    AajicityMasterReference? province,
    DropdownFieldValidator? provinceId,
    FormzSubmissionStatus? submitStatus,
  }) {
    return AddCandidatePageState(
      firstName: firstName ?? this.firstName,
      middleName: middleName ?? this.middleName,
      masterDataModel: masterDataModel ?? this.masterDataModel,
      moveTo: moveTo ?? this.moveTo,
      checkedValueAAJI: checkedValueAAJI ?? this.checkedValueAAJI,
      checkedValueAASI: checkedValueAASI ?? this.checkedValueAASI,
      checkedNeedValueAAUI: checkedNeedValueAAUI ?? this.checkedNeedValueAAUI,
      checkedValueAAUI: checkedValueAAUI ?? this.checkedValueAAUI,
      checkedValueMarriage: checkedValueMarriage ?? this.checkedValueMarriage,
      province: province ?? this.province,
      provinceId: provinceId ?? this.provinceId,
      submitStatus: submitStatus ?? this.submitStatus,
    );
  }
}

class AddAgentPageInitial extends AddCandidatePageState {}
