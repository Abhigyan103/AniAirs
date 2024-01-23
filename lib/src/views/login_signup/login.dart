import 'package:AniAirs/src/core/utils/login_button/login_button.dart';
import 'package:AniAirs/src/core/utils/text_fields/login_field.dart';
import 'package:AniAirs/src/views/login_signup/signup.dart';
import 'package:AniAirs/src/views/main_page/main_page.dart';
import 'package:AniAirs/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                    child: SizedBox(
                        height: 109,
                        width: double.infinity,
                        child: Image(
                            image: AssetImage("assets/logos/animu_logo.png")))),
                const SizedBox(
                  height: 44,
                ),
                Center(
                    child: Text(
                  "LOGIN",
                  style: Theme.of(context).textTheme.displayMedium,
                )),
                const SizedBox(
                  height: 22,
                ),
                const LoginField(
                  hintText: "Enter username",
                  prefixIcon: CupertinoIcons.profile_circled,
                ),
                const SizedBox(
                  height: 22,
                ),
                const LoginField(
                  hintText: "Enter Password",
                  prefixIcon: CupertinoIcons.lock_fill,
                  showPasswordSuffix: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:7),
                  child: SizedBox(
                    width:MediaQuery.of(context).size.width/1.1,
                    child: ElevatedButton(onPressed:(){},
                        style:ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16),
                         backgroundColor: MyColors.lightMarineBlue,
                         shape: RoundedRectangleBorder(
                           borderRadius:  BorderRadius.circular(11),
                         )
                        ),
                        child:Text('Login',style: TextStyle(
                            fontFamily: 'League Spartan',
                          fontSize: 30
                        ),)

                    ),
                  ),
                ),
                Center(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: MyColors.lightMarineBlue,
                            fontSize: 16,
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ))),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",style: TextStyle(color: Color(0xFFBBBBBB),
                  fontSize: 16,
                  fontFamily: 'League Spartan',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Signup()),
                          );

                        },
                        child: Text(
                          "Signup",
                          style: TextStyle(
                            color: MyColors.lightMarineBlue,
                            fontSize: 16,
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )),

                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text("OR",style: TextStyle(color: Color(0xFFBBBBBB),
                    fontSize: 20,
                    fontFamily: 'League Spartan',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),),
                ),
                const SizedBox(
                  height: 11,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 69,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: MyColors.lightShadowBlack,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.google,
                          color: MyColors.lightMarineBlue,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Signup with Google',
                          style: TextStyle(
                            color: Color(0xFFBBBBBB),
                            fontSize: 16,
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 69,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: MyColors.lightShadowBlack,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.facebook,
                          color: MyColors.lightMarineBlue,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Signup with Facebook',
                          style: TextStyle(
                            color: Color(0xFFBBBBBB),
                            fontSize: 16,
                            fontFamily: 'League Spartan',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.next_plan),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          }),
    );
  }
}
