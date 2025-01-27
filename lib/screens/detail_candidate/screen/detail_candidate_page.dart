import 'package:acl_flutter/screens/detail_candidate/bloc/detail_candidate_page_bloc.dart';
import 'package:acl_flutter/utils/acl_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/widget/spinkit_indicator.dart';
import '../../../data/model/candidate/candidate_model.dart';
import '../../../di.dart';
import '../../sidebar_page/sidebar_page.dart';

class DetailCandidatePage extends StatefulWidget {
  const DetailCandidatePage(
      {super.key, this.isMyCandidate, this.candidateModel});

  final bool? isMyCandidate;
  final CandidateModel? candidateModel;

  @override
  State<DetailCandidatePage> createState() => _DetailCandidatePageState();
}

class _DetailCandidatePageState extends State<DetailCandidatePage> {
  @override
  void initState() {
    getIt<DetailCandidatePageBloc>()
        .add(FetchListTrackingEvent(widget.candidateModel?.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dob = '';
    if (!widget.isMyCandidate!) {
      var outputFormat = DateFormat.yMMMd('en');
      dob = outputFormat
          .format(DateTime.parse(widget.candidateModel?.dob ?? "0000-00-00"));
    } else {
      var outputFormat = DateFormat.yMMMd('en');
      var data = widget.candidateModel?.dob;
      var dataFix = data?.replaceAll('/', '-');
      dob = outputFormat.format(DateTime.parse(dataFix ?? "0000-00-00"));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: BlocListener<DetailCandidatePageBloc, DetailCandidatePageState>(
        listener: (context, state) {
          // TODO: implement listener}
        },
        child: BlocBuilder<DetailCandidatePageBloc, DetailCandidatePageState>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  height: 100,
                  color: AclColors.blueDark,
                ),
                // First Widget
                Card(
                  margin: EdgeInsets.all(16.0),
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Nama: ${widget.candidateModel?.firstName ?? ''} '
                            '${widget.candidateModel?.middleName ?? ''}'
                            ' ${widget.candidateModel?.lastName ?? ''}'),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                            'Nama Pengguna: ${widget.candidateModel?.userId ?? ''}'),
                        SizedBox(
                          height: 8,
                        ),
                        Text('Tanggal Lahir: $dob'),
                        SizedBox(height: 16.0), // Spacer
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle button press
                    },
                    child: Text('Press Me'),
                  ),
                ),
                // Second Widget
                Expanded(
                  child: Card(
                    margin: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: AclColors.greyDivider,
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Status Aplikasi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        // Divider(),
                        Flexible(
                          child: state.submitStatus.isInProgress
                              ? const SpinKitIndicator(type: SpinKitType.circle)
                              : state.submitStatus.isSuccess
                                  ? state.listTrackModel!.isEmpty &&
                                          !state.submitStatus.isInProgress
                                      ? Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                              child: Text(
                                                  AppLocalizations.of(context)!
                                                      .dataNotFound)))
                                      : ListView.builder(
                                          itemCount:
                                              state.listTrackModel?.length,
                                          // Replace with the actual number of items
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              leading: Container(
                                                width: 50,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.blue,
                                                    width: 1,
                                                    style: BorderStyle.solid,
                                                  ),
                                                  color: AclColors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          1000),
                                                ),
                                                child: Container(
                                                  margin: EdgeInsets.all(1),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.blue,
                                                      width: 4,
                                                      style: BorderStyle.solid,
                                                    ),
                                                    color: AclColors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                100.0)),
                                                  ),
                                                  child: Center(
                                                      child:
                                                          Text('${index + 1}')),
                                                ),
                                              ),
                                              title:
                                                  language == Language.indonesia
                                                      ? Text(state
                                                              .listTrackModel![
                                                                  index]
                                                              .descriptionInd ??
                                                          '')
                                                      : Text(state
                                                              .listTrackModel![
                                                                  index]
                                                              .descriptionEng ??
                                                          ''),
                                              onTap: () {
                                                // Handle item tap
                                              },
                                            );
                                          },
                                        )
                                  : Stack(children: [
                                      Center(
                                        child: Container(
                                            margin: EdgeInsets.only(),
                                            child: Container(
                                              child: Text(
                                                  state.errorMessage ?? ''),
                                            )),
                                      )
                                    ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
