import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../core/widget/spinkit_indicator.dart';
import '../../../../../core/widget/text_input.dart';
import '../../../../../data/model/login_model/login_model.dart';
import '../../../../../di.dart';
import '../../../../../utils/acl_color.dart';
import '../../../bloc/faa_candidate_page_bloc.dart';

enum Mode { create, update }
class SourceOfRecruitingInformation extends StatefulWidget {
  final GlobalKey<FormState> formKey;
   const SourceOfRecruitingInformation({super.key, required this.formKey});

  @override
  State<SourceOfRecruitingInformation> createState() => _SourceOfRecruitingInformationState();
}

class _SourceOfRecruitingInformationState extends State<SourceOfRecruitingInformation> {
  var firstName = TextEditingController(text: "");
  var middleName = TextEditingController(text: "");
  var lastName = TextEditingController(text: "");
  LoginModel? selectedItem;
  bool checkedValuePersonalContact = false;
  bool checkedValueRefferal = false;
  bool checkedNeedValueSocialMedia = false;
  bool checkedValueAdvertisement = false;
  bool checkedValueRecruitingCampus = false;
  bool checkedValueJobFair = false;
  bool checkedValueAAJIProgram = false;
  bool checkedValueNasabah = false;
  bool checkedValueOther = false;
  bool isCheck = false;
  var data = [
    LoginModel(name: 'adadada', uid: '1'),
    LoginModel(name: 'bccccc', uid: '2'),
    LoginModel(name: 'cfffffff', uid: '3'),
    LoginModel(name: 'dggggg', uid: '4'),
    LoginModel(name: 'errrrr', uid: '5'),
    LoginModel(name: 'fuuuuu', uid: '6'),
  ];

