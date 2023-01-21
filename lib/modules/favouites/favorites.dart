import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/favorites.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';

class Favorites_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<APP_cubit, states>(
        builder: (context, state) {
          return state is Favorites_Get_loading
              ? Center(child: CircularProgressIndicator())
              : ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildfavitem(APP_cubit.get(context).get_modelfav!.data.data[index], context),
                  separatorBuilder: (context, index) => divider_build(),
                  itemCount: APP_cubit.get(context).get_modelfav!.data.data.length);
        },
        listener: (context, state) {});
  }

  Widget buildfavitem( Data_Favorites_List model , context) => Container(
        height: 150,
        child: Row(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image(
                  image: NetworkImage(
                      model.product.image
                         ),
                  width: 120,
                  height: 120,
                ),
                if (model.product.discount != 0)
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'DISCOUNT',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${model.product.name}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, height: 1.3),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          model.product.price.toString(),
                          style:
                              TextStyle(fontSize: 12, color: Colors.deepPurple),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        if (model.product.discount != 0)
                          Text(
                            model.product.old_price.toString(),
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough),
                          ),
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: APP_cubit.get(context).favorite[model.product.id] ? Colors.deepPurple : Colors.white,
                          child: IconButton(
                              onPressed: () {
                                APP_cubit.get(context).change_favorite_screen(model.product.id);
                              },
                              icon: Icon(
                                Icons.favorite_border,
                                color: Colors.grey,
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
