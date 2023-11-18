import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/acl_color.dart';

class CustomImagePicker extends StatefulWidget {
  final Function(dynamic) onImagePicked;
  final XFile? initialImage; // Add this property
  final String? title; // Add this property
  final bool isMandatory; // Add this property
  final String? errorText; // Add this property

  const CustomImagePicker({
    super.key,
    required this.onImagePicked,
    required this.title,
    this.initialImage,
    this.isMandatory = true,
    this.errorText, // Provide an initial image from the state
  });

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  final ImagePicker _picker = ImagePicker();
  String? _selectedImage;

  @override
  void initState() {
    super.initState();
    // Set the initial image if provided
    _selectedImage = widget.initialImage?.path;
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = image?.path;
    });
    widget.onImagePicked(image!.path);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  Container(
                      child: Text(widget.title ?? '',
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: AclColors.greyDarkFontColor,
                          ))),
                  widget.isMandatory
                      ? Container(
                          margin: EdgeInsets.only(left: 5, bottom: 5),
                          child: const Text(
                            '*',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: AclColors.redAccent,
                            ),
                          ))
                      : Container(),

                  widget.isMandatory
                      ? Container(
                      margin: EdgeInsets.only(left: 5, bottom: 5),
                      child:  Text(
                        widget.errorText??'',
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: AclColors.redAccent,
                        ),
                      )):Container()
                ],
              )),
         Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all( width:  widget.errorText != null
                          ?4:1,
                        color: widget.errorText != null
                            ? AclColors.redText
                            : Colors.grey.shade300,),
                      image:  _selectedImage != null
                          ? DecorationImage(
                          image: FileImage(File(_selectedImage ?? '')),
                          fit: BoxFit.fill):null),
                ),
          const SizedBox(height: 5),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                _showPicker(context);
              },
              child: Text("Ambil Gambar"),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AclColors.jingga)),
              onPressed: () {
                _deleteImage();
              },
              child: Text("Hapus"),
            ),
          ),
        ],
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: [
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () async {
                        Navigator.pop(context);
                        pickAndCropImageGallery();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () async {
                      Navigator.pop(context);
                      pickAndCropImageCamera();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void pickAndCropImageGallery() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 25,
    );

    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper.platform
          .cropImage(sourcePath: pickedFile.path, aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]);
      if (croppedFile != null) {
        setState(() {
          _selectedImage = croppedFile.path;
        });
        widget.onImagePicked(croppedFile.path);
      }
    }
  }

  void pickAndCropImageCamera() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 25,
    );

    if (pickedFile != null) {
      CroppedFile? croppedFile = await ImageCropper.platform
          .cropImage(sourcePath: pickedFile.path, aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]);
      if (croppedFile != null) {
        setState(() {
          _selectedImage = croppedFile.path;
        });
        widget.onImagePicked(croppedFile.path);
      }
    }
  }

  void _deleteImage() async {
    if (_selectedImage != null) {
      setState(() {
        _selectedImage = null;
      });
      widget.onImagePicked(null);
    }
  }
}
