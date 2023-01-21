import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/local/shared_perfercence.dart';

class Register_screen extends StatelessWidget {

  var form_key = GlobalKey<FormState>();
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  var name_Controller = TextEditingController();
  var phone_Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<APP_cubit,states>(
       listener: (context,state){
         if(state is  Registersuccesfulstate)
           {
              if(state.model.status) {
                  cacheHelper.savedata(value: state.model.data!.token, key: 'token').then((value) {
                    token = state.model.data!.token;
                    APP_cubit.get(context).Get_Favorites_Screen();
                    APP_cubit.get(context).Get_Setting_Screen();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Shop_Layout()),
                            (route) => false);
                  });
              }else{
                     toast_screen(text: state.model.message, state: toast_stata.error);
              }
           }
       },
       builder: (context,state){
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: size.height,
                    width: double.infinity,
                    child: Stack(alignment: Alignment.center, children: <Widget>[
                      Positioned(
                        top: 0,
                        left: 0,
                        child:
                        Image.asset('asset/images/signup_top.png', width: size.width * 0.3),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Image.asset('asset/images/main_bottom.png',
                            width: size.width * 0.25),
                      ),
                      Form(
                        key: form_key,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.1,
                            ),
                            Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold

                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            SvgPicture.asset(
                              'asset/icons/signup.svg',
                              height: size.height * 0.2,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            field_form(size: size.width * 0.8,
                                scure: false,
                                validator: 'Please Enter Your Name',
                                controller_field: name_Controller,
                                type: TextInputType.text,
                                preffix: Icons.person,
                                title: 'Your Name'),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            field_form(size: size.width * 0.8,
                                scure: false,
                                validator: 'Please Enter Your Email',
                                controller_field: email_controller,
                                type: TextInputType.emailAddress,
                                preffix: Icons.email,
                                title: 'Your Email'),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            field_form(size: size.width * 0.8,
                                validator: 'Please Enter Your Password',
                                scure: APP_cubit.get(context).ispassword,
                                controller_field: password_controller,
                                preffix: Icons.lock,
                                suffix: APP_cubit.get(context).ispassword == true ? Icons.visibility : Icons.visibility_off,
                                onchance: (value)
                                {
                                  print(value);
                                },
                                onsitmmed: (value){
                                  print(value);
                                },
                                function: ()
                                {
                                  APP_cubit.get(context).change_passwordicon();
                                },
                                type: TextInputType.visiblePassword,
                                title: 'New Password'),

                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            field_form(size: size.width * 0.8,
                                scure: false,
                                validator: 'Please Enter Your Phone',
                                controller_field: phone_Controller,
                                preffix: Icons.phone,
                                onchance: (value)
                                {
                                  print(value);
                                },
                                onsitmmed: (value){
                                  print(value);
                                },
                                function: ()
                                {
                                },
                                type: TextInputType.phone,
                                title: 'Your Phone '),

                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            state is Registersuccesfulloadingstate ? Center(child: CircularProgressIndicator())
                                : ClipRRect(
                              borderRadius: BorderRadius.circular(29),
                              child: Container(
                                color: Colors.deepPurple,
                                width: size.width * 0.8,
                                child: TextButton(
                                    onPressed: (){

                                      if(form_key.currentState!.validate())
                                      {
                                        print(email_controller.text);
                                        print(name_Controller.text);
                                        print(phone_Controller.text);
                                        print(password_controller.text);
                                        APP_cubit.get(context).Regiter_Screen(
                                            name: name_Controller.text,
                                            email: email_controller.text,
                                            password: password_controller.text,
                                            phone: phone_Controller.text
                                        );
                                      }

                                    },
                                    child: Text(
                                      'Register',
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    )),
                              ),
                            ),


                            Row(
                              children: [
                                divider_build(),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                    'OR',
                                    style: TextStyle(
                                        color: Colors.deepPurple,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                divider_build()
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xFFD9D9D9),
                                          width: 1
                                      ),
                                      shape: BoxShape.circle
                                  ),
                                  child: SvgPicture.asset('asset/icons/twitter.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xFFD9D9D9),
                                          width: 1
                                      ),
                                      shape: BoxShape.circle
                                  ),
                                  child: SvgPicture.asset('asset/icons/google-plus.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Color(0xFFD9D9D9),
                                          width: 1
                                      ),
                                      shape: BoxShape.circle
                                  ),
                                  child: SvgPicture.asset('asset/icons/facebook.svg',
                                    width: 20,
                                    height: 20,
                                  ),
                                )
                              ],
                            )

                          ],
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),

          );
       },

    );
  }
}