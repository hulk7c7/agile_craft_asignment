import 'package:agile_craft_asignment/backend/localDB/localStorage.dart';
import 'package:agile_craft_asignment/backend/network/api_urls.dart';
import 'package:agile_craft_asignment/backend/network/request_methods.dart';
import 'package:agile_craft_asignment/presentation/authentication/models/auth_model.dart';
import 'package:agile_craft_asignment/presentation/home/pages/displayProducts.dart';
import 'package:agile_craft_asignment/utils/globalFunctions.dart';
import 'package:agile_craft_asignment/utils/globalStrings.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Username/Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
                onChanged: (value){
                  email.value = value;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.lock),
                ),
                onChanged: (value){
                  pass.value = value;
                },
              ),
              SizedBox(height: 30),
              (isLoading.value) ?
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async{
                    if(email.value.isEmpty || pass.value.isEmpty) {
                      const snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        behavior: SnackBarBehavior.floating,
                        content: AwesomeSnackbarContent(
                          title: 'Oh Hey!!',
                          message:
                          'Please enter valid email and password',
                          contentType: ContentType.warning,
                          inMaterialBanner: true,
                        ),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                      isLoading.value = true;
                      return;
                    }
                    isLoading.value = false;
                    print('Email: ${email.value}, Password: ${pass.value}');
                    print(APIUrls.login);
                    await ApiService().postRequest(context: context, targetUrl: APIUrls.login,
                            headers: GlobalStrings.loginHeader,
                            body: {
                              'userNameOrEmailAddress': email.value,
                              'password': pass.value,
                            }, statusCode: 200).then((onValue){
                              //print('>>>>> $onValue');
                          user = onValue;
                          if(onValue == null) isLoading.value = true;
                        });
                    print('>>>>> $user');
                    if (user != null && user?['success']) {
                      Auth auth = Auth.fromJson(user!);
                      SetUserLocalStorageV2().userId(auth.result.userId.toString());
                      SetUserLocalStorageV2().isLogin(true);
                      SetUserLocalStorageV2().accessToken(auth.result.accessToken.toString());
                      SetUserLocalStorageV2().refreshToken(auth.result.refreshToken.toString());

                      print(GetUserLocalStorageV2().userId());
                      print(GetUserLocalStorageV2().accessToken());
                      print(GetUserLocalStorageV2().refreshToken());

                      const snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        behavior: SnackBarBehavior.floating,
                        content: AwesomeSnackbarContent(
                          title: 'Welcome Back!',
                          message:
                          "It's always great to see you.",
                          contentType: ContentType.success,
                          inMaterialBanner: true,
                        ),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => ProductShowcase()),
                      );
                    } else {
                      isLoading.value = true;
                      print('>>>>>>>>>>');
                      SnackBar(content: Text('Something went wrong, please try again later!'));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ) :
              CircularProgressIndicator(color: Colors.green,),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
