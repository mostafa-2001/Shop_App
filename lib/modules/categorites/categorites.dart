import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categorites_model.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';

class Categorites_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<APP_cubit,states>(
        builder: (context,state){
           return ListView.separated(
               physics: BouncingScrollPhysics(),
               itemBuilder: (context,index) => buildcatitem(APP_cubit.get(context).categoritesdata!.data.data[index]),
               separatorBuilder: (context,index) => divider_build(),
               itemCount: APP_cubit.get(context).categoritesdata!.data.data.length);
        }
        , listener: (context,state){});
  }

  Widget buildcatitem(Data_Categorites_List model) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Image(
          image:NetworkImage(
           model.image,

          ),
          height: 90,
          width: 90,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          model.name,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),
        ),
        Spacer(),
        Icon(
            Icons.arrow_forward_outlined
        )
      ],
    ),
  );
}
