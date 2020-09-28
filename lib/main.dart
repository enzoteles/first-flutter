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
  bool _obscuredText = true;
  TextEditingController useController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isUserValidate = false;
  bool isPasswordValidate = false;

  _toggle(){
    setState(() {
      _obscuredText = !_obscuredText;
    });
  }


  @override
  Widget build(BuildContext context) {

    final emailField = TextField(
      controller: passwordController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          errorText: isPasswordValidate ? 'Por favor, entre com email' : null,
          icon: const Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: const Icon(Icons.person),
          ),
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
    );

    final passwordField = TextField(
      controller: useController,
      obscureText: _obscuredText,
      style: style,
      decoration: InputDecoration(
        errorText: isUserValidate ? 'Por favor, entre com a senha' : null,
        icon: const Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: const Icon(Icons.lock),
        ),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: 'Password',
          suffixIcon: FlatButton(
              onPressed: _toggle,
              child:Icon(Icons.remove_red_eye,
                  color: _obscuredText ? Colors.black12 : Colors.black54)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0))
      ),
      onChanged: (value){
        setState(() {
          final _password = value;
        });
      },
    );


    bool validateUserTextField(String userInput) {
      if (userInput.isEmpty) {
        setState(() {
          isUserValidate = true;
        });
        return false;
      }
      setState(() {
        isUserValidate = false;
      });
      return true;
    }

    bool validatePasswordTextField(String userInput) {
      if (userInput.isEmpty) {
        setState(() {
          isPasswordValidate = true;
        });
        return false;
      }
      setState(() {
        isPasswordValidate = false;
      });
      return true;
    }


    final buttonLogin = ButtonTheme(
      minWidth: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: RaisedButton(
        color: Colors.blueAccent[900],
        child: Text('Login', textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        onPressed: (){
          validateUserTextField(useController.text);
          validatePasswordTextField(passwordController.text);
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


