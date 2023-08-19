import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football/bloc/App_bloc/cubit.dart';
import 'package:football/bloc/App_bloc/states.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {

      },
      builder:(context, state) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          currentIndex: AppCubit.get(context).currentIndex,
          onTap:(index) {
            AppCubit.get(context).onTap(index);
          },
          items:AppCubit.get(context).items
        ),
        body: AppCubit.get(context).screen[AppCubit.get(context).currentIndex],
      ),
    );
  }
}
