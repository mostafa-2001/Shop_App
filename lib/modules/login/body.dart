import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/modules/resigter/register.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/local/shared_perfercence.dart';

class Body extends StatelessWidget {
  var form_key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<APP_cubit, states>(
      listener: (context, state) {
        if (state is Loginsuccesfulstate) {
          if (state.User_mode.status) {
            print(state.User_mode.message);
            print(state.User_mode.data!.token);
            toast_screen(
                text: state.User_mode.message, state: toast_stata.Success);
            cacheHelper
                .savedata(value: state.User_mode.data!.token, key: 'token')
                .then((value) {
                   token = state.User_mode.data!.token;
                   APP_cubit.get(context).Get_Favorites_Screen();
                   APP_cubit.get(context).Get_Setting_Screen();
                   Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Shop_Layout()),
                  (route) => false);
            });
          } else {
            print(state.User_mode.message);
            toast_screen(
                text: state.User_mode.message, state: toast_stata.error);
          }
        }
      },
      builder: (context, state) {
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
                      child: Image.asset('asset/images/main_top.png',
                          width: size.width * 0.5),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset('asset/images/login_bottom.png',
                          width: size.width * 0.5),
                    ),
                    Form(
                      key: form_key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: size.height * 0.05,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          SvgPicture.asset(
                            'asset/icons/login.svg',
                            height: size.height * 0.35,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          field_form(
                              size: size.width * 0.8,
                              scure: false,
                              controller_field:
                                  APP_cubit.get(context).email_controller,
                              type: TextInputType.emailAddress,
                              validator: 'please Email must be not empty',
                              preffix: Icons.person,
                              title: 'Your Email'),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          field_form(
                              size: size.width * 0.8,
                              scure: APP_cubit.get(context).ispassword,
                              controller_field:
                                  APP_cubit.get(context).password_controller,
                              preffix: Icons.lock,
                              function: () {
                                APP_cubit.get(context).change_passwordicon();
                              },
                              suffix: APP_cubit.get(context).Icon,
                              onchance: (value) {
                                print(value);
                              },
                              validator: 'please password must be not empty',
                              onsitmmed: (value) {
                                if (form_key.currentState!.validate()) {
                                  APP_cubit.get(context).userlogin(
                                      Email: APP_cubit.get(context)
                                          .email_controller
                                          .text,
                                      Password: APP_cubit.get(context)
                                          .password_controller
                                          .text);
                                }
                              },
                              type: TextInputType.visiblePassword,
                              title: 'Your Password'),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          state is! Loginsuccesfulloadingstate
                              ? button(
                                  size: size.width * 0.8,
                                  Title: 'Login',
                                  color: Colors.deepPurple,
                                  color_text: Colors.white,
                                  function: () {
                                    if (form_key.currentState!.validate()) {
                                      APP_cubit.get(context).userlogin(
                                          Email: APP_cubit.get(context)
                                              .email_controller
                                              .text,
                                          Password: APP_cubit.get(context)
                                              .password_controller
                                              .text);
                                    }
                                  })
                              : Center(child: CircularProgressIndicator()),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an Account ? ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Register_screen()));
                                  },
                                  child: Text(
                                    'Register Now !',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.deepPurple),
                                  ))
                            ],
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
                                      fontWeight: FontWeight.w600),
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
                                        color: Color(0xFFD9D9D9), width: 1),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  'asset/icons/twitter.svg',
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
                                        color: Color(0xFFD9D9D9), width: 1),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  'asset/icons/google-plus.svg',
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
                                        color: Color(0xFFD9D9D9), width: 1),
                                    shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                  'asset/icons/facebook.svg',
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
