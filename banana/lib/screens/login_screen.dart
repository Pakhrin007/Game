import 'package:banana/widgets/checkbox.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../core/colors.dart';
import '../core/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SingleChildScrollView(
          child: Form(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.heightBox,
              Center(child: Image.asset('assets/images/image2.jpg',height: 250,width: 400,),),
              20.heightBox,
            
              Center(child: "Welcome Back !!".text.color(AppColors.primaryColor).textStyle(TextStyle(fontFamily: 
              'libertin',fontSize: 24)).make()),

              20.heightBox,


            
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: TextFormField(
                   decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      prefixIconColor: Colors.black,
                      labelText: 'Enter your Email',
                      labelStyle: TextStyle(fontSize: 16,fontFamily: 'libertin',fontWeight: FontWeight.w500),
                      hintText: "E-mail",
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
                    prefixIcon: Icon(Icons.password),
                    prefixIconColor: Colors.black,
                    labelText: "Enter your Password",
                    labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,fontFamily: 'libertin'),
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 16,fontFamily: 'libertin',fontWeight: FontWeight.w500),

                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor))

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child:CheckBoxWidget() 
              ),
              5.heightBox,
              // -----------------------login Butto------------------------
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
                      child: "Login".text.color(Colors.white).textStyle(TextStyle(fontFamily: 
                      'libertin',fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 1.38)).make().onInkTap(() {
                        
                        Navigator.pushReplacementNamed(context,AppRoutes.home);
                      },),
                      ),
                    ),
                  ),
                ),
              ),
              15.heightBox,
              
              

            10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  "Don't Have Account?".text.textStyle(TextStyle(fontSize: 16,fontFamily: 'libertin')).make(),
                  "SignUp".text.color(Colors.blue).textStyle(TextStyle(fontSize: 16,fontFamily: 'libertin')).make().px(5).onInkTap(
                () {
                Navigator.pushReplacementNamed(context, AppRoutes.signup);
                },
                  ),
                ],
              )

            ],
          ),
          ),
        ),
    );
  }
}
