import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  final _senha = new TextEditingController();
  final _user = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                controller: _user,
                style:new TextStyle(color:Colors.deepPurple,fontSize: 22),
                decoration: InputDecoration(
                  labelText: "UserCode",
                  labelStyle: TextStyle(color: Colors.deepPurple)
                    ),
              ),
              Divider(),
              TextFormField(
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.number,
                controller: _senha,
                style:new TextStyle(color:Colors.deepPurple,fontSize: 22),
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.deepPurple)
                    ),
              ),
              Divider(),
              Divider(),
              ButtonTheme(
                height: 40,
                child: RaisedButton(
                  onPressed: (){
                    RegExp validUser = new RegExp(r"[0-9]");
                    RegExp validSenha = new RegExp (r"[0-9]");
                    Iterable<Match> match1 = validSenha.allMatches(_senha.text);
                    Iterable<Match> match2 = validUser.allMatches(_user.text);

                    if (match1.length == 0 || match2.length == 0){
                     Alert(context: context, title:"Informe o user e senha").show();
                    }
                    else{
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(),
                    ));
                    }
                  },
                  child: Text(
                    "Logar",
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
