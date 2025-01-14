

import 'package:agile_craft_asignment/backend/network/api_urls.dart';
import 'package:agile_craft_asignment/backend/network/request_methods.dart';
import 'package:agile_craft_asignment/presentation/home/pages/displayProducts.dart';
import 'package:agile_craft_asignment/utils/globalFunctions.dart';
import 'package:agile_craft_asignment/utils/globalStrings.dart';
import 'package:agile_craft_asignment/utils/globalWidgets.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddProductScreen extends HookConsumerWidget {
  const AddProductScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSwitched = useState(false);
    final id = useState("");
    final name = useState("");
    final description = useState("");

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFf2f5fc),
            centerTitle: true,
            title: Text(
              "Add Product",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: Color(0xFFffffff),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 40),
            customTextFormField(
              labelText: 'ID',
              prefixIcon: Icons.dashboard_outlined,
              keyboardType: TextInputType.number,
              onChanged: (String v) {
                id.value = v;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Is Stock Available',
                  style: TextStyle(fontSize: 16.0),
                ),
                Switch(
                  value: isSwitched.value,
                  onChanged: (value) {
                    isSwitched.value = value;
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            customTextFormField(
              labelText: 'Name',
              prefixIcon: Icons.person_2_outlined,
              onChanged: (String v) {
                name.value = v;
              },
            ),
            SizedBox(height: 20),
            customTextFormField(
              maxLines: 6,
              labelText: 'Description',
              prefixIcon: Icons.details_sharp,
              onChanged: (String v) {
                description.value = v;
              },
            ),
            SizedBox(height: 40),
            //(isLoading.value) ?
            customElevatedButton(
                text: 'Add Product',
                onPressed: () async{

                  if(await GlobalFunctions.internetIsConnected(context) == false) return;

                  if(id.value.isEmpty || name.value.isEmpty || description.value.isEmpty) {
                    showCustomSnackBar(
                      context: context,
                      title: 'Provide all information!',
                      message: "Please fill all the gaps.",
                      contentType: ContentType.failure,
                    );
                    return;
                  }

                  await ApiService().postRequest(
                      targetUrl: APIUrls.addProduct,
                      context: context,
                      headers: GlobalStrings.header,
                      statusCode: 200,
                      body: {
                        "tenantId": 10,
                        "name": name.value,
                        "description": description.value,
                        "isAvailable": isSwitched.value,
                        "id": id.value
                      },
                  ).then((onValue) async{
                    print(onValue);
                    showCustomSnackBar(
                      context: context,
                      title: 'New Product Added!',
                      message: "Your new product is now live.",
                      contentType: ContentType.success,
                    );
                    Navigator.pop(context);
                  });

             }),
                //:
            //CircularProgressIndicator(color: Colors.green,),
            SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}
