import 'package:acl_flutter/common/app_extension.dart';
import 'package:acl_flutter/core/dialog/success_dialog.dart';
import 'package:acl_flutter/core/widget/dropdown/drop_down_city.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../core/dialog/retry_dialog.dart';
import '../../../core/router/routes.dart';
import '../../../core/widget/custom_image_picker.dart';
import '../../../core/widget/date_time_picker_form.dart';
import '../../../core/widget/dropdown/drop_down_gender.dart';
import '../../../core/widget/dropdown/drop_down_occupation.dart';
import '../../../core/widget/dropdown/drop_down_prev_company.dart';
import '../../../core/widget/dropdown/drop_down_province.dart';
import '../../../core/widget/dropdown/drop_down_relation.dart';
import '../../../core/widget/spinkit_indicator.dart';
import '../../../core/widget/text_input.dart';
import '../../../data/model/login_model/login_model.dart';
import '../../../data/model/master_data_model/master_data_model.dart';
import '../../../di.dart';
import '../../../utils/acl_color.dart';
import '../bloc/add_candidate_page_bloc.dart';
import '../../../core/widget/dropdown/drop_down_country.dart';

enum Mode { create, update }

class AddCandidatePage extends StatefulWidget {
  const AddCandidatePage({Key? key}) : super(key: key);

  @override
  State<AddCandidatePage> createState() => _AddCandidatePageState();
}

class _AddCandidatePageState extends State<AddCandidatePage> {
  final formKey = GlobalKey<FormState>();
  var aauiController = TextEditingController(text: "");
  var noIdentitySpouse = TextEditingController(text: "");
  var firstNameSpouse = TextEditingController(text: "");
  var middleNameSpouse = TextEditingController(text: "");
  var lastNameSpouse = TextEditingController(text: "");
  var dobSpouse = TextEditingController(text: "");
  AajicityMasterReference? initialGenderSpouse = AajicityMasterReference();
  AajicityMasterReference? initialRelationSpouse = AajicityMasterReference();

  LoginModel? selectedItem;
  bool checkedValueAAJI = false;
  bool checkedValueAASI = false;
  bool checkedNeedValueAAUI = false;
  bool checkedValueAAUI = false;
  bool checkedValueMarriage = true;
  bool isCheck = false;
  bool isInitGender = false;
  bool isInitRelation = false;
  var data = [
    LoginModel(name: 'adadada', uid: '1'),
    LoginModel(name: 'bccccc', uid: '2'),
    LoginModel(name: 'cfffffff', uid: '3'),
    LoginModel(name: 'dggggg', uid: '4'),
    LoginModel(name: 'errrrr', uid: '5'),
    LoginModel(name: 'fuuuuu', uid: '6'),
  ];

  @override
  void initState() {
    getIt<AddCandidatePageBloc>().add(FetchMasterDataEvent());
    super.initState();
  }

