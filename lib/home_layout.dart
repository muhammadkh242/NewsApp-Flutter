import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cubit/cubit.dart';
import 'package:news/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getHomeNews(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = AppCubit.get(context);
/*          DioHelper.getNews(url: "v2/top-headlines", query: {
            'country': 'us',
            'category': 'general',
            'apiKey': 'a1c2f37b0a744dcf9026ae1e1bcee545'
          }).then((value)
          {
            print(value);
          });*/
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'News',
              ),
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
      ),
    );
  }
}
