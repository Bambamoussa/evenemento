import 'package:evenemento/core/router/router.dart';
import 'package:evenemento/core/style/style.dart';
import 'package:evenemento/feature/auth/presentation/widgets/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  XFile? _imageFile;
  dynamic _pickImageError;
  final ImagePicker _imagePicker = ImagePicker();
 // CollectionReference customers =
   //   FirebaseFirestore.instance.collection('customers');
  void _pickerImageCamera() async {
    try {
      final pickerImage = await _imagePicker.pickImage(
          source: ImageSource.camera,
          maxWidth: 300,
          maxHeight: 300,
          imageQuality: 95);
      setState(() {
        _imageFile = pickerImage;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  void _pickerImageGallery() async {
    try {
      final pickerImage = await _imagePicker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 300,
          maxHeight: 300,
          imageQuality: 95);
      setState(() {
        _imageFile = pickerImage;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  late String name;
  late String email;
  late String password;
  late String profileImage;
  late String _uid;
  bool processing = false;
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Evenemento"),
        ),
        body: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  const AuthHeaderLabel(headerLabel: "Sign Up"),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 40),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor:
                              AppTheme.cyanDarkTheme.colorScheme.primary,
                          /* backgroundImage: _imageFile == null
                                  ? null
                                  : FileImage(File(_imageFile!.path))*/
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.cyanDarkTheme.colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt),
                              color: Colors.white,
                              onPressed: () {
                                //_pickerImageCamera();
                                print("object");
                              },
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            decoration: BoxDecoration(
                              color: AppTheme.cyanDarkTheme.colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.photo),
                              color: Colors.white,
                              onPressed: () {
                                // _pickerImageGallery();
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: _nameController,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        }
                        return null;
                      }),
                      decoration: textFormDecoration.copyWith(
                        labelText: "full Name",
                        hintText: "Enter your full name",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: _emailController,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter your email";
                        } else if (value.isValidEmail() == false) {
                          return "Please enter a valid email";
                        } else if (value.isValidEmail() == true) {
                          return null;
                        }
                        return null;
                      }),
                      keyboardType: TextInputType.emailAddress,
                      decoration: textFormDecoration.copyWith(
                        labelText: "Email Adress",
                        hintText: "Enter your email",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextFormField(
                      controller: _passwordController,
                      validator: ((value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      }),
                      obscureText: passwordVisible,
                      decoration: textFormDecoration.copyWith(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        labelText: "Password",
                        hintText: "Enter your password",
                      ),
                    ),
                  ),
                  HaveAccount(
                    haveAccount: "already have an account ?",
                    actionLabel: "Sign in",
                    onPressed: () {
                      context.go(Routes.login);
                    },
                  ),
                  processing == true
                      ? const CircularProgressIndicator()
                      : AuthMainButton(
                          mainButtonLabel: "Sign up",
                          onPressed: () {
                            //signUp();
                          },
                        ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /*void signUp() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      if (_imageFile != null) {
        try {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);

          var ref = FirebaseStorage.instance
              .ref("cust-images/${_emailController.text}.jpg");
          await ref.putFile(File(_imageFile!.path));
          profileImage = await ref.getDownloadURL();
          _uid = FirebaseAuth.instance.currentUser!.uid;
          await customers.doc(_uid).set({
            'name': _nameController.text,
            'email': _emailController.text,
            'profileImage': profileImage,
            'phone': '',
            'address': '',
            'cid': _uid
          });
          _formKey.currentState!.reset();
          setState(() {
            _imageFile = null;
          });
          Navigator.pushReplacementNamed(context, "/customer_screen");
        } on FirebaseAuthException catch (e) {
          print("fffffffffff");
          setState(() {
            processing = false;
          });
          if (e.code == 'weak-password') {
            setState(() {
              processing = false;
            });
            MessengerHandler.showSnackBar(
                _scaffoldKey, "The password provided is too weak.");
          } else if (e.code == 'email-already-in-use') {
            setState(() {
              processing = false;
            });
            MessengerHandler.showSnackBar(
                _scaffoldKey, "The account already exists for that email.");
          }
        }
      } else {
        setState(() {
          processing = false;
        });

        MessengerHandler.showSnackBar(_scaffoldKey, "Please pick image fields");
      }
    } else {
      setState(() {
        processing = false;
      });
      MessengerHandler.showSnackBar(_scaffoldKey, "Please fill all the fields");
    }
  }*/
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}
