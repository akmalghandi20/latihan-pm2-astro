import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KaryawanController extends GetxController {
  //TODO: Implement KaryawanController
  late TextEditingController cNomor;
  late TextEditingController cNama;
  late TextEditingController cJabatan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference karyawan_22312137 =
        firestore.collection('karyawan_22312137');

    return karyawan_22312137.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference karyawan_22312137 =
        firestore.collection('karyawan_22312137');
    return karyawan_22312137.snapshots();
  }

  void add(
      String nomor, String nama, String jabatan) async {
    CollectionReference karyawan_22312137 =
        firestore.collection("karyawan_22312137");

    try {
      await karyawan_22312137.add({
        "no_karyawan": nomor,
        "nama_karyawan": nama,
        "jabatan_karyawan": jabatan,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data karyawan",
          onConfirm: () {
            cNomor.clear();
            cNama.clear();
            cJabatan.clear();
            Get.back();
            Get.back();
            Get.back();
            textConfirm:
            "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Karyawan.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> GetDataById(String id) async {
    DocumentReference docRef =
        firestore.collection("karyawan_22312137").doc(id);

    return docRef.get();
  }

  void Update(String nomor, String nama, String jabatan,
      String id) async {
    DocumentReference karyawan_22312137ById =
        firestore.collection("karyawan_22312137").doc(id);

    try {
      await karyawan_22312137ById.update({
        "no_karyawan": nomor,
        "nama_karyawan": nama,
        "jabatan_karyawan": jabatan,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Karyawan.",
        onConfirm: () {
          cNomor.clear();
          cNama.clear();
          cJabatan.clear();
          Get.back();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Karyawan.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef =
        firestore.collection("karyawan_22312137").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNomor = TextEditingController();
    cNama = TextEditingController();
    cJabatan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNomor.dispose();
    cNama.dispose();
    cJabatan.dispose();
    super.onClose();
  }
}
