// ignore_for_file: deprecated_member_use

import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/pages/dashboard/dashboard.dart';
import 'client_controller.dart';

class DatabaseController extends ClientController {
  late Databases databases;
  final bookData = [].obs;

  @override
  void onInit() {
    super.onInit();

    // appwrite
    databases = Databases(client);
    listDocument();
  }

  Future<void> createDocument(Map<String, String> map) async {
    try {
      final result = await databases.createDocument(
        databaseId: "656ff4d99c24386ccd2a",
        documentId: ID.unique(),
        collectionId: "656ff4ecab9c6ddc683c",
        data: map,
      );
      print("DatabaseController:: createDocument $result");
      Get.offAll(const DashboardPage());
    } catch (error) {
      _showErrorDialog("Error creating document", error.toString());
    }
  }

  Future<void> listDocument() async {
    Future result = databases.listDocuments(
      databaseId: '656ff4d99c24386ccd2a',
      collectionId: '656ff4ecab9c6ddc683c',
    );

    result.then((response) {
      bookData.value = response.documents;
      print('Database:: ${response.documents}');
    }).catchError((error) {
      print(error.response);
    });
  }

  Future<void> updateDocument(
      String documentId, Map<String, String> map) async {
    try {
      final result = await databases.updateDocument(
        databaseId: "656ff4d99c24386ccd2a",
        collectionId: "656ff4ecab9c6ddc683c",
        documentId: documentId,
        data: map,
      );
      print("DatabaseController:: updateDocument $result");
      Get.offAll(const DashboardPage());
    } catch (error) {
      _showErrorDialog("Error updating document", error.toString());
    }
  }

  Future<void> deleteDocument(String documentId) async {
    try {
      final result = await databases.deleteDocument(
        databaseId: "656ff4d99c24386ccd2a",
        collectionId: "656ff4ecab9c6ddc683c",
        documentId: documentId,
      );
      print("DatabaseController:: deleteDocument $result");
      Get.offAll(const DashboardPage());
    } catch (error) {
      _showErrorDialog("Error deleting document", error.toString());
    }
  }

  void _showErrorDialog(String title, String errorMessage) {
    Get.defaultDialog(
      title: title,
      titlePadding: const EdgeInsets.only(top: 15, bottom: 5),
      titleStyle: Get.context?.theme.textTheme.headline6,
      content: Text(
        errorMessage,
        style: Get.context?.theme.textTheme.bodyText2,
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.only(top: 5, left: 15, right: 15),
    );
  }
}
