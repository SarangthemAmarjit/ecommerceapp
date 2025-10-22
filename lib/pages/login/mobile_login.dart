import 'dart:developer';

import 'package:ecommerceapp/config/allassets.dart';
import 'package:ecommerceapp/config/constants.dart';
import 'package:ecommerceapp/pages/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class Adminloginmobile extends StatefulWidget {
  const Adminloginmobile({super.key});

  @override
  State<Adminloginmobile> createState() => _AdminloginmobileState();
}

class _AdminloginmobileState extends State<Adminloginmobile> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('fsfsdfsd');
    final LoginController controller = Get.put(LoginController());
    return GetBuilder<LoginController>(
      builder: (_) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFD2E7F3), // Light sky blue
                    Color(0xFFFDF1EB), // Light peach/cream
                  ],
                ),
              ),
              width: double.infinity,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Color.fromARGB(255, 192, 191, 191),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 15,
                        child: Container(
                          width: 370,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 171, 171, 171),
                            ),
                            color: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ).withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(
                                  255,
                                  194,
                                  193,
                                  193,
                                ).withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                Allassets.logo,
                                height: 100,
                                width: 100,
                              ),

                              const SizedBox(height: 10),
                              Text(
                                "ADMIN LOGIN PANEL",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  letterSpacing: 3,
                                ),
                              ),
                              const SizedBox(height: 20),

                              const SizedBox(height: 20),
                              TextField(
                                onSubmitted: (value) {
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(FocusNode());
                                  if (usernameController.text.isEmpty ||
                                      passwordController.text.isEmpty) {
                                    controller.showDialog(
                                      "Error",
                                      "Username or Password cannot be empty.",
                                    );
                                  } else {
                                    controller.loginWithEmail(
                                      usernameController.text,
                                      passwordController.text,
                                    );
                                  }
                                },
                                onTapOutside: ((event) {
                                  FocusScope.of(context).unfocus();
                                }),
                                cursorColor: greencoltextfocus,
                                scrollPadding: const EdgeInsets.only(
                                  bottom: 270,
                                ),
                                controller: usernameController,
                                decoration: InputDecoration(
                                  hintText: 'Username',
                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(179, 128, 127, 127),
                                  ),
                                  filled: true,
                                  fillColor: const Color.fromARGB(
                                    255,
                                    233,
                                    231,
                                    231,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: greencoltextfocus,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: bordercolor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  prefixIcon: Icon(
                                    FontAwesomeIcons.user,
                                    color: greencol,
                                    size: 20,
                                  ),
                                ),
                                style: const TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 15),
                              Obx(
                                () => TextField(
                                  onSubmitted: (value) {
                                    FocusScope.of(
                                      context,
                                    ).requestFocus(FocusNode());
                                    if (usernameController.text.isEmpty ||
                                        passwordController.text.isEmpty) {
                                      controller.showDialog(
                                        "Error",
                                        "Username or Password cannot be empty.",
                                      );
                                    } else {
                                      controller.loginWithEmail(
                                        usernameController.text,
                                        passwordController.text,
                                      );
                                    }
                                  },
                                  onTapOutside: ((event) {
                                    FocusScope.of(context).unfocus();
                                  }),
                                  cursorColor: greencoltextfocus,
                                  scrollPadding: const EdgeInsets.only(
                                    bottom: 200,
                                  ),
                                  controller: passwordController,
                                  obscureText: controller.isObscured.value,
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: const TextStyle(
                                      color: Color.fromARGB(179, 128, 127, 127),
                                    ),
                                    filled: true,
                                    fillColor: const Color.fromARGB(
                                      255,
                                      233,
                                      231,
                                      231,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: greencoltextfocus,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: bordercolor,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: Icon(
                                      FontAwesomeIcons.lock,
                                      color: greencol,
                                      size: 20,
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        controller.isObscured.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: greencol,
                                      ),
                                      onPressed: () {
                                        controller.setpasswordvisibility();
                                      },
                                    ),
                                  ),
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                              const SizedBox(height: 15),
                              // Obx(() => Row(
                              //       children: [
                              //         Checkbox(
                              //             value: controller.isStayed.value,
                              //             onChanged: (value) {
                              //               controller.isStayed.value =
                              //                   value!;
                              //             },
                              //             activeColor: greencol),
                              //         const Text(
                              //           'Stay signed in',
                              //           style: TextStyle(
                              //             color: Colors.black54,
                              //           ),
                              //         ),
                              //       ],
                              //     )),
                              // const SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  FocusScope.of(
                                    context,
                                  ).requestFocus(FocusNode());
                                  if (usernameController.text.isEmpty ||
                                      passwordController.text.isEmpty) {
                                    controller.showDialog(
                                      "Error",
                                      "Username or Password cannot be empty.",
                                    );
                                  } else {
                                    controller.loginWithEmail(
                                      usernameController.text,
                                      passwordController.text,
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                    255,
                                    250,
                                    226,
                                    224,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                      width: 0.2,

                                      color: Colors.white24,
                                    ),
                                  ),
                                  minimumSize: const Size(double.infinity, 50),
                                ),
                                child:
                                    controller.isLoading
                                        ? SizedBox(
                                          height: 25,
                                          width: 25,
                                          child:
                                              const CircularProgressIndicator(
                                                color: Colors.black,
                                              ),
                                        )
                                        : const Text(
                                          'LOG IN',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  //   SizedBox(height: 50,),

                  // Opacity(
                  //   opacity: 0.6,
                  //   child: Image.asset("assets/images/policelogo.png",height: 80,width:80)),
                  //   SizedBox(height: 10,),
                  // Text("M A N I P U R   P O L I C E",style: TextStyle(color: Colors.grey[700]),),
                  //    SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
