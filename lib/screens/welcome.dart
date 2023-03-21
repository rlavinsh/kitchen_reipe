import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/screens/home.dart';

class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = new TextEditingController();
  int charLength = 0;
  bool status = false;

  /// Here we create the function
  _onChanged(String value) {
    setState(() {
      charLength = value.length;
    });

    if (charLength >= 1) {
      setState(() {
        status = true;
      });
    } else {
      setState(() {
        status = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          // backgroundColor: Colors.green,
          body: SingleChildScrollView(
            child: Container(
              // alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Color(0xff213A50), Color(0xff071938)]),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const Text(
                      "In",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    const Text(
                      "Kitchen",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    ///textFormField
                    // Note: Same code is applied for the TextFormField as well
                    // Note: Same code is applied for the TextFormField as well
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        textInputAction: TextInputAction.go,
                        textCapitalization: TextCapitalization.characters,
                        maxLength: 8,
                        controller: name,
                        onChanged: _onChanged,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          labelText: "Please Enter your Name",
                          labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                          focusColor: Colors.white12,
                          //add prefix icon
                          prefixIcon: const Icon(
                            Icons.person_outline_rounded,
                            color: Colors.white,
                          ),

                          // errorText: "Error",

                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white70, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white70, width: 1.0),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter some text';
                          }
                        },
                        onFieldSubmitted: (value) {
                          print("field submitted");
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),

                    /// Submit Button
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: status,
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => Home(naam: name.text)));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please enter valid Name')),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}
