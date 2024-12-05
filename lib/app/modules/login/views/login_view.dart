import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/controllers/auth_controller.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            color: Colors.red,
            padding: const EdgeInsets.only(left: 10),
            child: const Row(
              children: [
                Image(
                  image: NetworkImage(
                    "https://1.bp.blogspot.com/-rGzybmEYVHM/XyMB2ITDpcI/AAAAAAAAC9k/MzGR0c6iF_ES8VgiLbuDa7r9jWVdoPWSQCLcBGAsYHQ/s1600/download%2BLOGO%2BUniversitas%2BTeknokrat%2BPNG.png",
                  ),
                  height: 80,
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Positioned(
                      bottom: -10,
                      child: Text(
                        "UNIVERSITAS TEKNOKRAT",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "INDONESIA",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "ASEAN's Best Private University",
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.cEmail,
                  decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: controller.cPass,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity, // Mengisi lebar secara penuh
                  child: ElevatedButton(
                    onPressed: () {
                      cAuth.login(
                          controller.cEmail.text, controller.cPass.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white, // Warna teks di tombol
                    ),
                    child: const Text("LOGIN"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Lupa Password, Klik disini"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text("developed by nama(npm)")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