  @override
  Widget build(BuildContext context) {
    Mode mode = Mode.create;
    var width = MediaQuery.of(context).size.width;
    return  SingleChildScrollView(
      child: Card(
        child: ExpansionTile(
            title: const Text(
              'Sumber Informasi Perekrutan',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          collapsedBackgroundColor: AclColors.greyDivider,
            children: <Widget>[
              BlocBuilder<FaaCandidatePageBloc, FaaCandidatePageState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Stack(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(height: 2),
                              CheckboxListTile(
                                title: const Text("Kontak Personal"),
                                value: checkedValuePersonalContact,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValuePersonalContact = newValue ?? false;
                                     checkedValueRefferal = false;
                                     checkedNeedValueSocialMedia = false;
                                     checkedValueAdvertisement = false;
                                     checkedValueRecruitingCampus = false;
                                     checkedValueJobFair = false;
                                     checkedValueAAJIProgram = false;
                                     checkedValueNasabah = false;
                                     checkedValueOther = false;
                                  });

                                  // getIt<FaaCandidatePageBloc>().add(
                                  //     MarriedCheckedInputEvent(newValue ?? false));
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              const SizedBox(height: 2),
                              CheckboxListTile(
                                title: const Text("Refferal"),
                                value: checkedValueRefferal,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValueRefferal = newValue ?? false;
                                    checkedValuePersonalContact = false;
                                    checkedNeedValueSocialMedia = false;
                                    checkedValueAdvertisement = false;
                                    checkedValueRecruitingCampus = false;
                                    checkedValueJobFair = false;
                                    checkedValueAAJIProgram = false;
                                    checkedValueNasabah = false;
                                    checkedValueOther = false;
                                  });

                                  // getIt<FaaCandidatePageBloc>().add(
                                  //     MarriedCheckedInputEvent(newValue ?? false));
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              const SizedBox(height: 2),
                              CheckboxListTile(
                                title: const Text("Sosial Media"),
                                value: checkedNeedValueSocialMedia,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedNeedValueSocialMedia = newValue ?? false;
                                    checkedValuePersonalContact = false;
                                    checkedValueRefferal = false;
                                    checkedValueAdvertisement = false;
                                    checkedValueRecruitingCampus = false;
                                    checkedValueJobFair = false;
                                    checkedValueAAJIProgram = false;
                                    checkedValueNasabah = false;
                                    checkedValueOther = false;
                                  });
                                  // getIt<FaaCandidatePageBloc>().add(
                                  //     MarriedCheckedInputEvent(newValue ?? false));
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              const SizedBox(height: 2),
                              CheckboxListTile(
                                title: const Text("Advertisement"),
                                value: checkedValueAdvertisement,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValueAdvertisement = newValue ?? false;
                                    checkedValuePersonalContact = false;
                                    checkedValueRefferal = false;
                                    checkedNeedValueSocialMedia = false;
                                    checkedValueRecruitingCampus = false;
                                    checkedValueJobFair = false;
                                    checkedValueAAJIProgram = false;
                                    checkedValueNasabah = false;
                                    checkedValueOther = false;
                                  });
                                  // getIt<FaaCandidatePageBloc>().add(
                                  //     MarriedCheckedInputEvent(newValue ?? false));
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              const SizedBox(height: 2),
                              CheckboxListTile(
                                title: const Text("Recruiting Kampus"),
                                value: checkedValueRecruitingCampus,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValueRecruitingCampus = newValue ?? false;
                                    checkedValuePersonalContact = false;
                                    checkedValueRefferal = false;
                                    checkedNeedValueSocialMedia = false;
                                    checkedValueAdvertisement = false;
                                    checkedValueJobFair = false;
                                    checkedValueAAJIProgram = false;
                                    checkedValueNasabah = false;
                                    checkedValueOther = false;
                                  });
                                  // getIt<FaaCandidatePageBloc>().add(
                                  //     MarriedCheckedInputEvent(newValue ?? false));
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              const SizedBox(height: 2),
                              CheckboxListTile(
                                title: const Text("Job Fair"),
                                value: checkedValueJobFair,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValueJobFair = newValue ?? false;
                                    checkedValuePersonalContact = false;
                                    checkedValueRefferal = false;
                                    checkedNeedValueSocialMedia = false;
                                    checkedValueAdvertisement = false;
                                    checkedValueRecruitingCampus = false;
                                    checkedValueAAJIProgram = false;
                                    checkedValueNasabah = false;
                                    checkedValueOther = false;
                                  });
                                  // getIt<FaaCandidatePageBloc>().add(
                                  //     MarriedCheckedInputEvent(newValue ?? false));
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              const SizedBox(height: 2),
                              CheckboxListTile(
                                title: const Text("AAJI Program"),
                                value: checkedValueAAJIProgram,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValueAAJIProgram = newValue ?? false;
                                    checkedValuePersonalContact = false;
                                    checkedValueRefferal = false;
                                    checkedNeedValueSocialMedia = false;
                                    checkedValueAdvertisement = false;
                                    checkedValueRecruitingCampus = false;
                                    checkedValueJobFair = false;
                                    checkedValueNasabah = false;
                                    checkedValueOther = false;
                                  });
                                  // getIt<FaaCandidatePageBloc>().add(
                                  //     MarriedCheckedInputEvent(newValue ?? false));
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              const SizedBox(height: 2),
                              CheckboxListTile(
                                title: const Text("Nasabah"),
                                value: checkedValueNasabah,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValueNasabah = newValue ?? false;
                                    checkedValuePersonalContact = false;
                                    checkedValueRefferal = false;
                                    checkedNeedValueSocialMedia = false;
                                    checkedValueAdvertisement = false;
                                    checkedValueRecruitingCampus = false;
                                    checkedValueJobFair = false;
                                    checkedValueAAJIProgram = false;
                                    checkedValueOther = false;
                                  });
                                  // getIt<FaaCandidatePageBloc>().add(
                                  //     MarriedCheckedInputEvent(newValue ?? false));
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              const SizedBox(height: 2),
                              CheckboxListTile(
                                title: const Text("Other(Sebutkan)"),
                                value: checkedValueOther,
                                onChanged: (newValue) {
                                  setState(() {
                                    checkedValueOther = newValue ?? false;
                                    checkedValuePersonalContact = false;
                                    checkedValueRefferal = false;
                                    checkedNeedValueSocialMedia = false;
                                    checkedValueAdvertisement = false;
                                    checkedValueRecruitingCampus = false;
                                    checkedValueJobFair = false;
                                    checkedValueAAJIProgram = false;
                                    checkedValueNasabah = false;
                                  });
                                  // getIt<FaaCandidatePageBloc>().add(
                                  //     MarriedCheckedInputEvent(newValue ?? false));
                                },
                                controlAffinity: ListTileControlAffinity
                                    .leading, //  <-- leading Checkbox
                              ),
                              checkedValueOther?  const SizedBox(height: 2):Container(),
                              checkedValueOther?TextInput(
                                icon: const Icon(Icons.person),
                                label: const Text("Other"),
                                // initialValue: postTitle,
                                validator: (String? value) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                },
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(FirstNameInputEvent(value));
                                },
                              ):Container(),
                              const SizedBox(height: 2),

                            ],
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
            ],
          ),
      ),
    );

  }
}
