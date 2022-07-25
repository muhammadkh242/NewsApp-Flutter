import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var list = AppCubit.get(context).homeNews;
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                  label: Text("Search"),
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.search),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "search must not be Empty";
                  }
                  return null;
                },
                onChanged: (String value)
                {
                  AppCubit.get(context).getSearchNews(searchValue: value);
                },
              ),
            ),
            Expanded(child: buildScreen(list)),
          ],
        );
      },
    );
  }
}
