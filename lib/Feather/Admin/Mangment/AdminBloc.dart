import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Feather/Admin/Mangment/AdminBlocState.dart';
import 'package:flutter_application_1/core/Model/CatroiesModel.dart';
import 'package:flutter_application_1/core/Model/usermodel.dart';
import 'package:flutter_application_1/core/utils/sharedPresfrace.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AdminBloc extends Cubit<AdminState> {
  AdminBloc() : super(InitnalState());
  static AdminBloc get(context) => BlocProvider.of(context);
  var uid = CacheHealper.getData("uid", key: "uid");
  UserModel? usermodel;
  void getUserData() {
    emit(LodingGetUserData());
    FirebaseFirestore.instance
        .collection('user')
        .doc("yEJAMol8gmM2i9UCP4CNqZoDJSG2")
        .get()
        .then((value) {
      if (value.exists) {
        Map<String, dynamic>? data = value.data();
        if (data != null) {
          usermodel = UserModel.fromJson(data);
          emit(ScafullGetUserData());
        } else {
          emit(HomeErrorStata("Data is null"));
        }
      } else {
        emit(HomeErrorStata("Document does not exist"));
      }
    }).catchError((e) {
      emit(ErrorGetUserData(e));
    });
  }

  List<QueryDocumentSnapshot> dataconsult = [];
  List<QueryDocumentSnapshot> dataclient = [];

  getconsultant() async {
    emit(LodingGetAllConsltant());
    FirebaseFirestore.instance
        .collection('user')
        .where('type', isEqualTo: 'consulting')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        dataconsult.add(element);
        print(element.data());
      });
      print(value.toString());
      emit(ScafullGetAllConsltant());
    }).catchError((e) {
      emit(ErrorGetGetAllConsltant());
    });
  }

  getAllUser() async {
    emit(LodingGetAlluser());
    FirebaseFirestore.instance
        .collection('user')
        .where('type', isEqualTo: 'client')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        dataclient.add(element);
        print(element.data());
      });
      print(value.toString());
      emit(ScafullGetAllUser());
    }).catchError((e) {
      emit(ErrorGetGetAllConsltant());
    });
  }

  File? image;
  ImagePicker picker = ImagePicker();

  Future<void> getImageProfail() async {
    emit(LodingGetProfailImage());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      print(image);

      emit(ScafullGetProfailImage());
    } else {
      print('No image selected.');
      emit(ErrorGetProfailImage());
    }
  }

  File? cover;

  Future<void> getCover() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      cover = File(pickedFile.path);
      emit(ScafullGetCoverImage());
    } else {
      emit(ErrorGetCoverImage());
    }
  }

  void udateAdminData({
    required String name,
    required String phone,
    required String bio,
    String? image,
    String? cover,
  }) {
    emit(LodingUdateAdminData());
    UserModel model = UserModel(
      name: name,
      email: usermodel!.email,
      phone: phone,
      uid: usermodel!.uid,
      type: "",
      bio: bio,
      image: image ?? usermodel!.image,
      cover: cover ?? usermodel!.cover,
    );

    FirebaseFirestore.instance
        .collection("user")
        .doc(usermodel?.uid)
        .update(model.toMap())
        .then((value) {
      getUserData();
      emit(ScafullUdateAdminData());
    }).catchError((eror) {
      emit(ErrorUdateAdminData());
      print(eror.toString());
    });
  }

  void uploadprofialImage(
    @required String? name,
    @required String? phone,
    @required String? bio,
  ) {
    emit(LodingUploadImageProfailState());
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(image!.path).pathSegments.last}")
        .putFile(image!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(ScafullUploadImageProfailState());
        print(value);
        udateAdminData(
          name: name!,
          phone: phone!,
          bio: bio!,
          image: value,
        );
        print(value);
      }).catchError((e) {
        emit(ErrorUploadImageProfailState());
      });
    }).catchError((e) {
      print(e.toString());
      emit(ErrorUploadImageProfailState());
    });
  }

  void uploadCoverImage({
    required String? name,
    required String? phone,
    required String? bio,
  }) {
    emit(LodingUploadcoverAdminState());
    print("heloo");
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(cover!.path).pathSegments.last}")
        .putFile(cover!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(ScafullUploadcoverAdminState());
        print(value);
        udateAdminData(
          name: name!,
          phone: phone!,
          bio: bio!,
          cover: value,
        );
      }).catchError((e) {
        emit(ErorUploadcoverAdminState());
      });
    }).catchError((e) {
      emit(ErorUploadcoverAdminState());
    });
  }

  //finshEditProfail andGetuser

//statrt MangmentCatroies

  File? catroiesImage;

  void removeImgePOst() {
    catroiesImage == File('');
    emit(RemovecatroiesImage());
  }

  Future<void> getcatroiesImage() async {
    emit(LodingGetCatroiesImage());

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      catroiesImage = File(pickedFile.path);

      emit(ScafullGetCatroiesImage());
    } else {
      print('No image selected.');
      emit(ErorGetCatroiesImage());
    }
  }

  void uploadCatroiesImageImage({
    required String text,
    required String date,
    required String postImage,
  }) {
    emit(LodingUploadCrtroiesmageState());
    FirebaseStorage.instance
        .ref()
        .child("user/${Uri.file(catroiesImage!.path).pathSegments.last}")
        .putFile(catroiesImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        creatPost(
          datetime: date,
          text: text,
          catroiesImage: value,
        );
        emit(ScafullUploadCatroiesImageState());
      }).catchError((e) {
        emit(ErrorUploadImageProfailState());
      });
    }).catchError((e) {
      emit(ErrorUploadImageProfailState());
    });
  }

  void creatPost({
    required String text,
    required String datetime,
    String? catroiesImage,
  }) {
    emit(LodingCreatCatroies());
    CatroiesModel model = CatroiesModel(
      dateTime: datetime,
      text: text,
      uId: uid,
      catoiesImage: catroiesImage ?? "",
    );
    FirebaseFirestore.instance
        .collection("Catroies")
        .add(model.toMap())
        .then((value) {
      print(value.id);
      emit(ScafullCreatCatroies());
    }).catchError((eror) {
      print(eror.toString);
      emit(ErrorCreatCatroies());
    });
  }

  List catroies = [];
  List<String> catroiesnum = [];
  void getCaroies() async {
    emit(LodingGetcatroiesState());
    await FirebaseFirestore.instance.collection('Catroies').get().then((value) {
      value.docs.forEach((element) {
        catroies.add(CatroiesModel.fromJson(element.data()));
        catroiesnum.add(element.id);
        emit(ScafullGetcatroiesstate());
      });
    }).catchError((e) {});
  }
}
