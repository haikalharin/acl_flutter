import 'package:acl_flutter/utils/acl_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';

import '../../../data/model/login_model/login_model.dart';
import '../../../data/model/master_data_model/master_data_model.dart';
import '../../sidebar_page/sidebar_page.dart';

class DropDownCity extends StatefulWidget {
  const DropDownCity(
      {Key? key,
      required this.onChanged,
      required this.items,
      this.initialItem,
      this.lable,
      this.title,
      this.icon,
      this.errorText,
      this.isMandatory = true,
      this.readOnly = false})
      : super(key: key);

  final ValueChanged<CityMasterReference> onChanged;
  final List<CityMasterReference> items;
  final CityMasterReference? initialItem;
  final Widget? lable;
  final String? title;
  final String? errorText;
  final Icon? icon;
  final bool isMandatory;
  final bool readOnly;

  @override
  State<DropDownCity> createState() => _DropDownCityState();
}

class _DropDownCityState extends State<DropDownCity> {
  CityMasterReference? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(widget.title ?? '',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: AclColors.greyDarkFontColor,
                    ))),
            Container(
                margin: EdgeInsets.only(left: 5, bottom: 5),
                child: const Text(
                  '*',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: AclColors.redAccent,
                  ),
                )),
            Container(
                margin: EdgeInsets.only(left: 5, bottom: 5),
                child: Text(
                  widget.errorText ?? '',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: AclColors.redAccent,
                  ),
                ))
          ],
        ),
        const SizedBox(height: 5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            // hintText: _hint,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: widget.errorText != null ? 4 : 1,
              color: widget.errorText != null
                  ? AclColors.redText
                  : Colors.grey.shade300,
            ),
          ),
          child: Row(
            children: [
              Container(margin: EdgeInsets.only(left: 12), child: widget.icon),
              Flexible(
                flex: 1,
                child: Container(
                  // width: 200,
                  child: SearchChoices.single(
                    readOnly: widget.readOnly,
                    underline: DropdownButtonHideUnderline(child: Container()),
                    items: widget.items
                        .map(
                          (item) => DropdownMenuItem<CityMasterReference>(
                            value: item,
                            child: Text(
                              language == Language.indonesia
                                  ? item.longDescriptionInd ?? ''
                                  : item.longDescriptionEng ?? '',
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                        )
                        .toList(),
                    searchFn: (String keyword,
                        List<DropdownMenuItem<CityMasterReference>> items) {
                      List<int> ret = [];
                      if (keyword.isNotEmpty) {
                        keyword.split(" ").forEach((k) {
                          int i = 0;
                          for (var item in items) {
                            if (!ret.contains(i) &&
                                k.isNotEmpty &&
                                (language == Language.indonesia
                                    ? item.value!.longDescriptionInd!
                                        .toString()
                                        .toLowerCase()
                                        .contains(k.toLowerCase())
                                    : item.value!.longDescriptionEng!
                                        .toString()
                                        .toLowerCase()
                                        .contains(k.toLowerCase()))) {
                              ret.add(i);
                            }
                            i++;
                          }
                        });
                      }
                      if (keyword.isEmpty) {
                        ret = Iterable<int>.generate(items.length).toList();
                      }
                      return (ret);
                    },
                    value: selectedItem,
                    hint: "Pilih",
                    searchHint: "Select one",
                    onChanged: (CityMasterReference value) {
                      widget.onChanged(value);
                      setState(() {
                        selectedItem = value;
                      });
                    },
                    onClear: () {
                      widget.onChanged(CityMasterReference());
                      setState(() {
                        selectedItem = CityMasterReference();
                      });
                    },
                    isExpanded: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}