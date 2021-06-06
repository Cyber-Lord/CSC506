import 'package:flutter/material.dart';
import 'package:csc506/pages/signup.dart';
import 'package:csc506/pages/user.dart';
import 'package:http/http.dart' as http;

import 'dashboard.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  User user = User('', '', '', '');
  Future save() async {
    var res =
        await http.post('localhost:8080/signin', headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8'
    }, body: <String, String>{
      'email': user.email,
      'password': user.password,
    });
    print(res.body);
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => Dashboard()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage('lib/images/mautech.jpeg'),
                            fit: BoxFit.contain,
                          ),
                          /*  Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ), */
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(60.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image(
                                          image: AssetImage(
                                              'lib/images/mautech.jpeg'),
                                          fit: BoxFit.contain,
                                        ),
                                        /*  Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                            ),
                          ), */
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: TextFormField(
                                            controller: TextEditingController(
                                                text: user.email),
                                            onChanged: (value) {
                                              user.email = value;
                                            },
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Enter Something';
                                              } else if (RegExp(
                                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(value)) {
                                                return null;
                                              } else {
                                                return 'Enter valid email';
                                              }
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'Enter Email',
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: TextFormField(
                                            controller: TextEditingController(
                                                text: user.password),
                                            onChanged: (value) {
                                              user.email = value;
                                            },
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return 'Enter Something';
                                              }
                                              return null;
                                            },
                                            decoration: InputDecoration(
                                              hintText: 'Enter Password',
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                borderSide: BorderSide(
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(
                                            16.0,
                                          ),
                                          child: Container(
                                            // height: 50,
                                            //  width: 400,
                                            child: GestureDetector(
                                              onTap: () {
                                                if (_formKey.currentState
                                                    .validate()) {
                                                  save();
                                                  Navigator.push(
                                                      context,
                                                      new MaterialPageRoute(
                                                          builder: (context) =>
                                                              Dashboard()));
                                                } else {
                                                  print('Unsuccessful');
                                                }
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.blue,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Sign In',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      backgroundColor:
                                                          Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              900, 10, 0, 0),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Not registered?',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Center(
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        new MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    SignUp()));
                                                  },
                                                  child: Text(
                                                    ' Register Here',
                                                    style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
