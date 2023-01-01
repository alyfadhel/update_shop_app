import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/core/layout/cubit/cubit.dart';
import 'package:shop_now/core/layout/cubit/states.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/features/notification/presentation/screens/notification.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.notifications)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            elevation: 0.0,
            currentIndex: cubit.currentIndex,
            onTap: (int index) {
              cubit.changeBottomNav(index);
            },
            type: BottomNavigationBarType.fixed,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
