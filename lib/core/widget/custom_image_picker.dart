import 'dart:convert';
import 'dart:io' as io;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/secure.dart';
import '../../utils/acl_color.dart';

class CustomImagePicker extends StatefulWidget {
  final Function(dynamic) onImagePicked;
  final String? initialImage; // Add this property
  final String? title; // Add this property
  final bool isMandatory; // Add this property
  final bool readOnly; // Add this property
  final String? errorText; // Add this property

  const CustomImagePicker({
    super.key,
    required this.onImagePicked,
    required this.title,
    this.initialImage,
    this.isMandatory = true,
    this.errorText,
    this.readOnly = false, // Provide an initial image from the state
  });

  @override
  _CustomImagePickerState createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  Uint8List? _selectedImage;

  @override
  void initState() {
    super.initState();
    initialImage();
    // Set the initial image if provided
  }

  Future<void> initialImage() async {
    if (widget.initialImage != null && widget.initialImage !="") {
      if (isBase64(widget.initialImage ?? '')) {
        Uint8List imageBytes = base64Decode(widget.initialImage ?? '');
        _selectedImage = imageBytes;
        String base64Image = widget.initialImage ?? '';
        widget.onImagePicked(base64Image);
      } else {
        File imageFile = File(widget.initialImage ?? '');
        Uint8List imageBytes = await imageFile.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        _selectedImage = imageBytes;
        widget.onImagePicked(base64Image);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
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
                          margin: const EdgeInsets.only(left: 5, bottom: 5),
                          child: const Text(
                            '*',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: AclColors.red,
                            ),
                          ))
                      : Container(),
                  widget.isMandatory
                      ? Container(
                          margin: const EdgeInsets.only(left: 5, bottom: 5),
                          child: Text(
                            widget.errorText ?? '',
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: AclColors.red,
                            ),
                          ))
                      : Container()
                ],
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: widget.errorText != null ? 4 : 1,
                  color: widget.errorText != null
                      ? AclColors.redText
                      : Colors.grey.shade300,
                ),
                image: _selectedImage != null
                    ? DecorationImage(
                        image: MemoryImage(_selectedImage ?? Uint8List(1)),
                        fit: BoxFit.fill)
                    : null),
            child: _selectedImage == null
                ? Center(
                    child: Container(
                      child: Icon(
                        Icons.camera_alt,
                        size: 100,
                        color: AclColors.grey,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      widget.readOnly ? AclColors.grey : AclColors.blueButton)),
              onPressed: () {
                if (!widget.readOnly) {
                  _showPicker(context);
                }
              },
              child: const Text("Ambil Gambar"),
            ),
          ),
          if (_selectedImage != null)
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        widget.readOnly ? AclColors.grey : AclColors.jingga)),
                onPressed: () {
                  if (!widget.readOnly) {
                    _deleteImage();
                  }
                },
                child: const Text("Hapus"),
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
                      leading: const Icon(Icons.photo_library),
                      title: const Text('Photo Library'),
                      onTap: () async {
                        Navigator.pop(context);
                        pickAndCropImageGallery();
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
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
        File imageFile = File(croppedFile.path);
        Uint8List imageBytes = await imageFile.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        setState(() {
          _selectedImage = imageBytes;
        });
        widget.onImagePicked(base64Image);
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
        File imageFile = File(croppedFile.path);
        Uint8List imageBytes = await imageFile.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        setState(() {
          _selectedImage = imageBytes;
        });
        widget.onImagePicked(base64Image);
      }
    }
  }

  void _deleteImage() async {
    if (_selectedImage != null) {
      setState(() {
        _selectedImage = null;
      });
      widget.onImagePicked('');
    }
  }
}
