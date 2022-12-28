import 'package:flutter/material.dart';
import 'package:shop_now/core/error/failure.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/features/categories/presentation/screens/show_categories_details_screen.dart';
import 'package:shop_now/features/home/domain/entities/categories.dart';

class CategoriesWidget extends StatelessWidget {
  final DataItem model;

  const CategoriesWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Row(
        children: [
          Container(
            width: AppSize.s120,
            height: AppSize.s120,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.3),
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                image: NetworkImage(
                  model.image.toString(),
                ),
                onError: (exception, stackTrace) {
                   const Text(
                     'ooops Error With Image Not Found',
                   );
                },
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s30,
          ),
          Text(
            model.name.toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ShowCategoriesDetailsScreen(id: model.id),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
        ],
      ),
    );
  }
}
