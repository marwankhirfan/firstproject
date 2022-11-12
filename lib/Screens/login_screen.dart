import 'package:firstproject/utils/bubble_indicator_painter.dart';
import 'package:firstproject/widgets/sign_in.dart';
import 'package:firstproject/widgets/sign_up.dart';
import 'package:firstproject/widgets/theme.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image(
                    height:
                        MediaQuery.of(context).size.height > 800 ? 191.0 : 150,
                    fit: BoxFit.fill,
                    image: const AssetImage('assets/login_logo.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: _buildMenuBar(context),
                ),
                Expanded(
                    flex: 2,
                    child: PageView(
                      controller: _pageController,
                      physics: const ClampingScrollPhysics(),
                      onPageChanged: (int i) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (i == 0) {
                          setState(() {
                            right = Colors.white;
                            left = Colors.black;
                          });
                        } else if (i == 1) {
                          setState(() {
                            right = Colors.black;
                            left=Colors.white;
                          });
                        }
                      },
                      children: <Widget>[
                        ConstrainedBox(constraints: const BoxConstraints.expand(),
                        child: const SigninPage(),),
                        ConstrainedBox(constraints: BoxConstraints.expand(),child: const SignUp(),)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuBar(BuildContext) {
    return Container(
      width: 300,
      height: 50,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignInButtonPress,
                child: Text(
                  'Existing',
                  style: TextStyle(
                      color: left,
                      fontSize: 16,
                      fontFamily: 'WorkSansSemiBold'),
                ),
              ),
            ),
            Expanded(
                child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
              onPressed: _onSignUpButtonPress,
              child: Text(
                'New',
                style: TextStyle(
                    color: right, fontSize: 16, fontFamily: 'WorkSansSemiBold'),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
