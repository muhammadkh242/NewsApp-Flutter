import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state){},
      builder: (BuildContext context, state){
        var list = AppCubit.get(context).homeNews;
        return ConditionalBuilder(
            condition: list.isNotEmpty,
            builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return buildNewsItem(list[index]);
            },
            separatorBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 2.0,
                  color: Colors.grey[300],
                ),
              );
            },
            itemCount: list.length
            ),
            fallback: (context) => const Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
