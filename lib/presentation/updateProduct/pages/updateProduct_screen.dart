

import 'package:agile_craft_asignment/backend/network/api_urls.dart';
import 'package:agile_craft_asignment/backend/network/request_methods.dart';
import 'package:agile_craft_asignment/presentation/home/pages/displayProducts.dart';
import 'package:agile_craft_asignment/utils/globalStrings.dart';
import 'package:agile_craft_asignment/utils/globalWidgets.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UpdateProductScreen extends HookConsumerWidget {
  final String id;
  final String name;
  final String description;
  final bool isSwitched;

  const UpdateProductScreen({
    Key? key,
    required this.id,
    required this.name,
    required this.description,
    required this.isSwitched,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final idController = TextEditingController(text: id);
    final switchController = useState(isSwitched);
    final nameController = TextEditingController(text: name);
    final descriptionController = TextEditingController(text: description);

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFf2f5fc),
            centerTitle: true,
            title: Text(
              "Update Product",
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
                customTextFormField2(
                  enabled: false,
                  controller: idController,
                  labelText: 'ID',
                  prefixIcon: Icons.dashboard_outlined,
                  keyboardType: TextInputType.number,
                  onChanged: (String v) {
                    //id.value = v;
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
                      value: switchController.value,
                      onChanged: (value) {
                        switchController.value = value;
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                customTextFormField2(
                  controller: nameController,
                  labelText: 'Name',
                  prefixIcon: Icons.person_2_outlined,
                  onChanged: (String v) {
                    //name.value = v;
                  },
                ),
                SizedBox(height: 20),
                customTextFormField2(
                  controller: descriptionController,
                  maxLines: 6,
                  labelText: 'Description',
                  prefixIcon: Icons.details_sharp,
                  onChanged: (String v) {
                    //description.value = v;
                  },
                ),
                SizedBox(height: 40),
                //(isLoading.value) ?
                customElevatedButton(
                    text: 'Update Product',
                    onPressed: () async{
                      await ApiService().postRequest(
                        targetUrl: APIUrls.addProduct,
                        context: context,
                        headers: GlobalStrings.header,
                        statusCode: 200,
                        body: {
                          "tenantId": 10,
                          "name": nameController.text,
                          "description": descriptionController.text,
                          "isAvailable": switchController.value,
                          "id": idController.text
                        },
                      ).then((onValue) async{
                        print(onValue);
                        showCustomSnackBar(
                          context: context,
                          title: 'Product Details Updated!',
                          message: "Your product details have been updated.",
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
