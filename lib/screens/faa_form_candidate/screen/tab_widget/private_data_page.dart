import 'package:acl_flutter/common/app_extension.dart';
import 'package:acl_flutter/screens/faa_form_candidate/screen/expansion_widget/private/aaji_data.dart';
import 'package:acl_flutter/screens/faa_form_candidate/screen/expansion_widget/private/heirs_data.dart';
import 'package:acl_flutter/screens/faa_form_candidate/screen/expansion_widget/private/private_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../core/widget/custom_image_picker.dart';
import '../../../../core/widget/date_time_picker_form.dart';
import '../../../../core/widget/spinkit_indicator.dart';
import '../../../../core/widget/text_input.dart';
import '../../../../data/model/login_model/login_model.dart';
import '../../../../data/model/master_data_model/master_data_model.dart';
import '../../../../di.dart';
import '../../../../utils/acl_color.dart';
import '../../../add_candidate_page/widget/drop_down_city.dart';
import '../../../add_candidate_page/widget/drop_down_country.dart';
import '../../../add_candidate_page/widget/drop_down_gender.dart';
import '../../../add_candidate_page/widget/drop_down_occupation.dart';
import '../../../add_candidate_page/widget/drop_down_province.dart';
import '../../../add_candidate_page/widget/drop_down_relation.dart';
import '../../bloc/faa_candidate_page_bloc.dart';
import '../expansion_widget/private/appendix_data.dart';
import '../expansion_widget/private/npwp_and_bank_data.dart';
import '../expansion_widget/private/source_of_recruiting_information.dart';

enum Mode { create, update }
class PrivateDataPage extends StatefulWidget {
  final GlobalKey<FormState> formKey;
   const PrivateDataPage({super.key, required this.formKey});

  @override
  State<PrivateDataPage> createState() => _PrivateDataPageState();
}

class _PrivateDataPageState extends State<PrivateDataPage> {

  @override
  Widget build(BuildContext context) {
    Mode mode = Mode.create;
    var width = MediaQuery.of(context).size.width;
    return  SingleChildScrollView(
      child: Column(children: [
        PrivateData(formKey: widget.formKey),
        const SizedBox(height: 8),
        HeirsData(formKey: widget.formKey),
        const SizedBox(height: 8),
        AajiData(formKey: widget.formKey),
        const SizedBox(height: 8),
        NpwpAndBankData(formKey: widget.formKey),
        const SizedBox(height: 8),
        SourceOfRecruitingInformation(formKey: widget.formKey),
        const SizedBox(height: 8),
        AppendixData(formKey: widget.formKey),
      ],),
    );

  }
}
