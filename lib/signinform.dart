import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';


class Loginpage extends StatefulWidget {
_LoginpageState createState() => _LoginpageState();
}

class SuccessPage extends StatelessWidget{
    Widget build(context){
      return Scaffold(
        body:Container(
           height:double.infinity,
           width:double.infinity,
           decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('assets/images/green.jpg',),
              fit:BoxFit.cover
              )
              ),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset('assets/images/done.gif',fit:BoxFit.cover),
                Padding(
            padding: EdgeInsets.only(right:190.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  iconSize: 30.0,
                  onPressed: () {
                    Navigator.pop(context);
                     },
                ),
              ],
            )
        )
              ],
            )
      ),

      );
    }
}

class _LoginpageState extends State<Loginpage> {
  
  String _email,_password;
  
  final GlobalKey <FormState> _formkey=GlobalKey<FormState>();
  
  Widget build(BuildContext context) {
    
  
    void initState() { 
      _email='';
      _password='';
      super.initState();
      
    }
    
    return Scaffold(
          resizeToAvoidBottomPadding: false ,
          body:Container(
           height:double.infinity,
           width:double.infinity,
           decoration: BoxDecoration(
            image:DecorationImage(image: AssetImage('assets/images/Capture.jpg',),fit:BoxFit.cover)
              ),
           child:Column(
               children: <Widget>[
            
                  backbutton(),
         
                   Container(margin:EdgeInsets.all(40.0)),
          
                  Text('Sign In',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        fontSize: 40,
                        color:Color(0xffffffff), 
     
                  ),
            
                  ),


                  Container(padding:EdgeInsets.only(bottom:10.0)),
 
 
                  Form(
                      key:_formkey,
                      child:Column(
                           children: <Widget>[
                              emailbutton(),

                              Container(padding: EdgeInsets.only(bottom:20.0)),
           
                              passwordbutton(),
            
                              Container(padding: EdgeInsets.all(10.0),),
                              
                              finalsignin(),

                                   ],
                                   )
                                  ),



                           ],
                            )          
                            )
                            );
         
      
          
       }
          
          
  Widget backbutton(){
            return  Padding(
            padding: EdgeInsets.only(top: 50.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  iconSize: 30.0,
                  onPressed: () {Navigator.pop(context);},
                ),
              ],
            )
        );
          }
          
          
          Widget emailbutton(){
           
            return Container(
              padding:EdgeInsets.all(10.0),
              child:TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (input)
              {
                if(!input.contains('@')){
                  return 'Invalid e-mail';
                }
                return null;
              },
              onSaved:(input){
                setState(() {
                  _email=input;
                });
                
                },
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white, 
                        width: 1.0
                      ),
                      ),
                border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(10.0),
                     ),
                labelText:'Email',
                labelStyle: TextStyle(fontFamily: 'Montserrat',color: Colors.white), 
                prefixIcon: Icon(Icons.email,color:Colors.white),

              ),
            )
            );
          }

  Widget passwordbutton(){
            return Container(
              padding: EdgeInsets.all(10.0),
              child:TextFormField(
              obscureText: true,
              validator: (input){
                if(input.length<5){
                  return 'Password length too short';
                }
                  return null;

              },
              onSaved:(input){
                setState(() {
                  _password=input;
                });
                },
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                     borderSide: const BorderSide(
                        color: Colors.white, 
                        width: 1.0
                        ),
                     ),
                border: OutlineInputBorder(
                  
                    borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                      ),
                      ),
                labelText:'Password', 
                labelStyle: TextStyle(fontFamily: 'Montserrat',color: Colors.white),                                
                prefixIcon: Icon(Icons.lock,color:Colors.white)
                
              ),
            )
        );
          }

  Widget finalsignin(){
      return Container(
              height: 53.00,
              width: 298.00,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 200, 231, 0.4),
                  border: Border.all(
                    width: 1.00,
                    color:Colors.white
                    ), 
                  borderRadius: BorderRadius.circular(27.00), 
                  ), 
              child:FlatButton(
                  onPressed: signIn,
                  child:Text('Sign In',
                  style: TextStyle(
                     fontFamily: "Montserrat",
                     fontWeight: FontWeight.w700,
                     fontSize: 19,
                     color:Color(0xffffffff),  
                    )
                    )
                    )
                    );
          }
        


  Future<void> signIn() async{
  final formstate=_formkey.currentState;
  if(formstate.validate()){
    formstate.save();
    try{
    final FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SuccessPage()));


    }catch(e){
      print(e.message);
    }
   
  }
}


}
