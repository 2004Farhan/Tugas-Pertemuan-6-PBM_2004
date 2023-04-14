import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.username});
  final username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _username = TextEditingController();
  double tinggi = 0;
  double berat = 0;
  String kondisi = "";
  int Hitung_BMI = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffffb100),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Selamat Datang, ' + username[0],
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      height: 1.5,
                      color: Color(0xff000000),
                    ),
                  ),
                ],
              ),
            )),
            Container(
              child: Text(
                'BMI KAMU',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                  color: Color(0xff000000),
                ),
              ),
            ),
            Container(
              height: size.height * 0.30,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        "$Hitung_BMI",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 45.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        "$kondisi",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: "Tinggi : ",
                        style:
                            TextStyle(color: Color(0xFF403f3d), fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$tinggi cm",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: tinggi,
                    max: 250,
                    min: 0,
                    onChanged: (height) {
                      setState(() {
                        tinggi = height;
                      });
                    },
                    divisions: 250,
                    label: "$tinggi",
                    activeColor: Color(0xFF403f3d),
                    inactiveColor: Colors.white,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Berat : ",
                        style:
                            TextStyle(color: Color(0xFF403f3d), fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$berat kg",
                            style: TextStyle(
                                color: Color(0xFF403f3d),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: berat,
                    max: 280,
                    min: 0,
                    onChanged: (weight) {
                      setState(() {
                        berat = weight;
                      });
                    },
                    divisions: 300,
                    label: "$berat",
                    activeColor: Color(0xFF403f3d),
                    inactiveColor: Colors.white,
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    color: Color(0xFF403f3d),
                    width: 120,
                    height: 37,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            Hitung_BMI =
                                (berat / ((tinggi / 100) * (tinggi / 100)))
                                    .round()
                                    .toInt();
                            if (Hitung_BMI >= 18.5 && Hitung_BMI <= 25) {
                              kondisi = " Normal";
                            } else if (Hitung_BMI > 25 && Hitung_BMI <= 30) {
                              kondisi = " Berat badan berlebih";
                            } else if (Hitung_BMI > 30) {
                              kondisi = " Obesitas";
                            } else {
                              kondisi = " Berat badan kurang";
                            }
                          });
                        },
                        child: Text(
                          "Calculate",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            height: 1.5,
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(255, 255, 255, 255),
                            decorationColor: Color(0xff000000),
                          ),
                        )),
                  ),

                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
