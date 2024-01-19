import 'package:acl_flutter/utils/acl_color.dart';
import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';

import '../../../data/model/master_data_model/master_data_model.dart';
import '../../../screens/sidebar_page/sidebar_page.dart';

class DropDownString extends StatefulWidget {
  const DropDownString(
      {Key? key,
        required this.onChanged,
        required this.items,
        this.onClear,
        this.initialItem,
        this.lable,
        this.title,
        this.icon,
        this.errorText,
        this.isMandatory = true,
        this.readOnly = false,
        this.isCheck = false})
      : super(key: key);

  final ValueChanged<String> onChanged;
  final Function? onClear;
  final List<String> items;
  final String? initialItem;
  final Widget? lable;
  final String? title;
  final String? errorText;
  final Icon? icon;
  final bool isMandatory;
  final bool readOnly;
  final bool isCheck;

  @override
  State<DropDownString> createState() =>
      _DropDownStringState(initialItem);
}

class _DropDownStringState extends State<DropDownString> {
  String? initialItem;
  bool isInit = true;

  _DropDownStringState(this.initialItem);

  @override
  void didUpdateWidget(DropDownString oldWidget) {
    if(isInit) {
      if (initialItem != widget.initialItem) {
        widget.onChanged(widget.initialItem ?? '');
        setState(() {
          initialItem = widget.initialItem;
          isInit = false;
        });
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: RichText(
                    textAlign: TextAlign.start,
                    maxLines: 5,
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: widget.title ?? '',
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: AclColors.greyDarkFontColor,
                            )),
                        widget.isMandatory
                            ? const TextSpan(
                                text: '*',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: AclColors.red,
                                ))
                            : const TextSpan(),
                        TextSpan(
                            text: widget.errorText ?? '',
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: AclColors.red,
                          ),),
                      ],
                    ),
                  )),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
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
              Container(
                  margin: const EdgeInsets.only(left: 12), child: widget.icon),
              Flexible(
                flex: 1,
                child: Container(
                  // width: 200,
                  child: SearchChoices.single(
                    readOnly: widget.readOnly,
                    underline: DropdownButtonHideUnderline(child: Container()),
                    items: widget.items
                        .map(
                          (item) =>
                          DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              language == Language.indonesia
                                  ? item
                                  : item,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                    )
                        .toList(),
                    searchFn: (String keyword,
                        List<DropdownMenuItem<String>>
                        items) {
                      List<int> ret = [];
                      if (keyword.isNotEmpty) {
                        keyword.split(" ").forEach((k) {
                          int i = 0;
                          for (var item in items) {
                            if (!ret.contains(i) &&
                                k.isNotEmpty &&
                                (language == Language.indonesia
                                    ? item.value!
                                    .toString()
                                    .toLowerCase()
                                    .contains(k.toLowerCase())
                                    : item.value!
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
                    value: initialItem,
                    hint: "Pilih",
                    searchHint: "Pilih salah satu",
                    onChanged: (String value) {
                      widget.onChanged(value);
                      initialItem = value;
                      isInit = false;
                    },
                    onClear: () {
                      widget.onChanged('');
                      initialItem = '';
                      isInit = false;
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
