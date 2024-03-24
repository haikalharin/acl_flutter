import 'package:flutter/material.dart';
import 'package:flutter_helper/source/utility/text/uitext_style.dart';

class CustomCardListBuilder extends StatelessWidget {
  final List<RelationInCompanyModel> relationInCompanyModel;
    final Function(RelationInCompanyModel)? onEditPressed;
  final Function(RelationInCompanyModel)? onDeletePressed;

  const CustomCardListBuilder({
    Key? key,
    required this.relationInCompanyModel,
    this.onEditPressed,
    this.onDeletePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: relationInCompanyModel.length,
      itemBuilder: (context, index) {
        final data = relationInCompanyModel[index];
        return Card(
          margin: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.blue, // AclColors.primaryBlue,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.chrome_reader_mode_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.relationName??'',style: UITextStyle.subheading,),
                      const SizedBox(height: 8),
                      Text(data.relationStatus??''),
                      const SizedBox(height: 8),
                      Text(data.companyNameInAllianzGroup??''),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              onEditPressed?.call(data);
                            },
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.create,
                                  size: 14,
                                  color: Colors.green, // AclColors.green,
                                ),
                                SizedBox(width: 2),
                                Text('Ubah'),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          InkWell(
                            onTap: () {
                              onDeletePressed?.call(data);
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.red, // AclColors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 2),
                                Text('Hapus'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      // Spacer
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class RelationInCompanyModel {
  final String? relationName;
  final int? relationStatusId;
  final String? relationStatus;
  final String? directName;
  final int? position;
  final String? agentCode;
  final int? companyNameInAllianzGroupId;
  final String? companyNameInAllianzGroup;
  final int? companyNameInOthersId;
  final String? companyNameInOthers;
  final String? department;


  const RelationInCompanyModel({
    this.relationName,
    this.relationStatusId,
    this.relationStatus,
    this.directName,
    this.position,
    this.agentCode,
    this.companyNameInAllianzGroupId,
    this.companyNameInAllianzGroup,
    this.companyNameInOthersId,
    this.companyNameInOthers,
    this.department,
  });
}