
import 'package:banana/core/colors.dart';
import 'package:banana/core/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon(Icons.arrow_back,size: 30,color: MyTheme.primaryColor,).pOnly(top: 30,left: 20),
     
              10.heightBox,
              Center(child: Image.asset('assets/images/image2.jpg',height: 250,width: 400,),),
               20.heightBox,
            
              Center(child: "SignUp to Play !!".text.color(AppColors.primaryColor).textStyle(TextStyle(fontFamily: 
              'libertin',fontSize: 24)).make()),

              20.heightBox,
            
           
           
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: TextFormField(
                   decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.black,
                      labelText: 'E-mail',
                      labelStyle: TextStyle(fontSize: 16,fontFamily: 'libertin',fontWeight: FontWeight.w500),
                      hintText: "Your E-mail",
                      hintStyle: TextStyle(fontSize: 16,fontFamily: 'libertin',fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),  
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor ))

                    ),
                ),
              ),
              13.heightBox,

              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    prefixIconColor: Colors.black,
                    labelText:"PhoneNumber" ,
                    labelStyle: TextStyle(fontSize: 16,fontFamily: 'libertin',fontWeight: FontWeight.w500),
                    hintText: "Your PhoneNumber",
                    hintStyle:TextStyle(fontSize: 16,fontFamily: 'libertin',fontWeight: FontWeight.w500),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor))
                  ),
                ),
              ),
                13.heightBox,
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: TextFormField(
                   decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.black,
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 16,fontFamily: 'libertin',fontWeight: FontWeight.w500),
                      hintText: "Your Password",
                      hintStyle: TextStyle(fontSize: 16,fontFamily: 'libertin',fontWeight: FontWeight.w500),
                      
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),  
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor  ))

                    ),
                ),
              ),
                13.heightBox,
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: TextFormField(
                   decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.black,
                      labelText: 'Confirm-Password',
                      labelStyle: TextStyle(fontSize: 16,fontFamily: 'libertin',fontWeight: FontWeight.w500),
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(fontSize: 16,fontFamily: 'libertin',fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),  
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor  ))

                    ),
                ),
              ),
                     5.heightBox,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Material(
                    color: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: InkWell(
                      child: AnimatedContainer(duration: Duration(),
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: "SignUp".text.color(Colors.white).textStyle(TextStyle(fontFamily: 
                      'libertin',fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 1.38)).make(),
                      ),
                    ),
                  ),
                ),
              ),
              

              

            10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  "Already Have Account?".text.textStyle(TextStyle(fontSize: 16,fontFamily: 'libertin')).make(),
                  "Login".text.color(Colors.blue).textStyle(TextStyle(fontSize: 16,fontFamily: 'libertin')).make().px(5).onInkTap(
                () {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
                },
                  ),
                ],
              )

            ],
          )),
        ),
      ),
    );
  }
}