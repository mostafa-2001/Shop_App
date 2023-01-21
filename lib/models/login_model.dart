import 'package:shop_app/main.dart';

class Login_Model
{
   late bool status;
   late String message;
   User_Data? data;

   Login_Model.formjson(Map<String,dynamic> json){

           status = json['status'] ;
           message = json['message'] ;
           data = json['data'] != null ? User_Data.formjson(json['data']) : null;

   }
}


class User_Data
{
   late int id;
   late String name;
   late String email;
   late String phone;
   late String image;
   late int points;
   late int credit;
   late String token;

       User_Data.formjson(Map<String,dynamic> json)
       {
         id = json['id'];
         name = json['name'] ;
         email = json['email'] ;
         phone = json['phone'] ;
         image = json['image'] ;
         points = json['points'] ;
         credit = json['credit'] ;
         token = json['token'] ;
       }

}