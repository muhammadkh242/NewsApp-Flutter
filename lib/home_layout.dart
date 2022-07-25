import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {

        var cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'News',
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
                onPressed: ()
                {
                  cubit.changeAppTheme(fromMain: false);
                },
              ),

            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.bottomNavIndex,
            onTap: (index) {
              cubit.navigateBottomNavScreen(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business_center),
                label: "Business",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_baseball_outlined),
                label: "Sports",
              ),
            ],
          ),
          body: cubit.pages[cubit.bottomNavIndex],
        );
      },
    );
  }
}
