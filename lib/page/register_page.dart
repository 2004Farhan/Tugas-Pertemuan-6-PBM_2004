import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

List username = [];
List password = [];

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  RegisterPage createState() {
    return RegisterPage();
  }
}

class RegisterPage extends State<MyRegister> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.fromLTRB(10.67, 16.17, 10.67, 206),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffffb100),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 312.71, 115.15),
                      width: 25.96,
                      height: 24.68,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 4, 20),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          height: 1.5,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 4, 20),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                    width: 350,
                                    child: TextFormField(
                                      controller: _username,
                                      decoration: InputDecoration(
                                        labelText: "Username",
                                        fillColor: Colors.white.withOpacity(1),
                                        filled: true,
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(8.0),
                                          ),
                                          borderSide: new BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Silahkan isi usernamenya';
                                        }
                                        return null;
                                      },
                                    )),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                ),
                                SizedBox(
                                    width: 350,
                                    child: TextFormField(
                                      controller: _password,
                                      decoration: InputDecoration(
                                        labelText: "Password",
                                        fillColor: Colors.white.withOpacity(1),
                                        filled: true,
                                        border: new OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(8.0),
                                          ),
                                          borderSide: new BorderSide(
                                            color: Colors.transparent,
                                            width: 1.0,
                                          ),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Silahkan isi passwordnya';
                                        }
                                        return null;
                                      },
                                    )),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                ),
                                SizedBox(
                                    height: 37,
                                    width: 120,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            username.add(_username.text);
                                            password.add(_password.text);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LoginPage(
                                                  username: username,
                                                  password: password,
                                                ),
                                              ),
                                            );
                                            Navigator.of(context)
                                                .pushNamed("/login");
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.black,
                                        ),
                                        child: const Text("Register")))
                              ],
                            ))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
