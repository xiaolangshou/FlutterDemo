import 'package:flutter/material.dart';
import 'package:d5_cylinder/common/component_index.dart';

//class LoginPage extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return new _LoginPageState();
//  }
//}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

//  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Color appBarBg = Color.fromARGB(255, 25, 164, 178);

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          print("登陆-------");

//          Navigator.of(context).push(new PageRouteBuilder(
//            opaque: false,
//            pageBuilder: (BuildContext context, _, __) {
//              return new BottomNavWidget();
//            },
//          ));

//          return Navigator.of(context).pushReplacementNamed('/BottomNavWidget');
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        Tools.getImgPath("user_bg.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget buildAppBar() {
    return AppBar(
      leading: Icon(Icons.menu),
      elevation: 0.0,
      title: Align(
        child: Image.asset(
          Tools.getImgPath("amazon_logo_beacon.png"),
          color: Colors.white,
          height: 30,
        ),
        alignment: Alignment.centerLeft,
      ),
      actions: <Widget>[
        Icon(Icons.notifications_none),
        Icon(Icons.shopping_cart),
      ],
      backgroundColor: appBarBg,
    );
  }
}

void _goMain(BuildContext context) {
  Navigator.of(context).pushReplacementNamed('/MainPage');
}
