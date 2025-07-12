import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileImagePicker extends StatefulWidget {
  final String email; // نمرر الإيميل
  final double raduis;
  const ProfileImagePicker({super.key, required this.email, required this.raduis});

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('saved_email');
    final savedPath = prefs.getString('saved_image_path');

    if (savedEmail == widget.email && savedPath != null && File(savedPath).existsSync()) {
      setState(() {
        _imageFile = File(savedPath);
      });
    } else {
      // لو الإيميل مختلف نحذف الصورة القديمة
      prefs.remove('saved_image_path');
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();

    // نعرض الـ BottomSheet ونستنى اختيار الصورة
    final pickedFile = await showModalBottomSheet<XFile?>(
      context: context,
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take Photo'),
                onTap: () async {
                  final photo = await picker.pickImage(source: ImageSource.camera);
                  Navigator.of(context).pop(photo); // نرجع بالصورة
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () async {
                  final gallery = await picker.pickImage(source: ImageSource.gallery);
                  Navigator.of(context).pop(gallery); // نرجع بالصورة
                },
              ),
            ],
          ),
        ),
      ),
    );

    // بعد ما تختار الصورة، نحفظها ونحدث الواجهة مباشرة
    if (pickedFile != null) {
      final appDir = await getApplicationDocumentsDirectory();
      final savedImage = await File(pickedFile.path)
          .copy('${appDir.path}/profile_image_${widget.email}.png'); // سميها باسم الإيميل لو حابة

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('saved_image_path', savedImage.path);
      await prefs.setString('saved_email', widget.email);

      // هنا التحديث الفوري
      setState(() {
        _imageFile = savedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: widget.raduis,
        backgroundImage: _imageFile != null
            ? FileImage(_imageFile!)
            : const AssetImage('assets/icons/li_user.png') as ImageProvider,
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
