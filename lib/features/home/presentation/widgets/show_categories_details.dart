import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/features/home/domain/entities/categories_details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

var imageController = PageController();
var carouselController = CarouselController();
int current =0;
class ShowCategoriesDetails extends StatefulWidget {
  final DataDetailsItem dataDetailsItem;

  const ShowCategoriesDetails({Key? key, required this.dataDetailsItem})
      : super(key: key);

  @override
  State<ShowCategoriesDetails> createState() => _ShowCategoriesDetailsState();
}

class _ShowCategoriesDetailsState extends State<ShowCategoriesDetails> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: widget.dataDetailsItem.images.map(
                      (e) =>Image(
                    width: double.infinity,
                    fit: BoxFit.contain,
                    image: NetworkImage(e),
                  ),
                ).toList(),
                options: CarouselOptions(
                  height: 400,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                )),
            const SizedBox(
              height: AppSize.s10,
            ),
            Text(
              widget.dataDetailsItem.price.round().toString(),
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorManager.bTwitter
              ),
            ),
            const SizedBox(
              height: AppSize.s10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSmoothIndicator(
                  activeIndex: current,
                  count: widget.dataDetailsItem.images.length,
                  effect: const JumpingDotEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    jumpScale: .7,
                    verticalOffset: 20,
                    activeDotColor: Colors.indigo,
                    dotColor: Colors.grey,
                  ),
                  onEnd: ()
                  {
                    current = 0;
                  },
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            Text(
              widget.dataDetailsItem.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
