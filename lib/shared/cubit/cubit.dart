import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/Settings_model.dart';
import 'package:shop_app/models/categorites_model.dart';
import 'package:shop_app/models/change_favorite_model.dart';
import 'package:shop_app/models/favorites.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/models/products_model.dart';
import 'package:shop_app/models/register_model.dart';
import 'package:shop_app/models/search_model.dart';
import 'package:shop_app/modules/categorites/categorites.dart';
import 'package:shop_app/modules/favouites/favorites.dart';
import 'package:shop_app/modules/onboarding/onboarding.dart';
import 'package:shop_app/modules/products/productes.dart';
import 'package:shop_app/modules/settings/settings.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/end_point.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
class APP_cubit extends Cubit<states>{
  APP_cubit() : super(initailstate());
  static APP_cubit get(context) => BlocProvider.of(context);
  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  bool last_page = false;
  List<data_model> kill = [
    data_model('boarding1', 'hello w0rld!', 'asset/images/shopping.jpg'),
    data_model('boarding2', 'hello w0rld!', 'asset/images/shopping.jpg'),
    data_model('boarding3', 'hello w0rld!', 'asset/images/shopping.jpg'),
  ];

  void edit_page(int index)
  {
     if(kill.length == index + 1)
       {
         last_page = true;
       }else{
         last_page = false;
     }
     emit(EDIT_Viewpage());
  }

  bool ispassword = true;
  IconData Icon = Icons.visibility;
  void change_passwordicon()
  {
    ispassword = !ispassword;
    Icon = ispassword ?  Icons.visibility : Icons.visibility_off;
    emit(change_iconpassword());
  }


   Login_Model? User_Login;
  void userlogin({required String Email,required String Password})
  {
      emit(Loginsuccesfulloadingstate());
      Dio_helper.postdata(
          path: LOGIN,
          data:{
                'email':Email,
                'password':Password
          }
      ).then((value) {

             User_Login = Login_Model.formjson(value.data);
              emit(Loginsuccesfulstate(User_Login!));
      }).catchError((error){
               print(error.toString());
               emit(Loginerrorstate(error));
      });
  }

  late Resigter_Model Register_model;

  void Regiter_Screen({required String name,required String email,required String password,required String phone})
  {
       emit(Registersuccesfulloadingstate());
       Dio_helper.postdata(
           path: REGISTER,
           data: {

             'name': name,
             'email' : email,
             'password': password,
             'phone': phone
           },
         token: token
       ).then((value) {
            Register_model = Resigter_Model.formjson(value.data);

            emit(Registersuccesfulstate(Register_model));
       }).catchError((error){
           print(error.toString());
           emit(Registererrorstate(error));
       });
  }

  void Updata_screen({required String name , required String email,required String phone})
  {
    emit(Updatesuccesfulloadingstate());
    Dio_helper.putdata(
        path: 'update-profile',
        data: {
            'name' : name,
            'phone' : phone,
            'email' : email,

        },
      token: token
    ).then((value) {
          model = Data_Settings.fromJson(value.data);
          emit(Updatesuccesfulstate(model));

    }).catchError((error){
         emit(Updateerrorstate(error));
    });
  }


  List<Widget> Screens = [Home_Screen(),Categorites_Screen(),Favorites_Screen(),Settings_Screen()];

  int Current_index = 0;

  void change_Screen(int index)
  {
     Current_index = index;
     emit(Change_Screen_layout());
  }

  Home_Model? homemodel;

  Map<int,dynamic> favorite ={};

  void Home_Getdata()
  {
     emit(Homeloadingstate());
     Dio_helper.getdata(path: HOME,token: token).then((value) {
        homemodel = Home_Model.fromJson(value.data);
        homemodel!.data.products.forEach((element){
           favorite.addAll({
               element.id:element.in_favorites
           });
        });
        emit(Homesuccessstate());
     }).catchError(( error){
          print(error.toString());
          emit(Homeerrorstate(error));
     });
  }
  
  Categorites_Model? categoritesdata;
  
  void Categorites_Getdata()
  {
            Dio_helper.getdata(path: CATEGORITES).then((value) {
                    categoritesdata = Categorites_Model.fromjson(value.data);
                    emit(Categoritessuccessstate());
            }).catchError((error){
                    print(error.toString());
                    emit(Categoriteserrorstate(error));
            });
  }

   Change_Favorite? model_fav;

  void change_favorite_screen( int id)
  {
     favorite[id] = !favorite[id];
     emit(FavoritesChangestate());
     Dio_helper.postdata(
         path: FAVORITE,
         token: token,
         data: {
              'product_id' : id
         }
     ).then((value) {
          model_fav = Change_Favorite.fromjson(value.data);
          print(value.data);
          if(!model_fav!.status)
            {
              favorite[id] = !favorite[id];
            }else{
            Get_Favorites_Screen();
          }
          emit(Favoritessuccessstate(model_fav!));
     }).catchError((error){
          favorite[id] = !favorite[id];
          emit(Favoriteserrorstate(error));
     });
  }

 Get_Favorites? get_modelfav;

  void Get_Favorites_Screen()
  {
    emit(Favorites_Get_loading());
     Dio_helper.getdata(
         path: FAVORITE,
         token: token
     ).then((value) {
           get_modelfav = Get_Favorites.fromJson(value.data);
           emit(Favorites_Get_Success());
     }).catchError((error){
         print(error.toString());
         emit(Favorites_Get_error(error));
     });
  }


   late Data_Settings model;

  void Get_Setting_Screen()
  {
    emit(Data_Get_User_Loading());
    Dio_helper.getdata(
        path: PROFILE,
        token: token
    ).then((value) {
      model = Data_Settings.fromJson(value.data);
      emit(Data_Get_User_Success());
    }).catchError((error){
      print(error.toString());
      emit(Data_Get_User_Error(error));
    });
  }

  Search_Model? search_model;

  void Get_Search_Data(String value)
  {
     emit(Search_Data_Loading());
     Dio_helper.postdata(
         path: SEARCH,
         data: {
             'text':value
         },
       token: token
     ).then((value) {
         search_model = Search_Model.fromJson(value.data);
         print(search_model!.data.data[0]);
         emit(Search_Data_Succesfull());
     }).catchError((error){
           print(error.toString());
           emit(Search_Data_Error(error));
     });
  }

}