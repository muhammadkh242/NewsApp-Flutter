import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state){},
      builder: (BuildContext context, state){
        var list = AppCubit.get(context).sportsNews;
        return buildScreen(list);
      },
    );  }
}
