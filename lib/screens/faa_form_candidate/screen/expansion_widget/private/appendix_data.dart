import 'package:acl_flutter/common/widget/dropdown/drop_down_general_faa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/widget/custom_image_picker.dart';
import '../../../../../common/widget/dropdown/drop_down_general.dart';
import '../../../../../data/model/login_model/login_model.dart';
import '../../../../../data/model/master_data_model/master_data_model.dart';
import '../../../../../di.dart';
import '../../../../../utils/acl_color.dart';
import '../../../bloc/faa_candidate_page_bloc.dart';
import '../../tab_widget/private_data_page.dart';

enum Mode { create, update }
class AppendixData extends StatefulWidget {
  final GlobalKey<FormState> formKey;
   const AppendixData({super.key, required this.formKey});

  @override
  State<AppendixData> createState() => _AppendixDataState();
}

class _AppendixDataState extends State<AppendixData> {
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
              'Lampiran',
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
                              BlocBuilder<FaaCandidatePageBloc,
                                  FaaCandidatePageState>(
                                builder: (context, state) {
                                  return DropDownGeneralFaa(
                                    title: 'Lain lain',
                                    isMandatory: false,
                                    icon: const Icon(
                                      Icons.account_balance_rounded,
                                      color: AclColors.greyDarkFontColor,
                                    ),
                                    onChanged: (AajicityMasterReference value) {
                                      getIt<FaaCandidatePageBloc>()
                                          .add(AppendixInputEvent(value));
                                    },
                                    items: state
                                        .masterDataModel
                                        ?.masterData
                                        ?.masterReferenceAll
                                        ?.sourceinformation
                                        ?.masterReference ??
                                        [],
                                    errorText:
                                    isCheck == true && state.appendixValueId.isNotValid
                                        ? 'Mohon diisi'
                                        : null,
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              CustomImagePicker(
                                title: 'Lain lain',
                                isMandatory: false,
                                onImagePicked: (value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(AppendixImageInputEvent(value));
                                },
                                errorText:  isCheck &&
                                    state.appendixImage.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
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
