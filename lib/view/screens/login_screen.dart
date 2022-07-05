import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ropstam_task/controller/login_controller.dart';
import 'package:ropstam_task/view/screens/home_screen.dart';
import 'package:ropstam_task/view/widgets/custom_password_textfield.dart';
import 'package:ropstam_task/view/widgets/custom_text.dart';
import 'package:ropstam_task/view/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginController controller;

  @override
  void initState() {
    try{
      controller = Get.find();
    }catch(E){
      controller = Get.put(LoginController());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    return GetBuilder<LoginController>(

         builder: (_) => Scaffold(
             body: SafeArea(
          child: Stack(
            children: [
              Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient:  LinearGradient(colors: [
                        const Color(0xFFC5E8B7).withOpacity(0.5),
                        const Color(0xFFFFFDD1).withOpacity(0.5),
                        const Color(0xFFC5E8B7).withOpacity(0.5)]
                      ),
                    ),
                  )),
              Center(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: width * 0.8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      CustomText(text: 'Hello Again!',fontWeight: FontWeight.bold,size: 35,),
                      CustomText(text: 'Chance to get your \n life better',fontWeight: FontWeight.w400,size: 20,textAlign: TextAlign.center,),
                      SizedBox(height: height * 0.05,),
                        SizedBox(
                          height: 50,
                          child: CustomTextField(
                            hintText: 'Enter your email',
                            controller: controller.emailController,
                            isValidator: true,
                            validatorMessage: 'Please Enter your email',
                            textInputType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: height * 0.03,),
                        SizedBox(
                          height: 50,
                          child: CustomPasswordTextField(
                            hintText: 'Enter your password',
                            controller: controller.passController,
                          ),
                        ),
                        SizedBox(height: height * 0.03,),
                        Row(children: [
                          const Spacer(),
                          CustomText(text: 'Recovery Password',),
                        ],),
                        SizedBox(height: height * 0.04,),
                        InkWell(
                          onTap: ()async{
                            FocusScope.of(context).unfocus();
                            controller.isLoading = true;
                            await controller.loginMethod(controller.emailController.text, controller.passController.text);
                            if(controller.status == 200){
                              Get.off(()=>const HomeScreen());
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(17)
                            ),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const SizedBox(),
                                Center(child: CustomText(text: 'Login',color: Colors.white,size: 15,)),
                                controller.isLoading ? const SizedBox(height: 20,width:20,child: CircularProgressIndicator(color: Colors.white,)) :
                                const SizedBox()
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03,),
                        CustomText(text: 'or continue with',color: Colors.black,fontWeight: FontWeight.normal),
                        SizedBox(height: height * 0.03,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Colors.white,
                                    width: 2
                                )
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/icons/google.png'),
                                )
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Colors.white,
                                    width: 2
                                )
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/icons/apple.png'),
                                )
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.transparent,
                                border: Border.all(
                                    color: Colors.white,
                                    width: 2
                                )
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/icons/facebook.png'),
                                )
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.055,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Not a member?',
                            ),
                            CustomText(
                              text: 'Register now',
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        )
                      ],),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
