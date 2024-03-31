import 'package:acl_flutter/common/widget/dropdown/drop_down_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/app_string.dart';
import '../../../../../common/widget/custom_image_picker.dart';
import '../../../../../common/widget/dropdown/drop_down_general.dart';
import '../../../../../common/widget/dropdown/drop_down_general_faa.dart';
import '../../../../../common/widget/text_input.dart';
import '../../../../../data/model/login_model/login_model.dart';
import '../../../../../data/model/master_data_model/master_data_model.dart';
import '../../../../../di.dart';
import '../../../../../utils/acl_color.dart';
import '../../../bloc/faa_candidate_page_bloc.dart';
import '../../tab_widget/private_data_page.dart';

enum Mode { create, update }
class SpouseData extends StatefulWidget {
  final GlobalKey<FormState> formKey;
   const SpouseData({super.key, required this.formKey});

  @override
  State<SpouseData> createState() => _SpouseDataState();
}

class _SpouseDataState extends State<SpouseData> {
  var firstName = TextEditingController(text: "");
  var middleName = TextEditingController(text: "");
  var lastName = TextEditingController(text: "");
  LoginModel? selectedItem;
  bool checkedValueAAJI = false;
  bool checkedValueAASI = false;
  bool checkedNeedValueAAUI = false;
  bool checkedValueAAUI = false;
  bool checkedValueMarriage = false;
  bool checkedValueKpm = false;
  bool checkedValueResign = false;
  bool checkedValueTerminasi = false;
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
              'Data Pasangan',
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
                              const SizedBox(height: 8),
                              DropDownString(
                                title: AppString.textSpouseIsAgent,
                                displayClearIcon: false,
                                icon: const Icon(
                                  Icons.add_chart,
                                  color: AclColors.greyDarkFontColor,
                                ),
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(SpouseIsAgentInputEvent(value));
                                },
                                items: const ['Ya', 'Tidak'],
                                errorText: isCheck &&
                                    state.spouseIsAgent.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              ),
                              const SizedBox(height: 8),
                              TextInput(
                                icon: const Icon(Icons.person),
                                labelText: "Nama Agen/Leader",
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(FirstNamePartnerInputEvent(value));
                                },
                                validator: (String? value) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                },
                              ),
                              const SizedBox(height: 8),
                              DropDownGeneralFaa(
                                title: 'Hubungan Suami/Istr',
                                icon: const Icon(
                                  Icons.add_chart,
                                  color: AclColors.greyDarkFontColor,
                                ),
                                onChanged: (AajicityMasterReference value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(RelationPartnerInputEvent(value));
                                },
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
                              const SizedBox(height: 8),
                              TextInput(
                                icon: const Icon(Icons.person),
                                labelText: "Nama Direct Unit/Agency",
                                keyboardType: TextInputType.phone,
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(DirectUnitNameInputEvent(value));
                                },
                                validator: (String? value) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                },
                              ),

                              const SizedBox(height: 8),
                              BlocBuilder<FaaCandidatePageBloc,
                                  FaaCandidatePageState>(
                                builder: (context, state) {
                                  return DropDownGeneralFaa(
                                    title: 'Jabatan',
                                    icon: const Icon(
                                      Icons.account_balance_rounded,
                                      color: AclColors.greyDarkFontColor,
                                    ),
                                    onChanged: (AajicityMasterReference value) {
                                      getIt<FaaCandidatePageBloc>()
                                          .add(PositionSpouseInputEvent(value));
                                    },
                                    items: state
                                        .masterDataModel
                                        ?.masterData
                                        ?.masterReferenceAll
                                        ?.position
                                        ?.masterReference ??
                                        [],
                                    errorText: isCheck == true &&
                                        state.spousePositionId.isNotValid
                                        ? 'Mohon diisi'
                                        : null,
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              TextInput(
                                icon: const Icon(Icons.person),
                                labelText: "Kode Agen",
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(AgentCodeInputEvent(value));
                                },
                                validator: (String? value) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                },
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),

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
