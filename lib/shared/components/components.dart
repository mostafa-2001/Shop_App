
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/style/colors/colors.dart';
import 'package:shop_app/modules/welcome/background.dart';

Widget button({
  required double size,
  required String Title,
  required Color color,
  required Color color_text,
  required Function function
}) => ClipRRect(
  borderRadius: BorderRadius.circular(29),
  child: Container(
    color: color,
    width: size,
    child: TextButton(
        onPressed: (){
          function();
    },
        child: Text(
          Title,
          style: TextStyle(color: color_text, fontSize: 18),
        )),
  ),
);

Widget field_form (
{
   required double size,
   required TextEditingController controller_field,
   required IconData preffix,
   IconData? suffix,
   Function? function,
   Function? onsitmmed,
   Function? onchance,
   String? validator,
   required String title,
   required TextInputType type,
   required bool scure
}
    ) => Container(
   height: 60,
  width: size,
  margin: EdgeInsets.symmetric(vertical: 10),
  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 25),
  decoration: BoxDecoration(
    color:Color.fromRGBO(224, 209, 243, 1),
    borderRadius: BorderRadius.circular(29),
  ),
  child: TextFormField(
    keyboardType: type,
    obscureText: scure,
    validator: (String? value)
    {
       if(value == null || value.trim().length == 0)
         {
            return validator;
         }
       return null;
    },

    onChanged: (value){
      if(onchance != null)
      {
        onchance(value);
      }
    },
    onFieldSubmitted: (value){
      if(onsitmmed != null)
      {
        onsitmmed(value);
      }
    },
    controller: controller_field,
    decoration: InputDecoration(
        prefixIcon: Icon(
          preffix,
          color: Colors.deepPurple,
        ),

        suffixIcon: IconButton(
            onPressed: ()
            {
              if(function != null )
                {
                   function();
                }
            }


          , icon: Icon(suffix),

        ),
        labelText: title,
        labelStyle: TextStyle(

        ),
        border: InputBorder.none
    ),
  ),
);

Widget divider_build( ) => Expanded(child: Divider(
         color: Color(0xFFD9D9D9),
         height: 1.5,
));

 enum toast_stata  { Success,error, warming}

Color choose_color(toast_stata state)
{
        Color color;
           switch(state)
               {
                    case toast_stata.Success:
                      color = Colors.green;
                      break;
                     case toast_stata.error:
                       color = Colors.red;
                       break;
                   case toast_stata.warming:
                     color = Colors.amber;
                     break;
               }

               return color;
}

void toast_screen({required String text , required toast_stata state}) => Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: choose_color(state),
    textColor: Colors.white,
    fontSize: 16.0
);