  @override
  void dispose() {
    getIt<AddCandidatePageBloc>().add(AddCandidatePageInitialEvent());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Mode mode = Mode.create;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Permintaan Pemeriksaan'),
      ),
      body: BlocListener<AddCandidatePageBloc, AddCandidatePageState>(
        listener: (context, state) async {
          if (state.submitStatus.isSuccess &&
              state.message == 'create-register') {
            getIt<AddCandidatePageBloc>().add(AddAgentDocSubmittedEvent());
          }
          if (state.submitStatus.isSuccess && state.message == 'send-doc') {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const SuccessDialog(
                  title: "Success",
                  isProgressed: false,
                );
              },
            );
            await Future.delayed(const Duration(seconds: 2));
            if (context.mounted) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                Routes.sidebarPage,
                (Route<dynamic> route) => false,
              );
            }
          }
          if (state.submitStatus.isFailure) {
            if (context.mounted) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return RetryDialog(
                    title: state.message ?? "Error",
                    onCancelPressed: () => Navigator.pop(context),
                  );
                },
              );
            }
          }
        },
        child: BlocBuilder<AddCandidatePageBloc, AddCandidatePageState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 8),
                          TextInput(
                            icon: const Icon(Icons.person),
                            label: const Text("Nama Depan(sesuai KTP)"),
                            // initialValue: postTitle,
                            validator: (String? value) {
                              if (value!.isNotEmpty) return null;
                              return "Mohon diisi";
                            },
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(FirstNameInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            isMandatory: false,
                            icon: const Icon(Icons.person),
                            label: const Text("Nama tengah(sesuai KTP)"),
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(MiddleNameInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            isMandatory: false,
                            icon: const Icon(Icons.person),
                            label: const Text("Nama belakang(sesuai KTP)"),
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(LastNameInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          DateTimePickerForm(
                            label: const Text("Tanggal lahir"),
                            selectedDateTime: (DateTime date) {
                              var dateTime =
                                  "${date.year}-${date.month}-${date.day}";
                              getIt<AddCandidatePageBloc>()
                                  .add(DobInputEvent(dateTime));
                            },
                            validator: (String? value) {
                              if (value!.isNotEmpty) return null;
                              return "Mohon diisi";
                            },
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            icon: const Icon(Icons.add_card_rounded),
                            label: const Text("No KTP"),
                            maxLength: 16,
                            keyboardType: TextInputType.phone,
                            validator: (String? value) {
                              if (state.identityNo.isNotValid) {
                                return state.identityNo.invalidIdentityNo;
                              }
                              return null;
                            },
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(IdentityNoInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          CustomImagePicker(
                            title: 'Foto KTP',
                            onImagePicked: (value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(IdentityImageInputEvent(value));
                            },
                            errorText: isCheck && state.identityImage.isNotValid
                                ? 'Mohon diisi'
                                : null,
                          ),
                          const SizedBox(height: 8),
                          CustomImagePicker(
                            title: 'Foto Selfie Beserta KTP',
                            onImagePicked: (value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(IdentitySelfieImageInputEvent(value));
                            },
                            errorText:
                                isCheck && state.identitySelfieImage.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            icon: const Icon(Icons.add_card_rounded),
                            label: const Text("No KK"),
                            maxLength: 16,
                            keyboardType: TextInputType.phone,
                            validator: (String? value) {
                              if (state.kkNo.isNotValid) {
                                return "KK harus 16 digit";
                              }
                              return null;
                            },
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(KkNoInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          CustomImagePicker(
                            title: 'Foto KK',
                            onImagePicked: (value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(KkImageInputEvent(value));
                            },
                            errorText: isCheck && state.kkImage.isNotValid
                                ? 'Mohon diisi'
                                : null,
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            title: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: const Text(
                                        'Alamat rumah (sesuai KTP)',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: AclColors.greyDarkFontColor,
                                        ))),
                                Container(
                                    margin: const EdgeInsets.only(
                                        left: 5, bottom: 5),
                                    child: const Text(
                                      '*',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        color: AclColors.redAccent,
                                      ),
                                    ))
                              ],
                            ),
                            icon: const Icon(Icons.add_location),
                            label: const Text("(Gedung.../Jalan...)"),
                            validator: (String? value) {
                              if (value!.isNotEmpty) return null;
                              return "Mohon diisi";
                            },
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(AddressInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            icon: const Icon(Icons.add_location),
                            isMandatory: false,
                            label: const Text("(RT.../RW...)"),

                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(RtRwInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            icon: const Icon(Icons.add_location),
                            isMandatory: false,
                            label: const Text("(Kelurahan.../Kecamatan...)"),
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(KecKelInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            icon: const Icon(Icons.signpost_sharp),
                            label: const Text("Kode Pos"),
                            keyboardType: TextInputType.phone,
                            maxLength: 5,
                            validator: (String? value) {
                              if (state.postalCode.isNotValid) {
                                return state.postalCode.invalidZipcode;
                              }
                              return null;
                            },
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(PostalCodeInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          BlocBuilder<AddCandidatePageBloc,
                              AddCandidatePageState>(
                            builder: (context, state) {
                              return DropDownCountry(
                                title: 'Negara',
                                icon: const Icon(
                                  Icons.account_balance_rounded,
                                  color: AclColors.greyDarkFontColor,
                                ),
                                onChanged: (value) {
                                  getIt<AddCandidatePageBloc>()
                                      .add(CountryInputEvent(value));
                                },
                                readOnly: true,
                                initialItem: state
                                    .masterDataModel
                                    ?.masterData
                                    ?.masterReferenceAll
                                    ?.country
                                    ?.masterReference
                                    ?.where((element) => element.id == 744)
                                    .toList()
                                    .first,
                                items: state
                                        .masterDataModel
                                        ?.masterData
                                        ?.masterReferenceAll
                                        ?.country
                                        ?.masterReference
                                        ?.where((element) => element.id == 744)
                                        .toList() ??
                                    [],
                                errorText: isCheck == true &&
                                        state.countryId.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                          BlocBuilder<AddCandidatePageBloc,
                              AddCandidatePageState>(
                            buildWhen: (current, previous) =>
                                current.provinceId != previous.provinceId ||
                                current.masterDataModel !=
                                    previous.masterDataModel,
                            builder: (context, state) {
                              return DropDownProvince(
                                title: 'Provinsi',
                                icon: const Icon(
                                  Icons.account_balance_rounded,
                                  color: AclColors.greyDarkFontColor,
                                ),
                                onChanged: (AajicityMasterReference value) {
                                  getIt<AddCandidatePageBloc>()
                                      .add(ProvinceInputEvent(value));
                                },
                                items: state
                                        .masterDataModel
                                        ?.masterData
                                        ?.masterReferenceAll
                                        ?.province
                                        ?.masterReference ??
                                    [],
                                errorText: isCheck == true &&
                                        state.provinceId.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              );
                            },
                          ),
                          if (state.provinceId.isValid)
                            const SizedBox(height: 8),
                            BlocBuilder<AddCandidatePageBloc,
                                AddCandidatePageState>(
                              buildWhen: (current, previous) =>
                                  current.cityId != previous.cityId ||
                                  current.provinceId != previous.provinceId ||
                                  current.masterDataModel !=
                                      previous.masterDataModel,
                              builder: (context, state) {
                                return   state.provinceId.isValid?DropDownCity(
                                  title: 'Kota',
                                  // readOnly:
                                  //     state.provinceId.isValid ? false : true,
                                  icon: const Icon(
                                    Icons.account_balance_rounded,
                                    color: AclColors.greyDarkFontColor,
                                  ),
                                  onChanged: (CityMasterReference value) {
                                    getIt<AddCandidatePageBloc>()
                                        .add(CityInputEvent(value));
                                  },
                                  items: state
                                          .masterDataModel
                                          ?.masterData
                                          ?.masterReferenceAll
                                          ?.city
                                          ?.masterReference
                                          ?.where((element) =>
                                              element.referTo ==
                                              state.provinceId.value)
                                          .toList() ??
                                      [],
                                  errorText:
                                      isCheck == true && state.cityId.isNotValid
                                          ? 'Mohon diisi'
                                          : null,
                                ):Container();
                              },
                            ),
                          const SizedBox(height: 8),
                          BlocBuilder<AddCandidatePageBloc,
                              AddCandidatePageState>(
                            buildWhen: (current, previous) =>
                                current.occupationId != previous.occupationId ||
                                current.masterDataModel !=
                                    previous.masterDataModel,
                            builder: (context, state) {
                              return DropDownOccupation(
                                title: 'Pekerjaan',
                                icon: const Icon(
                                  Icons.work,
                                  color: AclColors.greyDarkFontColor,
                                ),
                                onChanged:
                                    (CheckingstatusMasterReference value) {
                                  getIt<AddCandidatePageBloc>()
                                      .add(OccupationInputEvent(value));
                                },
                                items: state
                                        .masterDataModel
                                        ?.masterData
                                        ?.masterReferenceAll
                                        ?.occupationtype
                                        ?.masterReference ??
                                    [],
                                errorText: isCheck == true &&
                                        state.occupationId.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              );
                            },
                          ),
                          const SizedBox(height: 16),
                          CheckboxListTile(
                            title: const Text(
                                "Apakah Anda pernah bekerja di perusahaan asuransi jiwa sebelumnya?"),
                            value: checkedValueAAJI,
                            onChanged: (newValue) {
                              setState(() {
                                checkedValueAAJI = newValue ?? false;
                              });
                              getIt<AddCandidatePageBloc>().add(
                                  AajiCheckedInputEvent(newValue ?? false));
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            isMandatory: checkedValueAAJI,
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            icon: const Icon(Icons.add_card_rounded),
                            label: const Text("No lisensi AAJI"),
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(AajiNoInputEvent(value));
                            },
                            validator: (String? value) {
                              if (checkedValueAAJI) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 8),
                          if (checkedValueAAJI)
                            DropDownPrevCompany(
                              title: 'Perusahaan sebelumnya',
                              isMandatory: checkedValueAAJI,
                              readOnly: !checkedValueAAJI,
                              icon: const Icon(
                                Icons.add_chart,
                                color: AclColors.greyDarkFontColor,
                              ),
                              onChanged: (AajicityMasterReference value) {
                                getIt<AddCandidatePageBloc>()
                                    .add(GenderPartnerInputEvent(value));
                              },
                              items: state
                                      .masterDataModel
                                      ?.masterData
                                      ?.masterReferenceAll
                                      ?.prevcompany
                                      ?.masterReference ??
                                  [],
                              errorText: isCheck && state.genderId.isNotValid
                                  ? 'Mohon diisi'
                                  : null,
                            ),
                          const SizedBox(height: 8),
                          CustomImagePicker(
                            title: 'Foto Lisensi AAJI',
                            isMandatory: checkedValueAAJI,
                            onImagePicked: (value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(AajiImageInputEvent(value));
                            },
                            errorText: checkedValueAAJI &&
                                    isCheck &&
                                    state.imageLicenceAAJI.isNotValid
                                ? 'Mohon diisi'
                                : null,
                          ),
                          const SizedBox(height: 16),
                          CheckboxListTile(
                            title: const Text(
                                "Apakah Anda pernah bekerja di perusahaan asuransi syariah sebelumnya?"),
                            value: checkedValueAASI,
                            onChanged: (newValue) {
                              setState(() {
                                checkedValueAASI = newValue ?? false;
                              });
                              getIt<AddCandidatePageBloc>().add(
                                  AasiCheckedInputEvent(newValue ?? false));
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            isMandatory: checkedValueAASI,
                            maxLength: 16,
                            keyboardType: TextInputType.phone,
                            icon: const Icon(Icons.add_card_rounded),
                            label: const Text("No lisensi AASI"),
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(AasiNoInputEvent(value));
                            },
                            validator: (String? value) {
                              if (checkedValueAASI) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 8),
                          if (checkedValueAASI)
                            DropDownPrevCompany(
                              title: 'Perusahaan sebelumnya',
                              isMandatory: checkedValueAASI,
                              readOnly: !checkedValueAASI,
                              icon: const Icon(
                                Icons.add_chart,
                                color: AclColors.greyDarkFontColor,
                              ),
                              onChanged: (AajicityMasterReference value) {
                                getIt<AddCandidatePageBloc>()
                                    .add(GenderPartnerInputEvent(value));
                              },
                              items: state
                                      .masterDataModel
                                      ?.masterData
                                      ?.masterReferenceAll
                                      ?.prevcompanyaasi
                                      ?.masterReference ??
                                  [],
                              errorText: isCheck && state.genderId.isNotValid
                                  ? 'Mohon diisi'
                                  : null,
                            ),
                          const SizedBox(height: 8),
                          CustomImagePicker(
                            title: 'Foto Lisensi AASI',
                            isMandatory: checkedValueAASI,
                            onImagePicked: (value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(AasiImageInputEvent(value));
                            },
                            errorText: checkedValueAASI &&
                                    isCheck &&
                                    state.imageLicenceAASI.isNotValid
                                ? 'Mohon diisi'
                                : null,
                          ),
                          const SizedBox(height: 16),
                          CheckboxListTile(
                            title: const Text(
                                "Apakah Anda berminat untuk mengajukan lisensi asuransi umum?"),
                            value: checkedNeedValueAAUI,
                            onChanged: (newValue) {
                              setState(() {
                                checkedNeedValueAAUI = newValue ?? false;
                                checkedValueAAUI = false;
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                WidgetsBinding.instance.addPostFrameCallback(
                                    (_) => aauiController.clear());
                              });
                              //remove focus

                              getIt<AddCandidatePageBloc>()
                                  .add(AauiCheckedInputEvent(false)); // cl
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                          if (checkedNeedValueAAUI) const SizedBox(height: 8),
                          if (checkedNeedValueAAUI)
                            CheckboxListTile(
                              title: const Text(
                                  "Apakah Anda pernah bekerja di perusahaan asuransi utama sebelumnya?"),
                              value: checkedValueAAUI,
                              onChanged: (newValue) {
                                setState(() {
                                  checkedValueAAUI = newValue ?? false;
                                });
                                getIt<AddCandidatePageBloc>().add(
                                    AauiCheckedInputEvent(newValue ?? false));
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            ),
                          if (checkedNeedValueAAUI) const SizedBox(height: 8),
                          if (checkedNeedValueAAUI)
                            TextInput(
                              controller: aauiController,
                              maxLength: 28,
                              keyboardType: TextInputType.phone,
                              isMandatory: checkedValueAAUI,
                              icon: const Icon(Icons.add_card_rounded),
                              label: const Text("No lisensi AAUI"),
                              onChanged: (String value) {
                                getIt<AddCandidatePageBloc>()
                                    .add(AauiNoInputEvent(value));
                              },
                              validator: (String? value) {
                                if (checkedValueAAUI) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          if (checkedNeedValueAAUI) const SizedBox(height: 8),
                          if (checkedValueAAUI)
                            DropDownPrevCompany(
                              title: 'Perusahaan sebelumnya',
                              isMandatory: checkedValueAAUI,
                              readOnly: !checkedValueAAUI,
                              icon: const Icon(
                                Icons.add_chart,
                                color: AclColors.greyDarkFontColor,
                              ),
                              onChanged: (AajicityMasterReference value) {
                                getIt<AddCandidatePageBloc>()
                                    .add(GenderPartnerInputEvent(value));
                              },
                              items: state
                                      .masterDataModel
                                      ?.masterData
                                      ?.masterReferenceAll
                                      ?.prevcompanyaaui
                                      ?.masterReference ??
                                  [],
                              errorText: isCheck && state.genderId.isNotValid
                                  ? 'Mohon diisi'
                                  : null,
                            ),
                          if (checkedNeedValueAAUI) const SizedBox(height: 8),
                          if (checkedNeedValueAAUI)
                            CustomImagePicker(
                              title: 'Foto Lisensi AAUI',
                              isMandatory: checkedValueAAUI,
                              onImagePicked: (value) {
                                getIt<AddCandidatePageBloc>()
                                    .add(AauiImageInputEvent(value));
                              },
                              errorText: checkedValueAAUI &&
                                      isCheck &&
                                      state.imageLicenceAAUI.isNotValid
                                  ? 'Mohon diisi'
                                  : null,
                            ),
                          const SizedBox(height: 16),
                          CheckboxListTile(
                            title: const Text("Menikah"),
                            value: checkedValueMarriage,
                            onChanged: (newValue) {
                              setState(() {
                                checkedValueMarriage = newValue ?? true;
                                if(newValue == false) {
                                  if(isCheck) {
                                    formKey.currentState!.validate();
                                  }
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  WidgetsBinding.instance.addPostFrameCallback(
                                          (_) =>
                                      [
                                        noIdentitySpouse.clear(),
                                        firstNameSpouse.clear(),
                                        middleNameSpouse.clear(),
                                        lastNameSpouse.clear(),
                                        dobSpouse.clear(),
                                      ]);
                                  setState(() {
                                    initialGenderSpouse = null;
                                    initialRelationSpouse = null;
                                    isInitGender =true;
                                    isInitRelation =true;
                                  });
                                }
                              });

                              getIt<AddCandidatePageBloc>().add(
                                  MarriedCheckedInputEvent(newValue ?? true));
                            },
                            controlAffinity: ListTileControlAffinity
                                .leading, //  <-- leading Checkbox
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            controller: noIdentitySpouse,
                            icon: const Icon(Icons.person),
                            isMandatory: checkedValueMarriage,
                            readOnly: !checkedValueMarriage,
                            keyboardType: TextInputType.phone,
                            maxLength: 16,
                            label: const Text("No KTP Pasangan"),
                            // initialValue: postTitle,
                            validator: (String? value) {
                              if (checkedValueMarriage) {
                                if (state.identityNoPartner.isNotValid) {
                                  return state
                                      .identityNoPartner.invalidIdentityNo;
                                }
                                return null;
                              } else {
                                return null;
                              }
                            },
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(PartnerIdentityNoInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            controller: firstNameSpouse,
                            icon: const Icon(Icons.person),
                            label: const Text("Nama Depan(sesuai KTP)"),
                            isMandatory: checkedValueMarriage,
                            readOnly: !checkedValueMarriage,
                            validator: (String? value) {
                              if (checkedValueMarriage) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              } else {
                                return null;
                              }
                            },
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(FirstNamePartnerInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            controller: middleNameSpouse,
                            isMandatory: false,
                            readOnly: !checkedValueMarriage,
                            icon: const Icon(Icons.person),
                            label: const Text("Nama tengah(sesuai KTP)"),
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(MiddleNamePartnerInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          TextInput(
                            controller: lastNameSpouse,
                            isMandatory: false,
                            readOnly: !checkedValueMarriage,
                            icon: const Icon(Icons.person),
                            label: const Text("Nama belakang(sesuai KTP)"),
                            onChanged: (String value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(LastNamePartnerInputEvent(value));
                            },
                          ),
                          const SizedBox(height: 8),
                          DateTimePickerForm(
                            controller: dobSpouse,
                            label: const Text("Tanggal lahir pasangan"),
                            isMandatory: checkedValueMarriage,
                            readOnly: !checkedValueMarriage,
                            selectedDateTime: (DateTime date) {
                              var dateTime =
                                  "${date.year}-${date.month}-${date.day}";
                              getIt<AddCandidatePageBloc>()
                                  .add(DobPartnerInputEvent(dateTime));
                            },
                            validator: (String? value) {
                              if (checkedValueMarriage) {
                                if (value!.isNotEmpty) return null;
                                return "Mohon diisi";
                              } else {
                                return null;
                              }
                            },
                          ),
                          const SizedBox(height: 8),
                          DropDownGender(
                            title: 'Jenis kelamin',
                            isMandatory: checkedValueMarriage,
                            readOnly: !checkedValueMarriage,
                            icon: const Icon(
                              Icons.add_chart,
                              color: AclColors.greyDarkFontColor,
                            ),
                            onChanged: (AajicityMasterReference value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(GenderPartnerInputEvent(value));
                              isInitGender = false;
                            },
                            initialItem: initialGenderSpouse,
                            isInit: isInitGender,
                            items: state
                                    .masterDataModel
                                    ?.masterData
                                    ?.masterReferenceAll
                                    ?.gender
                                    ?.masterReference ??
                                [],
                            errorText: isCheck &&
                                    state.genderId.isNotValid &&
                                    checkedValueMarriage
                                ? 'Mohon diisi'
                                : null,
                          ),
                          const SizedBox(height: 8),
                          DropDownRelation(
                            title: 'Hubungan Dengan Kandidat',
                            isMandatory: checkedValueMarriage,
                            readOnly: !checkedValueMarriage,
                            icon: const Icon(
                              Icons.add_chart,
                              color: AclColors.greyDarkFontColor,
                            ),
                            onChanged: (AajicityMasterReference value) {
                              getIt<AddCandidatePageBloc>()
                                  .add(RelationPartnerInputEvent(value));
                              isInitRelation = false;
                            },
                            initialItem: initialRelationSpouse,
                            isInit: isInitRelation,
                            items: state
                                    .masterDataModel
                                    ?.masterData
                                    ?.masterReferenceAll
                                    ?.relation
                                    ?.masterReference ??
                                [],
                            errorText: isCheck &&
                                    state.relationId.isNotValid &&
                                    checkedValueMarriage
                                ? 'Mohon diisi'
                                : null,
                          ),
                          SizedBox(
                            width: width * 0.4,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  getIt<AddCandidatePageBloc>()
                                      .add(AddAgentSubmittedEvent());
                                }
                                setState(() {
                                  isCheck = true;
                                });
                              },
                              child: Text("Selanjutnya".toCapital),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  state.submitStatus.isInProgress
                      ? const Center(
                          child: SpinKitIndicator(type: SpinKitType.circle))
                      : Container(),

                  // state.submitStatus.isFailure
                  //     ? showDialog(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return RetryDialog(
                  //       title: state.message ?? "Error",
                  //       onCancelPressed: () =>Navigator.pop(context),
                  //     );
                  //   },
                  // ): Container()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
