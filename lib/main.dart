import 'package:flutter/material.dart';
import 'signinform.dart';
import 'signupform.dart';

void main()=>runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
     home:App()
  )
);

class App extends StatelessWidget {
  
  
  Widget build(BuildContext context) {
    
      return Scaffold(
      
       body:Container(
          decoration: BoxDecoration(
          image:DecorationImage(
          image: AssetImage('assets/images/Capture.jpg'),
          fit:BoxFit.cover
          )
          ),
          child:Column(
            children: <Widget>[
            Container(margin:EdgeInsets.all(10.0)),
              
              
            Image.asset('assets/images/intro.gif'),
              
            
            Container(padding:EdgeInsets.all(10.0)),
            
  
            Container(
            margin: EdgeInsets.only(top:40.0),
            height: 53.00,
            width: 298.00,
            decoration: BoxDecoration(
            color: Color.fromRGBO(38, 142, 214, 0.4),
            border: Border.all(
              width: 1.00, 
              color: Colors.white
              ), 
            borderRadius: BorderRadius.circular(27.00), 
            ), 
            child:FlatButton(
               onPressed: (){
               Navigator.push(context,MaterialPageRoute(
                 builder: (context)=>Signup()
                 )
                 );
                },
              child:Text('Sign Up',
              style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color:Color(0xffffffff),  
              )
              )
              )
              ),
            
            
            Container(padding:EdgeInsets.all(10.0)),
    
    
    
            Container(
              margin: EdgeInsets.only(top:20.0),
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
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Loginpage()));
                       },
                   child:Text('Sign In',style: TextStyle(
                   fontFamily: "Montserrat",
                   fontWeight: FontWeight.w700,
                   fontSize: 19,
                   color:Color(0xffffffff),  
                   )
                   )
                   )
                   )



            ],
          )
        )
      );
      
    
  }

  

  }

