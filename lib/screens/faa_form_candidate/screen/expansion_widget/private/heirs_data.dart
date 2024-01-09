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
class HeirsData extends StatefulWidget {
  final GlobalKey<FormState> formKey;
   const HeirsData({super.key, required this.formKey});

  @override
  State<HeirsData> createState() => _HeirsDataState();
}

class _HeirsDataState extends State<HeirsData> {
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
              'Data Ahli Waris',
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
                                icon: const Icon(Icons.person),
                                label: const Text("Nama ahli waris"),
                                // initialValue: postTitle,
                                validator: (String? value) {
                                  if (value!.isNotEmpty) return null;
                                  return "Mohon diisi";
                                },
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(FirstNameInputEvent(value));
                                },
                              ),
                              const SizedBox(height: 8),
                              TextInput(
                                isMandatory: false,
                                icon: const Icon(Icons.person),
                                label: const Text("Hubungan ahli waris"),
                                onChanged: (String value) {
                                  getIt<FaaCandidatePageBloc>()
                                      .add(MiddleNameInputEvent(value));
                                },
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