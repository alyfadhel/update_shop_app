import 'package:flutter/material.dart';
import 'package:shop_now/core/layout/cubit/cubit.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/features/favorites/domain/entities/favorites.dart';

class BuildFavoritesItem extends StatelessWidget {
  final FavoriteDataDetails model;
  const BuildFavoritesItem({Key? key,required this.model}) : super(key: key);

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
              image: DecorationImage(
                image: NetworkImage(
                    model.product.image.toString(),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s10,
          ),
          SizedBox(
            height: 120.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: AppSize.s150,
                  child: Text(
                    model.product.name.toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      model.product.price.round().toString(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: ColorManager.bTwitter
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s10,
                    ),
                    if(model.product.discount!=0)
                      Text(
                        model.product.oldPrice.round().toString(),
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorManager.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),

              ],
            ),
          ),
           const Spacer(),
          IconButton(
            onPressed: () {
              debugPrint(model.product.id.toString());
              HomeCubit.get(context)
                  .changeFavoritesItem(model.product.id);
            },
            icon: CircleAvatar(
              radius: 15.0,
              backgroundColor:
              HomeCubit.get(context).favorites[model.product.id] ==
                  true
                  ? Colors.blue
                  : Colors.grey,
              child: const Icon(
                Icons.favorite_border,
                size: 14.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
