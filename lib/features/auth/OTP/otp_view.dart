import 'package:daza_store_commerce/features/auth/OTP/otp_viewmodel.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:flutter/material.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:stacked/stacked.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtpViewModel>.reactive(
      viewModelBuilder: () => OtpViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: model.navigateToOtp,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: BoxBorder.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(Icons.arrow_back_ios_sharp, size: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Verify Code',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            'Enter the verification code we sent to',
                            style: TextStyle(
                              color: Color(0xFF242424),
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            'example@email.com',
                            style: TextStyle(
                              color: Color(0xFF401900),
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 50),
                          PinInputTextField(
                            pinLength: 4,
                            decoration: BoxLooseDecoration(
                              strokeColorBuilder: PinListenColorBuilder(
                                Colors.grey.shade200,
                                Colors.grey.shade200,
                              ),
                              bgColorBuilder: PinListenColorBuilder(
                                Colors.grey.shade200,
                                Colors.grey.shade200,
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text('Didn\'t receive OTP?'),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize
                                  .shrinkWrap, // this remove the spaces around the text button
                            ),
                            onPressed: () {},
                            child: Text(
                              'Resend Code',
                              style: TextStyle(
                                color: Color(0xFFF8B057),
                                decoration: TextDecoration.underline,
                                decorationColor: Color(0xFFF8B057),
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          SizedBox(
                            width: double.infinity,
                            child: Button(label: 'Verify', onPressed: () {}),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
