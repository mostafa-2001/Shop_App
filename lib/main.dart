import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/shop_layout.dart';
import 'package:shop_app/modules/login/body.dart';
import 'package:shop_app/modules/onboarding/onboarding.dart';
import 'package:shop_app/shared/bloc_observer.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/local/shared_perfercence.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/style/themes/theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await cacheHelper.initi();
  Bloc.observer = MyBlocObserver();
  Dio_helper.init();
  dynamic onboarding = cacheHelper.Getdata(key: 'onboarding');
  token = cacheHelper.Getdata(key: 'token');
  Widget widget;
  if(onboarding != null)
    {
      if(token != null)
        {
           widget = Shop_Layout();
        }else{
          widget = Body();
      }
    }else{
      widget = OnBoarding();
  }

   runApp(MyAPP(start_widget: widget));
}

class MyAPP extends StatelessWidget {
  final Widget start_widget;

  const MyAPP({ required this.start_widget}) ;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
             create: (context) => APP_cubit()..Home_Getdata()..Categorites_Getdata()..Get_Favorites_Screen()..Get_Setting_Screen(),
      child: BlocConsumer<APP_cubit,states>(
           listener: (context,state) {},
           builder: (context,state){
             return MaterialApp(
               debugShowCheckedModeBanner: false,
               theme: lighttheme,
               darkTheme: darktheme,
               themeMode: ThemeMode.light,
               home: start_widget,
             );
           },
      ),
    );

  }
}
