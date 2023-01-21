import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/modules/login/body.dart';
import 'package:shop_app/modules/resigter/register.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/style/colors/colors.dart';

class background extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('asset/images/main_top.png',width: size.width * 0.3),

          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset('asset/images/main_bottom.png',width: size.width * 0.2),

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'WELCOME IN ONLINE SHOP',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              SvgPicture.asset(
                'asset/icons/chat.svg',
                height: size.height * 0.45,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              button(
                  size: size.height * 0.45,
                  Title: 'LOGIN',
                  color: deflaut_color,
                  function: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Body()));
                  },
                  color_text: Colors.white),
              SizedBox(
                height: size.height * 0.03,
              ),
              button(
                  size: size.height * 0.45,
                  Title: 'REGITER',
                  color: deflaut_color2,
                  function: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register_screen()));
                  },
                  color_text: Colors.black),
            ],
          )
         ]
      ),

    );
  }
}
