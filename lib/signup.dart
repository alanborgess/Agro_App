import 'package:agroapp/home_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  String _email, _password, _phone, _name;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: SingleChildScrollView(

        child: Form(
//            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, left: 20.0),
                  child: Column(
                    children: [
                    SizedBox(
                      child: Image.asset('assets/images/Logo.png',
                              height: 50),
                    ),
                      SizedBox(
                        height: 50,
                        child: Text(
                          'Faça seu cadastro! ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: 'Montserrat',
                            color: Colors.lightGreen
                          ),
                        ),
                      )

                    ],
                  )
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
                  child: TextFormField(
                    validator: (input) {
                      if(input!.isEmpty){
                        return 'Name required';
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
//                      border: OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.black,)
//                      ),
                      labelText: 'Nome',
                      prefixIcon: Icon(Icons.person, color: Colors.black,size: 20.0,),
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),),
//                    onSaved: (input) => _name = input,
                  ),
                ),
                Padding(
                 padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: TextFormField(
                   validator: (input) {
                      if(input!.length < 6){
                        return 'Email ID field can\'t remain empty';
                      }
                      else{
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email ID',
                      prefixIcon: Icon(Icons.email, color: Colors.black,size: 20.0,),
                     labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                       color: Colors.grey,
                      ),),
////                    onSaved: (input) => _email = input,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  child: TextFormField(
                    validator: (input) {
                      if(input!.length < 6){
                        return 'Password can\'t remain Empty';
                      }else{
                        return null;
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
//                      border: OutlineInputBorder(
//                          borderSide: BorderSide(color: Colors.black,)
//                      ),
                      labelText: 'Senha',
                      prefixIcon: Icon(Icons.security, color: Colors.black,size: 20.0,),
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),),
//                    onSaved: (input) => _password = input,
                    obscureText: true,
                  ),
                ),

                SizedBox(height: 10.0,),


                Container(
                    width: 400.0,
                    height: 50.0,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: Text('Cadastrar-se'),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                ),


                SizedBox(height: 30.0,),


                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Já tem conta? ',
                          style: TextStyle(
                            fontSize:12 ,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                          ),),

                        SizedBox(height: 10.0,),

                        Container(
                            width: 400.0,
                            height: 50.0,
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                                child: Text('Login'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Homepage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.lightGreen,
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                              textStyle: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),

                        )]
                  ),


                SizedBox(height: 20.0,)

              ],
            )
        ),
      ),
    );
  }
  //
//  void signUp() async {
//    //   dynamic result = await _auth.CreateNewUser(_email, _password);
//    if(_formKey.currentState.validate()){
//      _formKey.currentState.save();
//      try{
//        UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
//        User firebaseUser = result.user;
//        firebaseUser.updateProfile(displayName: _name);
//        // print(firebaseUser.uid);
//        await DatabaseManager().createUserData(_name, null, null, _phone, firebaseUser.uid);
//        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
//
//      } on FirebaseAuthException catch (e) {
//        if (e.code == 'weak-password') {
//          print('The password provided is too weak.');
//        }
//        else if (e.code == 'email-already-in-use') {
//          Alert(context);
//        }
//      }
//
//      catch(e){
//        print(e.message);
//      }
//    }
//  }

//  void Alert(BuildContext context) {
//
//    var alertDialog = AlertDialog(
//      content: Text('Account already exists for the given email. '
//          'Try Signing Up using different email or Login to your Account.'),
//    );
//
//    showDialog(
//      context: context,
//      builder: (BuildContext context){
//        return alertDialog;
//      },
//    );
//  }
}
