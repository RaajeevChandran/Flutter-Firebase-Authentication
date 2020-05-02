import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'signinform.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class Crud{
  bool isloggedin(){
    if(FirebaseAuth.instance.currentUser()!=null){
      return true;
    }
    else{
      return false;
    }
  }
  Future<void> addData(data) async{
      if(isloggedin()){
        Firestore.instance.collection('UserData').add(data).catchError((e) {
     print(e.message);
    });
 }
      else{
        print('You need to be logged in');
      }
  }
}

class _SignupState extends State<Signup> {
  Crud database = new Crud();
  String _email,_password,_name,_phonenumber;
  final GlobalKey <FormState> _formkey=GlobalKey<FormState>();
  Widget build(BuildContext context) {
    
    @override
    void initState() { 
      _email='';
      _password='';
      _name='';
      _phonenumber='';
      
      
      super.initState();
      
    }
    
    
    return Scaffold(
          resizeToAvoidBottomPadding: false ,
          body:Container(
           height:double.infinity,
           width:double.infinity,
          decoration: BoxDecoration(
            image:DecorationImage(
              image: AssetImage('assets/images/Capture.jpg',),
              fit:BoxFit.cover
              )
              ),
          child:Column(
           children: <Widget>[
            
                  backbutton(),
         
                  Container(margin:EdgeInsets.all(20.0)),
          
                  Text('Sign Up',
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
                                 name(),
           
                                 Container(padding: EdgeInsets.only(bottom:20.0)),
            
                                emailbutton(),
           
                                 Container(padding: EdgeInsets.only(bottom:20.0)),
          
                                 password(),
            
                                Container(padding: EdgeInsets.all(10.0),),
            
                                phonenumber(),
           
                                Container(padding: EdgeInsets.all(10.0),),
            
                                signupbutton(),

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
          
 
  Widget name(){
            return Container(
              padding:EdgeInsets.all(10.0),
              child:TextFormField(
            
              validator: (input){
                if(input.isEmpty){
                  return "Enter your name";
                }
                return null;
              },
              onSaved:(input){
                setState(() {
                  this._name=input;
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
                borderRadius: BorderRadius.circular(10.0),
        
                ),
                labelText:'Name',
                labelStyle: TextStyle(fontFamily: 'Montserrat',color: Colors.white), 
                prefixIcon: Icon(Icons.person ,color:Colors.white),

              ),
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
                  this._email=input;
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
                  borderRadius: BorderRadius.circular(10.0),
        
                ),
                labelText:'Email',
                labelStyle: TextStyle(fontFamily: 'Montserrat',color: Colors.white), 
                prefixIcon: Icon(Icons.email,color:Colors.white),

              ),
            )
        );
          }

          
  Widget password(){
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
                  this._password=input;
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

          
  Widget phonenumber(){
       return Container(
              padding: EdgeInsets.all(10.0),
              child:TextFormField(
                keyboardType: TextInputType.number,
              obscureText: false,
              validator: (input){
                
                if(input.length < 10 || input.length > 10){
                  return 'Enter a valid phone number';
                }
                  return null;

              },
              onSaved: (input){
                setState(() {
                  this._phonenumber=input;
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
              labelText:'Phone Number', 
              labelStyle: TextStyle(fontFamily: 'Montserrat',color: Colors.white),                                
              prefixIcon: Icon(Icons.phone,color:Colors.white)
                
              ),
            )
        );
          }

    
    
  Widget signupbutton(){
          return Container(
                height: 53.00,
                width: 298.00,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(0, 200, 231, 0.4),
                    border: Border.all(width: 1.00,color:Colors.white), borderRadius: BorderRadius.circular(27.00), 
                      ), 
                child:FlatButton(
                   onPressed: signup,
                   child:Text('Sign Up',
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
 
 
 
 Future<void> signup() async{
  final formstate=_formkey.currentState;
  if(formstate.validate()){
    formstate.save();
    try{
    final FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)).user;
    
    Map <String,String>userdata={
        'Name':this._name,
        'Email':this._email,
        'Phone Number':this._phonenumber
        };
    database.addData(userdata);
    print('Here');
      
    Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>Loginpage()));

    }catch(e){
      if(e is PlatformException){
        if(e.code=='ERROR_EMAIL_ALREADY_IN_USE'){
                  return showDialog(
                    context:context,
                    barrierDismissible: false,
                    builder:(BuildContext context){
                      return AlertDialog(
                        content:Text('Oops,an account with $_email already exists. Please try signing in'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed:() {
                              Navigator.pop(context);
                              }, 
                              child: Text('Done')
                              )
                              ],
                    );
                  }
                    
                  );
                   
        }
      }
    }
   
  }
}


}
        


