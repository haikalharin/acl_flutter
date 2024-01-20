import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widget/custom_image_picker.dart';
import '../../../../../core/widget/text_input.dart';
import '../../../../../data/model/login_model/login_model.dart';
import '../../../../../di.dart';
import '../../../../../utils/acl_color.dart';

import '../../../bloc/faa_candidate_page_bloc.dart';

enum Mode { create, update }
class AauiData extends StatefulWidget {
  final GlobalKey<FormState> formKey;
   const AauiData({super.key, required this.formKey});

  @override
  State<AauiData> createState() => _AauiDataState();
}

class _AauiDataState extends State<AauiData> {
  var firstName = TextEditingController(text: "");
  var middleName = TextEditingController(text: "");
  var lastName = TextEditingController(text: "");
  LoginModel? selectedItem;
  bool checkedValueAASI = false;
  bool checkedValueAAJI = false;
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
              'Data AAUI',
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
                              TextInput(
                                isMandatory: checkedValueAAUI,
                                icon: const Icon(Icons.add_card_rounded),
                                label: const Text("No lisensi AAUI"),
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>()
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
                              const SizedBox(height: 8),
                              CustomImagePicker(
                                title: 'Foto Lisensi AAUI',
                                isMandatory: checkedValueAAUI,
                                onImagePicked: (value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(AauiImageInputEvent(value));
                                },
                                errorText: checkedValueAAUI && isCheck &&
                                    state.imageLicenceAAUI.isNotValid
                                    ? 'Mohon diisi'
                                    : null,
                              ),
                              const SizedBox(height: 16),
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
