import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:law_application/views/services/session_manager.dart';
import '../../../../utils/utils.dart';

class licenseController with ChangeNotifier {
  DatabaseReference ref = FirebaseDatabase.instance.ref().child('lawyer');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final picker = ImagePicker();
  XFile? _image;
  XFile? get image => _image;
  bool _loading = false;
  bool get loading => _loading;

  setloaading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future pickgalleryimage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      notifyListeners();
      uploadlicense(context);
    }
  }

  Future pickcameraimage(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      uploadlicense(context);
      notifyListeners();
    }
  }

  void picklicens(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 130,
            width: 100,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    pickcameraimage(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.camera,
                  ),
                  title: Text('Camera'),
                ),
                ListTile(
                  onTap: () {
                    pickgalleryimage(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.image,
                  ),
                  title: Text('Gallery'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void uploadlicense(context) async {
    setloaading(true);
    firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('/license' + SessionController().userid.toString());

    firebase_storage.UploadTask uploadTask = storageRef.putFile(
      File(image!.path).absolute,
    );
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();
    ref.child(SessionController().userid.toString()).update({
      'license': newUrl.toString(),
    }).then((value) {
      utils.toastmessage('License Uploaded');
      setloaading(false);
      _image = null;
    }).onError((error, stackTrace) {
      utils.toastmessage(error.toString());
    });
  }

  Future pickgallerycnic(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      notifyListeners();
      uploadCNIC(context);
    }
  }

  Future pickcameracnic(BuildContext context) async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile != null) {
      _image = XFile(pickedFile.path);
      uploadCNIC(context);
      notifyListeners();
    }
  }

  void pickcnic(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 130,
            width: 100,
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    pickcameracnic(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.camera,
                  ),
                  title: Text('Camera'),
                ),
                ListTile(
                  onTap: () {
                    pickgallerycnic(context);
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.image,
                  ),
                  title: Text('Gallery'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void uploadCNIC(context) async {
    setloaading(true);
    firebase_storage.Reference storageRef = firebase_storage
        .FirebaseStorage.instance
        .ref('/cnic' + SessionController().userid.toString());

    firebase_storage.UploadTask uploadTask = storageRef.putFile(
      File(image!.path).absolute,
    );
    await Future.value(uploadTask);
    final newUrl = await storageRef.getDownloadURL();
    ref.child(SessionController().userid.toString()).update({
      'cnic': newUrl.toString(),
    }).then((value) {
      utils.toastmessage('CNIC Uploaded');
      setloaading(false);
      _image = null;
    }).onError((error, stackTrace) {
      utils.toastmessage(error.toString());
    });
  }
}
