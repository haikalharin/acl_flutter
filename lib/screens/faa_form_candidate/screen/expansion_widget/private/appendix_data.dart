import 'package:acl_flutter/common/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../core/widget/custom_image_picker.dart';
import '../../../../../core/widget/spinkit_indicator.dart';
import '../../../../../data/model/login_model/login_model.dart';
import '../../../../../data/model/master_data_model/master_data_model.dart';
import '../../../../../di.dart';
import '../../../../../utils/acl_color.dart';
import '../../../../../core/widget/dropdown/drop_down_city.dart';
import '../../../bloc/faa_candidate_page_bloc.dart';

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
                                  return DropDownCity(
                                    title: 'Lain lain',
                                    readOnly:
                                    state.provinceId.isValid ? false : true,
                                    icon: const Icon(
                                      Icons.account_balance_rounded,
                                      color: AclColors.greyDarkFontColor,
                                    ),
                                    onChanged: (CityMasterReference value) {
                                      getIt<FaaCandidatePageBloc>()
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
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              CustomImagePicker(
                                title: 'Lain lain',
                                isMandatory: checkedValueAAJI,
                                onImagePicked: (value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(AajiImageInputEvent(value));
                                },
                                errorText: checkedValueAAJI && isCheck &&
                                    state.imageLicenceAAJI.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              ),
                              const SizedBox(height: 8),
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
