import 'package:bytebank/screens/transferencias/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(ByteBankApp());

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary
          )

      ),
      home: widegetLogin(),
    );
  }

}

class widegetLogin extends StatefulWidget {
  @override
  _widegetLoginState createState() => _widegetLoginState();
}

class _widegetLoginState extends State<widegetLogin> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Password',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
    );

    final buttonLogin = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: RaisedButton(
        color: Color(0xff01A0C7),
        child: Text('Login', textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: (){

        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );


    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 250.0,
                    child: Image.asset("images/login_two.png",
                    fit: BoxFit.contain,),),
                  SizedBox(height: 40.0, ), emailField,
                  SizedBox(height: 20.0,), passwordField,
                  SizedBox(height: 30.0,), buttonLogin,
                ],
              ),
            ),
          ),
        ),
    );
  }
}


