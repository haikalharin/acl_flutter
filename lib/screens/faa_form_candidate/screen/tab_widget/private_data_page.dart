import 'package:acl_flutter/common/app_extension.dart';
import 'package:acl_flutter/screens/faa_form_candidate/screen/expansion_widget/private/aaji_data.dart';
import 'package:acl_flutter/screens/faa_form_candidate/screen/expansion_widget/private/heirs_data.dart';
import 'package:acl_flutter/screens/faa_form_candidate/screen/expansion_widget/private/private_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/faa_candidate_page_bloc.dart';
import '../expansion_widget/private/aasi_data.dart';
import '../expansion_widget/private/appendix_data.dart';
import '../expansion_widget/private/npwp_and_bank_data.dart';
import '../expansion_widget/private/source_of_recruiting_information.dart';
import '../faa_form_candidate_page.dart';

enum Mode { create, update }
class PrivateDataPage extends StatefulWidget {
   const PrivateDataPage({super.key,});

  @override
  State<PrivateDataPage> createState() => _PrivateDataPageState();
}

class _PrivateDataPageState extends State<PrivateDataPage> {
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    Mode mode = Mode.create;
    var width = MediaQuery.of(context).size.width;
    return  BlocBuilder<FaaCandidatePageBloc, FaaCandidatePageState>(
  builder: (context, state) {
    return SingleChildScrollView(
      child: Column(children: [
        PrivateData(formKey: formKey),
        const SizedBox(height: 8),
        HeirsData(formKey: formKey),
        const SizedBox(height: 8),
        AajiData(formKey: formKey),
        const SizedBox(height: 8),
        AasiData(formKey: formKey),
        const SizedBox(height: 8),
        NpwpAndBankData(formKey: formKey),
        const SizedBox(height: 8),
        SourceOfRecruitingInformation(formKey: formKey),
        const SizedBox(height: 8),
        AppendixData(formKey: formKey),
        const SizedBox(height: 16),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // getIt<AddCandidatePageBloc>()
                //     .add(AddAgentSubmittedEvent());
               }

                isSuccesPrivateTab = true;

            },
            child: Text("Selanjutnya".toCapital),
          ),
        )
      ],),
    );
  },
);

  }
}
