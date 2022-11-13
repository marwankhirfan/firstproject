import 'package:firstproject/widgets/otp_ver.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/theme.dart';


class ChooseVerScreen extends StatefulWidget {
  const ChooseVerScreen({Key? key}) : super(key: key);

  @override
  State<ChooseVerScreen> createState() => _ChooseVerScreenState();
}

class _ChooseVerScreenState extends State<ChooseVerScreen> {
  TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[
                  CustomTheme.loginGradientStart,
                  CustomTheme.loginGradientEnd,
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
                stops: <double>[0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Image(
                    height: 300,
                    fit: BoxFit.fill,
                    image: AssetImage("assets/otp_logo.png")),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0),
                child: Text("Enter Your Phone Number",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'WorkSansSemiBold')),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8, left: 12),
                child: Text(
                    "We 'll send you a Verification code to rest your password",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'WorkSansMedium')),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFf7418c)),
                  child: TextField(
                    controller: _phone,
                    keyboardType: TextInputType.number,
                    autocorrect: false,
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 16.0,
                        color: Colors.black),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Icon(
                        FontAwesomeIcons.phone,
                        color: Colors.black,
                      ),
                      hintText: 'Phone',
                      hintStyle: TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
                    ),
                    textInputAction: TextInputAction.go,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.only(top: 0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: CustomTheme.loginGradientStart,
                        offset: Offset(1.0, 6.0),
                        blurRadius: 20.0),
                  ],
                  gradient: LinearGradient(
                      colors: <Color>[
                        CustomTheme.loginGradientEnd,
                        CustomTheme.loginGradientStart,
                      ],
                      begin: FractionalOffset(0.2, 0.2),
                      end: FractionalOffset(1.0, 1.0),
                      stops: <double>[0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: MaterialButton(
                    highlightColor: Colors.transparent,
                    splashColor: CustomTheme.loginGradientEnd,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 42),
                      child: Text(
                        'NEXT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'WorkSansBold'),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  OtpScreen(),));
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}