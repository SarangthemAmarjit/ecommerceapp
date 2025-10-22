import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginController extends GetxController {
  // // final AuthRepoImpl authenticationRepo = AuthRepoImpl();
  // UserModel? _currentuser;
  // UserModel? get currentUser => _currentuser;
  var isStayed = false.obs;
  var isObscured = true.obs;

  bool isloginloading = false;
  // ApiService apiService = ApiService(api, "");

  // bool _islogin = false;
  // bool get islogin => _islogin;

  bool _isauthchecking = false;
  bool get isauthchecking => _isauthchecking;

  bool _istokenexist = false;
  bool get istokenexist => _istokenexist;

  var isObscuredforconfirm = true.obs;

  // bool _islogin = false;
  // bool get islogin => _islogin;
  String? _username;
  String? get username => _username;

  bool _istokenvalid = false;
  bool get istokenvalid => _istokenvalid;

  bool _isforgetpassword = false;
  bool get isforgetpassword => _isforgetpassword;

  void setpasswordvisibility() {
    isObscured.value = !isObscured.value;
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    getUserToken();
  }

   void cleartokken() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    s.clear();
    resetall();
    // Get.find<LoginController>().getUserToken();
    Get.offAllNamed('/');
  }

   resetall() {
   
    _istokenexist = false;
 _username = null;
    _isLoading = false;
    update();
  }

  ///get user token from sharedPrefrences
  Future<void> getUserToken() async {
    SharedPreferences s = await SharedPreferences.getInstance();

    if (s.containsKey('userName')) {
      _istokenexist = true;
      update();
      log("_1istokenexist : $_istokenexist");
      // check whether token is valid or not by calling 1 api

      _username = s.getString("userName");
      update();
    } else {
      _istokenexist = false;
      update();
      log("2_istokenexist : $_istokenexist");
    }
  }

  void logout() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    _isLoading = false;
    update();
    s.clear();
    _username = null;
    update();
  }

  Future<void> loginWithEmail(String email, String password) async {
    SharedPreferences s = await SharedPreferences.getInstance();
    _isLoading = true;
    update();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        s.setString('userToken', userCredential.user!.uid);
        s.setString('userName', userCredential.user!.email!);
        _isLoading = false;
        _username = userCredential.user!.email!;
        update();
        Get.offAllNamed('/admindashboard');
      } else {
        _isLoading = false;
        update();
        showDialog("Login Error", "Incorrect Username or Password.");
      }

      print('✅ Logged in: ${userCredential.user?.email}');
    } on FirebaseAuthException catch (e) {
      _isLoading = false;
      update();
      showDialog("Login Error", e.message!);
      print('❌ Error: ${e.message}');
    }
  }

  // void logout() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   pref.clear();
  //   checktoken();
  //   // Get.offAll(const LoginPage());
  // }

  // void validateAndLogin(
  //     BuildContext context, String username, String password) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();

  //   //get login api

  //   //  else if (username != correctUsername || password != correctPassword) {
  //   //   _showDialog("Login Failed", "Incorrect Username or Password.");
  //   // }

  //   showLoadingDialog(context: context);
  //   Future.delayed(const Duration(milliseconds: 1500)).whenComplete(() async {
  //     //res = {"String":"int"} {1 - sucess,-1 - error,3 - catch exception}
  //     Map<String, User?> res =
  //         await authenticationRepo.loginUser(username, password);

  //     // set values to shared preferences is login is successfull
  //     if (res.entries.first.value != null) {
  //       _islogin = true;
  //       _currentUser = res.entries.first.value;
  //       update();
  //       Navigator.of(context).pop();
  //       if (_currentUser!.token != null) {
  //         pref.setString('token', _currentUser?.token ?? "");
  //       }

  //       showDialog(res.keys.first, "Welcome, ${_currentUser?.name} !");
  //     } else {
  //       Navigator.of(context).pop();

  //       showDialog("Log In Error!", res.keys.first);
  //     }

  //     //Demo Login Details

  //     // if (username == correctUsername && password == correctPassword) {
  //     //   _islogin = true;
  //     //   pref.setString('token', username);
  //     //   update();
  //     //   Navigator.of(context).pop();
  //     //   // authenticate();

  //     //   showDialog('Login Successfully', "Welcome, $username!");
  //     // } else {
  //     //   Navigator.of(context).pop();
  //     //   showDialog("Log In Error!", "d");
  //     // }
  //   });
  //   // Navigate to the next screen
  // }

  // void authenticate() {
  //   if (_islogin) {
  //     Get.offAll(() => const MainScreen());
  //   }
  // }

  // void checktoken() async {
  //   print("In Check User token");
  //   _isauthchecking = true;
  //   update();

  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   if (pref.containsKey('token')) {
  //     debugPrint("in check token: ");
  //     String token = pref.getString("token")!;
  //     debugPrint("in check token:$token");
  //     Future.delayed(const Duration(milliseconds: 1500)).whenComplete(() async {
  //       //token api
  //       Map<String, User?> res = await authenticationRepo.checkUserToken(token);

  //       // set values to shared preferences is login is successfull
  //       if (res.entries.first.value != null) {
  //         debugPrint("Token Validate");
  //         _currentUser = res.entries.first.value;
  //         _islogin = true;
  //         update();
  //       } else {
  //         debugPrint("Token not Validate");
  //         _islogin = false;
  //         update();
  //       }
  //       _isauthchecking = false;
  //       update();
  //       log('trueeeee');
  //     });
  //   } else {
  //     Future.delayed(const Duration(milliseconds: 1500)).whenComplete(() {
  //       debugPrint("No User token");
  //       _islogin = false;

  //       _isauthchecking = false;
  //       update();
  //       log('falsesssss');
  //     });
  //   }
  //   isloginloading = false;
  //   update();
  // }

  void showDialog(String title, String message) {
    print("Message: $message");
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text("OK")),
        ],
      ),
    );
  }
}
