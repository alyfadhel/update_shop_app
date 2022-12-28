import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/strings_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/features/home/domain/entities/home.dart';
import 'package:shop_now/features/home/presentation/screens/categories_home_screen.dart';
import 'package:shop_now/features/home/presentation/widgets/build_products_item.dart';

class BuilderItem extends StatelessWidget {
  final Home home;

  const BuilderItem({Key? key, required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
              items: home.data.banners
                  .map(
                    (e) => Image(
                      width: double.infinity,
                      fit: BoxFit.fill,
                      image: NetworkImage(e.image),
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                          'ooops Error With Image Not Found',
                        );
                      },
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 250,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                scrollDirection: Axis.horizontal,
              )),
          const SizedBox(
            height: AppSize.s20,
          ),
          const CategoriesHomeScreen(),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1 / 1.8,
            children: List.generate(
              home.data.products.length,
              (index) => BuildProducts(products: home.data.products[index]),
            ),
          ),
        ],
      ),
    );
  }
}
