import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:trade/view/authentication_screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _saving = false;
  bool isObscure = true;
 // final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  GlobalKey<FormState> formKey = GlobalKey();
  bool internet = true;
  // @override
  // void initState() {
  //   super.initState();
  //   final subscription = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) {
  //     if (result == ConnectivityResult.none) {
  //       setState(() {
  //         internet = false;
  //       });
  //     } else {
  //       setState(() {
  //         internet = true;
  //       });
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // if (internet == false) {
    //   return NoInternetScreen();
    // }
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: ModalProgressHUD(
            inAsyncCall: _saving,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   height: 25,
                      // ),
                      // Text(
                      //   "شركة الروضه",
                      //   style: GoogleFonts.alexandria(
                      //       color: Colors.blue[800], fontSize: 40),
                      // ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            validator: (String? value) {
                              if (value == "" || value!.contains("@ / .com")) {
                                return "ادخل الحساب";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "اكتب اسم الحساب",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: 350,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  validator: (String? value) {
                                    if (value == "") {
                                      return "ادخل كلمة المرور الصحيحه";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: isObscure,
                                  onChanged: (value) {
                                    password = value;
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "كلمة المرور",
                                  ),
                                ),
                              ),
                              isObscure
                                  ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = false;
                                  });
                                },
                                icon: Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.blue,
                                ),
                              )
                                  : IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        width: 300,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.brown,
                            ),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              // await validation_done(context);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.grey[600],
                                  content: Text("يجب ملء البيانات"),
                                ),
                              );
                            }
                          },
                          child: Text(
                            "تسجيل الدخول",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text("تسجيل حساب جديد"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
  //
  // Future<void> validation_done(BuildContext context) async {
  //   final isExistingUser = await checkUserExists(email);
  //   if (isExistingUser) {
  //     await sign_in_user(context);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: Colors.blueAccent,
  //         content: Text("الحساب غير مسجل"),
  //       ),
  //     );
  //   }
  // }

  // Future<void> sign_in_user(BuildContext context) async {
  //   setState(() {
  //     _saving = true;
  //   });
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //     Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(
  //         builder: (context) => HomeScreen(),
  //       ),
  //     );
  //     setState(() {
  //       _saving = false;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
