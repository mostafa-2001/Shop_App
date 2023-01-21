class Change_Favorite{

   late bool status;
   late String message;

   Change_Favorite.fromjson(Map<String,dynamic> json)
   {
      status = json['status'];
      message = json['message'];
   }
}