import 'dart:developer';

import 'package:daza_store_commerce/features/auth/Signup/view/signup_view.dart';
import 'package:daza_store_commerce/features/onboarding/onboarding_viewmodel.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stacked/stacked.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewmodel>.reactive(
      viewModelBuilder: () => OnboardingViewmodel(),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, model, child) {
        return Scaffold(
          // extendBodyBehindAppBar: true,
          appBar: model.isGettingStarted
              ? AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  actions: [
                    TextButton(
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Color(0xFFF8B057),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        model.navigateToSignUp();
                      },
                    ),
                  ],
                )
              : null,
          body: SafeArea(
            top: false,
            bottom: false,
            child: !model.isGettingStarted
                ? welcomeScreen(context, model)
                : onboardingScreen(context, model),
          ),
        );
      },
    );
  }

  Widget welcomeScreen(BuildContext context, OnboardingViewmodel model) {
    // PageController controller = PageController(initialPage: 0);

    return Column(
      children: [
        // Expanded(
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/welcome_screen_bg.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // ),
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  text: 'Your',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: ' Personal Fashion App',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF401900),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'for Every Occasion',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "ummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Color(0xFF242424)),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Button(
                  label: 'Let\'s Get Started',
                  onPressed: () {
                    model.onGetStarted();
                  },
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          model.navigateToSignIn();
                        },
                      text: 'Sign In',
                      style: TextStyle(
                        color: Color(0xFF401900),
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget onboardingScreen(BuildContext context, OnboardingViewmodel model) {
    return Stack(
      children: [
        PageView(
          controller: model.controller,
          onPageChanged: (value) => model.onPageChanged(value),
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/lottie/slide_one.json',
                          width: 350,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'Where Fashion Meets',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Effortless Shopping',
                          style: TextStyle(
                            color: Color(0xFF401900),
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod consequat.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/lottie/slide_two.json',
                          width: 350,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'Your Personal Collection',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Of ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                            children: [
                              TextSpan(
                                text: 'Favorite Styles',
                                style: TextStyle(color: Color(0xFF401900)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod consequat.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Lottie.asset(
                          'assets/lottie/slide_three.json',
                          width: 350,
                          height: 350,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          'From Cart to Doorstep:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Fashion Delivered Fast',
                          style: TextStyle(
                            color: Color(0xFF401900),
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod consequat.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            //
          ],
        ),

        Positioned(
          bottom: 40,
          right: 30,
          left: 30,
          child: Row(
            children: [
              AnimatedOpacity(
                opacity: model.currentPage > 0 ? 1 : 0,
                duration: Duration(microseconds: 300),
                child: GestureDetector(
                  onTap: () {
                    model.previous();
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Color(0xFF401900),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
              Spacer(),
              SmoothPageIndicator(
                controller: model.controller,
                count: 3,
                effect: WormEffect(
                  dotColor: Colors.amber.shade50,
                  activeDotColor: Color(0xFFF8B057),
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (model.currentPage == 2) {
                    model.navigateToSignUp();
                  }
                  model.next();
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFF401900),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
