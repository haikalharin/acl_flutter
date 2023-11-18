import 'package:acl_flutter/common/app_extension.dart';
import 'package:acl_flutter/screens/add_agent_page/widget/drop_down_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widget/custom_image_picker.dart';
import '../../../core/widget/date_time_picker.dart';
import '../../../core/widget/date_time_picker_form.dart';
import '../../../core/widget/text_input.dart';
import '../../../data/model/login_model/login_model.dart';
import '../../../utils/acl_color.dart';
import '../widget/drop_down_province.dart';

enum Mode { create, update }

class AddAgentPage extends StatefulWidget {
  const AddAgentPage({Key? key}) : super(key: key);

  @override
  State<AddAgentPage> createState() => _AddAgentPageState();
}

class _AddAgentPageState extends State<AddAgentPage> {
  final formKey = GlobalKey<FormState>();
  var firstName = TextEditingController(text: "");
  var middleName = TextEditingController(text: "");
  var lastName = TextEditingController(text: "");
  LoginModel? selectedItem;
  bool checkedValueAAJI = false;
  bool checkedValueAASI = false;
  bool checkedValueMarriage = false;
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
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                TextInput(
                  controller: firstName,
                  icon: Icon(Icons.person),
                  label: const Text("Nama Depan(sesuai KTP)"),
                  // initialValue: postTitle,
                  validator: (String? value) {
                    if (value!.isNotEmpty) return null;
                    return "Mohon diisi";
                  },
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                TextInput(
                  controller: middleName,
                  isMandatory: false,
                  icon: Icon(Icons.person),
                  label: const Text("Nama tengah(sesuai KTP)"),
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                TextInput(
                  controller: lastName,
                  isMandatory: false,
                  icon: Icon(Icons.person),
                  label: const Text("Nama belakang(sesuai KTP)"),
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                DateTimePickerForm(
                  dateTime: mode == Mode.update ? DateTime.now() : null,
                  label: Text("Tanggal lahir"),
                  selectedDateTime: (DateTime date) {
                    var dateTime = date;
                  },
                  validator: (String? value) {
                    if (value!.isNotEmpty) return null;
                    return "Mohon diisi";
                  },
                ),
                const SizedBox(height: 8),
                TextInput(
                  icon: Icon(Icons.add_card_rounded),
                  label: const Text("No KTP"),
                  validator: (String? value) {
                    if (value!.isNotEmpty) return null;
                    return "Mohon diisi";
                  },
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                CustomImagePicker(
                  title: 'Foto KTP',
                  onImagePicked: (String) {},
                ),
                const SizedBox(height: 8),
                CustomImagePicker(
                  title: 'Foto Selfie Beserta KTP',
                  onImagePicked: (String) {},
                ),
                const SizedBox(height: 8),
                TextInput(
                  icon: Icon(Icons.add_card_rounded),
                  label: const Text("No KK"),
                  validator: (String? value) {
                    if (value!.isNotEmpty) return null;
                    return "Mohon diisi";
                  },
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                CustomImagePicker(
                  title: 'Foto KK',
                  onImagePicked: (String) {},
                ),
                const SizedBox(height: 8),
                TextInput(
                  title: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: const Text('Alamat rumah (sesuai KTP)',
                              style: TextStyle(
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
                          ))
                    ],
                  ),
                  icon: Icon(Icons.add_location),
                  label: const Text("(Gedung.../Jalan...)"),
                  validator: (String? value) {
                    if (value!.isNotEmpty) return null;
                    return "Mohon diisi";
                  },
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                TextInput(
                  icon: Icon(Icons.add_location),
                  label: const Text("(RT.../RW...)"),
                  validator: (String? value) {
                    if (value!.isNotEmpty) return null;
                    return "Mohon diisi";
                  },
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                TextInput(
                  icon: Icon(Icons.add_location),
                  label: const Text("(Kelurahan.../Kecamatan...)"),
                  validator: (String? value) {
                    if (value!.isNotEmpty) return null;
                    return "Mohon diisi";
                  },
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                TextInput(
                  icon: Icon(Icons.signpost_sharp),
                  label: const Text("Kode Pos"),
                  validator: (String? value) {
                    if (value!.isNotEmpty) return null;
                    return "Mohon diisi";
                  },
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                DropDownCountry(
                  title: 'Negara',
                  icon: const Icon(
                    Icons.account_balance_rounded,
                    color: AclColors.greyDarkFontColor,
                  ),
                  onChanged: (LoginModel value) {},
                  items: data,
                ),
                const SizedBox(height: 8),
                DropDownProvince(
                  title: 'Provinsi',
                  icon: const Icon(
                    Icons.account_balance_rounded,
                    color: AclColors.greyDarkFontColor,
                  ),
                  onChanged: (LoginModel value) {},
                  items: data,
                ),
                const SizedBox(height: 8),
                DropDownProvince(
                  title: 'Profesi',
                  icon: const Icon(
                    Icons.work,
                    color: AclColors.greyDarkFontColor,
                  ),
                  onChanged: (LoginModel value) {},
                  items: data,
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text(
                      "Apakah Anda pernah bekerja di perusahaan asuransi jiwa sebelumnya?"),
                  value: checkedValueAAJI,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValueAAJI = newValue ?? false;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                const SizedBox(height: 8),
                TextInput(
                  controller: lastName,
                  isMandatory: checkedValueAAJI,
                  icon: Icon(Icons.add_card_rounded),
                  label: const Text("No lisensi AAJI"),
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                  validator: (String? value) {
                    if (checkedValueAAJI) {
                      if (value!.isNotEmpty) return null;
                      return "Mohon diisi";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 8),
                CustomImagePicker(
                  title: 'Foto Lisensi AAJI',
                  isMandatory: checkedValueAAJI,
                  onImagePicked: (String) {},
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text(
                      "Apakah Anda pernah bekerja di perusahaan asuransi syariah sebelumnya?"),
                  value: checkedValueAASI,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValueAASI = newValue ?? false;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                const SizedBox(height: 8),
                TextInput(
                  controller: lastName,
                  isMandatory: checkedValueAASI,
                  icon: Icon(Icons.add_card_rounded),
                  label: const Text("No lisensi AASI"),
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                  validator: (String? value) {
                    if (checkedValueAASI) {
                      if (value!.isNotEmpty) return null;
                      return "Mohon diisi";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 8),
                CustomImagePicker(
                  title: 'Foto Lisensi AASI',
                  isMandatory: checkedValueAASI,
                  onImagePicked: (String) {},
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: const Text("Menikah"),
                  value: checkedValueMarriage,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValueMarriage = newValue ?? false;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                const SizedBox(height: 8),
                TextInput(
                  icon: Icon(Icons.person),
                  isMandatory: checkedValueMarriage,
                  label: const Text("No KTP Pasangan"),
                  // initialValue: postTitle,
                  validator: (String? value) {
                    if (checkedValueMarriage) {
                      if (value!.isNotEmpty) return null;
                      return "Mohon diisi";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                TextInput(
                  icon: Icon(Icons.person),
                  label: const Text("Nama Depan(sesuai KTP)"),
                  isMandatory: checkedValueMarriage,
                  validator: (String? value) {
                    if (checkedValueMarriage) {
                      if (value!.isNotEmpty) return null;
                      return "Mohon diisi";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                TextInput(
                  isMandatory: false,
                  icon: Icon(Icons.person),
                  label: const Text("Nama tengah(sesuai KTP)"),
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                TextInput(
                  isMandatory: false,
                  icon: Icon(Icons.person),
                  label: const Text("Nama belakang(sesuai KTP)"),
                  onChanged: (String input) {
                    // viewModel.add(UserNameInputEvent(input));
                  },
                ),
                const SizedBox(height: 8),
                DateTimePickerForm(
                  dateTime: mode == Mode.update ? DateTime.now() : null,
                  label: Text("Tanggal lahir pasangan"),
                  isMandatory: checkedValueMarriage,
                  selectedDateTime: (DateTime date) {
                    var dateTime = date;
                  },
                  validator: (String? value) {
                    if (checkedValueMarriage) {
                      if (value!.isNotEmpty) return null;
                      return "Mohon diisi";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 8),
                DropDownProvince(
                  title: 'Jenis kelamin',
                  isMandatory: checkedValueMarriage,
                  icon: const Icon(
                    Icons.add_chart,
                    color: AclColors.greyDarkFontColor,
                  ),
                  onChanged: (LoginModel value) {},
                  items: data,
                ),
                const SizedBox(height: 8),
                DropDownProvince(
                  title: 'Hubungan Dengan Kandidat',
                  isMandatory: checkedValueMarriage,
                  icon: const Icon(
                    Icons.add_chart,
                    color: AclColors.greyDarkFontColor,
                  ),
                  onChanged: (LoginModel value) {},
                  items: data,
                ),
                SizedBox(
                  width: width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                    child: Text("Selanjutnya".toCapital),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
