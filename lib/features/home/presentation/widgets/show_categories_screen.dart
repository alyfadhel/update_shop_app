import 'package:flutter/material.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/features/home/domain/entities/categories.dart';
import 'package:shop_now/features/home/presentation/screens/categorie_details.dart';

class ShowCategories extends StatelessWidget {
  final DataItem model;

  const ShowCategories({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoriesDetailsScreen(
              id: model.id,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  width: AppSize.s120,
                  height: AppSize.s120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(model.image.toString()),
                    ),
                  ),
                ),
                Container(
                  width: AppSize.s150,
                  decoration: BoxDecoration(
                    color: ColorManager.bBlack.withOpacity(.4),
                  ),
                  child: Text(
                    model.name.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: ColorManager.sWhite,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
