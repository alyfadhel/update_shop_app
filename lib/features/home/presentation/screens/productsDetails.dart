import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/core/layout/cubit/cubit.dart';
import 'package:shop_now/core/layout/cubit/states.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/core/service/service_locator.dart';
import 'package:shop_now/features/home/domain/entities/home.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

var imageController = PageController();
var carouselController = CarouselController();
int current =0;

class ProductsDetails extends StatefulWidget {
  final Products products;
  final int id;

  const ProductsDetails({Key? key, required this.products,required this.id}) : super(key: key);

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>sl<HomeCubit>()..getProductsDetails(id: widget.id),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: ConditionalBuilder(
                condition: state is! GetProductsDetailsLoadingState,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CarouselSlider(
                            items: widget.products.images.map(
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
                          widget.products.price.round().toString(),
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
                              count: widget.products.images.length,
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
                          widget.products.description,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
            ),
          );
        },
      ),
    );
  }
}

