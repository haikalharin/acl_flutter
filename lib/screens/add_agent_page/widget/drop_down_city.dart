import 'package:acl_flutter/common/app_extension.dart';
import 'package:acl_flutter/data/model/login_model/login_model.dart';
import 'package:flutter/material.dart';

class DropDownCity extends StatefulWidget {
  const DropDownCity(
      {Key? key,
        required this.onChanged,
        required this.items,
        this.initialItem})
      : super(key: key);

  final ValueChanged<LoginModel> onChanged;
  final List<LoginModel> items;
  final LoginModel? initialItem;

  @override
  State<DropDownCity> createState() => _DropDownCityState();
}

class _DropDownCityState<T> extends State<DropDownCity> {
  LoginModel? selectedItem;

  String checkType(T item) {
    if (item.isEnum) return item.getEnumString;
    return item.toString();
  }

  @override
  void initState() {
    if (widget.initialItem != null) {
      selectedItem = widget.initialItem;
    } else {
      selectedItem = widget.items.first;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonFormField<LoginModel>(
        value: selectedItem,
        onChanged: (LoginModel? currentItem) {
          widget.onChanged(currentItem as LoginModel);
          setState(() => selectedItem = currentItem);
        },
        items: widget.items
            .map(
              (item) => DropdownMenuItem<LoginModel>(
            value: item,
            child: Text(
              item.name??'',
              style: const TextStyle(fontSize: 15),
            ),
          ),
        )
            .toList(),
      ),
    );
  }
}
