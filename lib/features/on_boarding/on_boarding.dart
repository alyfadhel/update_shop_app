import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/core/service/servic_locator.dart';
import 'package:shop_now/core/utils/widgets/my_textButton.dart';
import 'package:shop_now/features/login/presentation/screens/login.dart';
import 'package:shop_now/features/on_boarding/model/on_boarding_model.dart';
import 'package:shop_now/features/on_boarding/widgets/build_on_boarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

var boardingController = PageController();
bool isLast = false;

void onSubmit(context)
{
  sl<SharedPreferences>().setBool('onBoarding', true).then((value)
  {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MyTextButton(
            onPressedTextButton: ()
            {
              onSubmit(context);
            },
            text: 'Skip',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 750.0,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemBuilder: (context, index) =>
                      BuildOnBoarding(model: boarding[index]),
                  controller: boardingController,
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      isLast = false;
                    }
                  },
                  itemCount: boarding.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardingController,
                      count: boarding.length,
                      axisDirection: Axis.horizontal,
                      effect: const SlideEffect(
                          spacing: 4.0,
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          strokeWidth: 1.5,
                          dotColor: Colors.grey,
                          activeDotColor: Colors.indigo),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        if (isLast) {
                          onSubmit(context);
                        }
                        boardingController.nextPage(
                          duration: const Duration(
                            milliseconds: 600,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      },
                      child: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
