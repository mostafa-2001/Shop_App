import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/search_model.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';

class Search_Screen extends StatelessWidget {
  var search_controller = TextEditingController();
  var form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<APP_cubit, states>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: form_key,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: search_controller,
                      onFieldSubmitted: (value) {
                        APP_cubit.get(context).Get_Search_Data(value);
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please Enter Value';
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    if (APP_cubit.get(context).search_model == null)
                      LinearProgressIndicator()
                    else
                      Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) => buildSearchitem(
                                APP_cubit.get(context)
                                    .search_model!
                                    .data
                                    .data[index],
                                context),
                            separatorBuilder: (context, index) =>
                                divider_build(),
                            itemCount: APP_cubit.get(context)
                                .search_model!
                                .data
                                .data
                                .length),
                      )
                  ],
                ),
              ),
            ));
      },
    );
  }

  Widget buildSearchitem(Search_Data_List model, context) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
          height: 150,
          child: Row(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image(
                    image: NetworkImage(model.image),
                    width: 120,
                    height: 120,
                  ),

                ],
              ),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${model.name}',
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
                            model.price.toString(),
                            style:
                                TextStyle(fontSize: 12, color: Colors.deepPurple),
                          ),
                          SizedBox(
                            width: 14,
                          ),

                          Spacer(),
                        ],
                      )
                    ],
                  ),
                ),

            ],
          ),
        ),
  );
}
