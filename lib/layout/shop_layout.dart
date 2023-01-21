import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/search/search.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';

class Shop_Layout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<APP_cubit,states>(
          listener: (context,state){},
          builder: (context,state){
            APP_cubit cubit = APP_cubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title:  Text(
                    'Online Shop'
                ),
                actions: [
                    IconButton(
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => Search_Screen()));
                        },
                        icon: Icon(
                           Icons.search
                        ))
                ],
              ),
              body: cubit.Screens[cubit.Current_index],
              bottomNavigationBar: BottomNavigationBar(
                onTap: (index)
                {
                  cubit.change_Screen(index);
                },
                currentIndex: cubit.Current_index,

                items: [
                  BottomNavigationBarItem(icon: Icon(
                         Icons.home
                  ),
                  label: 'Home'
                  ),
                  BottomNavigationBarItem(icon: Icon(
                      Icons.category
                  ),
                      label: 'Categorites'
                  ),
                  BottomNavigationBarItem(icon: Icon(
                      Icons.favorite
                  ),
                      label: 'Favorite'
                  ),
                  BottomNavigationBarItem(icon: Icon(
                      Icons.settings
                  ),
                      label: 'Settings'
                  )
                ],

              ),
            );
          },

    );
  }
}
