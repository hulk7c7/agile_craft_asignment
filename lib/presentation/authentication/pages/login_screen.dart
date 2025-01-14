import 'package:agile_craft_asignment/backend/localDB/localStorage.dart';
import 'package:agile_craft_asignment/backend/network/api_urls.dart';
import 'package:agile_craft_asignment/backend/network/request_methods.dart';
import 'package:agile_craft_asignment/presentation/authentication/models/auth_model.dart';
import 'package:agile_craft_asignment/presentation/home/pages/displayProducts.dart';
import 'package:agile_craft_asignment/utils/globalFunctions.dart';
import 'package:agile_craft_asignment/utils/globalStrings.dart';
import 'package:agile_craft_asignment/utils/globalWidgets.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Authentication extends HookConsumerWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final Size size = GlobalFunctions.getSize(context);

    final email = useState("");
    final pass = useState("");

    final isLoading = useState(true);

    Map<String, dynamic>? user;


    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Great To See You!',
                style: TextStyle(
                  fontSize: size.height * 0.04,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Sign in to continue',
                style: TextStyle(
                  fontSize: size.height * 0.017,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 40),
              customTextFormField(
                labelText: 'Username/Email',
                prefixIcon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                onChanged: (String v) {
                  email.value = v;
                },
              ),
              SizedBox(height: 20),
              customTextFormField(
                obscureText: true,
                labelText: 'Password',
                prefixIcon: Icons.lock,
                onChanged: (String v) {
                  pass.value = v;
                },
              ),
              SizedBox(height: 30),
              (isLoading.value) ?
              customElevatedButton(
                  text: 'Sign In',
                  onPressed: () async{

                    if(await GlobalFunctions.internetIsConnected(context) == false) return;

                    if(email.value.isEmpty || pass.value.isEmpty) {
                      showCustomSnackBar(
                        context: context,
                        title: 'Oh Hey!!',
                        message: 'Please enter valid email and password',
                        contentType: ContentType.warning,
                      );
                      isLoading.value = true;
                      return;
                    }
                    isLoading.value = false;
                    await ApiService().postRequest(context: context, targetUrl: APIUrls.login,
                        headers: GlobalStrings.loginHeader,
                        body: {
                          'userNameOrEmailAddress': email.value,
                          'password': pass.value,
                        },
                        statusCode: 200,
                        purpose: "login"
                    ).then((onValue){
                      user = onValue;
                      if(onValue == null) isLoading.value = true;
                    });

                    if (user != null && user?['success']) {
                      Auth auth = Auth.fromJson(user!);
                      SetUserLocalStorageV2().userId(auth.result.userId.toString());
                      SetUserLocalStorageV2().isLogin(true);
                      SetUserLocalStorageV2().accessToken(auth.result.accessToken.toString());
                      SetUserLocalStorageV2().refreshToken(auth.result.refreshToken.toString());

                      showCustomSnackBar(
                        context: context,
                        title: 'Welcome Back!',
                        message: "It's always great to see you.",
                        contentType: ContentType.success,
                      );

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ProductShowcase()),
                      );
                    } else {
                      isLoading.value = true;
                      showCustomSnackBar(
                        context: context,
                        title: 'Invalid credentials!',
                        message: "Please check your username/password.",
                        contentType: ContentType.failure,
                      );
                    }
                  }) :
              CircularProgressIndicator(color: Colors.green,),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
