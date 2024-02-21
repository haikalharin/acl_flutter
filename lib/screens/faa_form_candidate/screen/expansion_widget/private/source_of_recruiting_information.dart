import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../core/dialog/success_dialog.dart';
import '../../../../../core/widget/spinkit_indicator.dart';
import '../../../../../core/widget/text_input.dart';
import '../../../../../data/model/login_model/login_model.dart';
import '../../../../../data/model/master_data_model/master_data_model.dart';
import '../../../../../di.dart';
import '../../../../../utils/acl_color.dart';
import '../../../bloc/faa_candidate_page_bloc.dart';
import '../../tab_widget/private_data_page.dart';

enum Mode { create, update }

class SourceOfRecruitingInformation extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  const SourceOfRecruitingInformation({super.key, required this.formKey});

  @override
  State<SourceOfRecruitingInformation> createState() =>
      _SourceOfRecruitingInformationState();
}

class _SourceOfRecruitingInformationState
    extends State<SourceOfRecruitingInformation> {
  var firstName = TextEditingController(text: "");
  var middleName = TextEditingController(text: "");
  var lastName = TextEditingController(text: "");
  LoginModel? selectedItem;

  AajicityMasterReference data = AajicityMasterReference();

  String dataString = '';

  List<bool> listCheck = [];

  @override
  Widget build(BuildContext context) {
    Mode mode = Mode.create;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<FaaCandidatePageBloc, FaaCandidatePageState>(
      builder: (context, state) {
        state.masterDataModel?.masterData?.masterReferenceAll?.sourceinformation
            ?.masterReference
            ?.forEach((element) {
          listCheck.add(false);
        });
        return SingleChildScrollView(
            child: Card(
          child: ExpansionTile(
            title: RichText(
              textAlign: TextAlign.start,
              maxLines: 5,
              text: TextSpan(
                // Note: Styles for TextSpans must be explicitly defined.
                // Child text spans will inherit styles from parent
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Sumber Informasi Perekrutan',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: AclColors.greyDarkFontColor,
                      )),
                  const TextSpan(
                      text: '*',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: AclColors.red,
                      )),
                  TextSpan(
                    text: isCheck && state.sourceInformation.isNotValid
                        ? 'Mohon diisi'
                        : '',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: AclColors.red,
                    ),
                  ),
                ],
              ),
            ),
            collapsedBackgroundColor: AclColors.greyDivider,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    for (int index = 0;
                        index <
                            (state
                                    .masterDataModel
                                    ?.masterData
                                    ?.masterReferenceAll
                                    ?.sourceinformation
                                    ?.masterReference
                                    ?.length ??
                                0);
                        index++)
                      CheckboxListTile(
                        title: Text(state
                                .masterDataModel
                                ?.masterData
                                ?.masterReferenceAll
                                ?.sourceinformation
                                ?.masterReference?[index]
                                .longDescriptionInd ??
                            ''),
                        value: listCheck[index],
                        onChanged: (newValue) {
                          data = state
                                  .masterDataModel
                                  ?.masterData
                                  ?.masterReferenceAll
                                  ?.sourceinformation
                                  ?.masterReference?[index] ??
                              AajicityMasterReference();
                          dataString = data.longDescriptionInd ?? '';

                          for (int index = 0;
                              index < (listCheck.length);
                              index++) {
                            if (listCheck[index] == true) {
                              setState(() {
                                listCheck[index] = false;
                              });
                            }
                          }
                          setState(() {
                            listCheck[index] = newValue ?? false;
                            if (newValue == false) {
                              data = AajicityMasterReference();
                              dataString = data.longDescriptionInd ?? '';
                            }
                          });

                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return SuccessDialog(
                          //       title: data.longDescriptionInd??'',
                          //       isProgressed: false,
                          //     );
                          //   },
                          // );

                          // Update the isChecked value for the item
                          // based on your logic.
                          // You may need to dispatch an event to the bloc.
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    if (dataString.contains('Others'))
                      const SizedBox(height: 2),
                    if (dataString.contains('Others'))
                      TextInput(
                        icon: const Icon(Icons.person),
                        labelText: "Other",
                        // initialValue: postTitle,
                        validator: (String? value) {
                          if (value!.isNotEmpty) return null;
                          return "Mohon diisi";
                        },
                        onChanged: (String value) {
                          dataString = value;
                          getIt<FaaCandidatePageBloc>()
                              .add(SourceInformationInputEvent(value));
                        },
                      ),
                    const SizedBox(height: 2),
                  ],
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
