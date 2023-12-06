// ignore_for_file: unused_import

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/controllers/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(top: 20),
                child: const Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                height: 100,
                width: 600,
                margin: const EdgeInsets.only(
                    top: 20, left: 10, right: 10, bottom: 0),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Center(
                        child: Text(
                          ' "Aplikasi List Mebel di Toko kami, untuk mempermudah pencarian anda"',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/mebel1.png',
                      width: 100,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(top: 10),
                child: const Text(
                  'LIST MEBEL',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                height: 200,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160,
                      child: Image.network(
                        'https://images.adsttc.com/media/images/64ff/7796/e33a/a701/7cc8/3c64/medium_jpg/ai-timber-pioneirismo-na-construcao-sustentavel-com-o-auxilio-da-inteligencia-artificial_9.jpg?1694463963',
                        width: 160,
                      ),
                    ),
                    Container(
                      width: 160,
                      child: Image.network(
                        'https://img.freepik.com/free-photo/picture-frame-by-velvet-armchair_53876-132788.jpg?w=360&t=st=1701843849~exp=1701844449~hmac=b6226bf88576e76de935013a6bc4c6f85a16f6f5cec79c8c7b8bcacc846f9581',
                        width: 160,
                      ),
                    ),
                    Container(
                      width: 160,
                      child: Image.network(
                        'https://img.freepik.com/free-photo/interior-decor-with-mirror-potted-plant_23-2149427955.jpg?size=626&ext=jpg&ga=GA1.1.1474801462.1701843675&semt=ais',
                        width: 160,
                      ),
                    ),
                    Container(
                      width: 160,
                      child: Image.network(
                        'https://img.freepik.com/free-photo/view-photo-frame-with-interior-home-decor_23-2149513955.jpg?size=626&ext=jpg&ga=GA1.1.1474801462.1701843675&semt=ais',
                        width: 160,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: const Text(
                  'Top Brand In Our Shop',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 226,
                child: Obx(() {
                  if (controller.bookData.isEmpty) {}

                  return ListView.builder(
                    itemCount: controller.bookData.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 160,
                        margin: const EdgeInsets.only(right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              controller.bookData[index]["volumeInfo"]
                                  ["imageLinks"]["thumbnail"],
                              width: 160,
                              height: 200,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
