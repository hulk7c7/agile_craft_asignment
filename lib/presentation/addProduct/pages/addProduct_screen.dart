

import 'package:agile_craft_asignment/utils/globalWidgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddProductScreen extends HookConsumerWidget {
  const AddProductScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSwitched = useState(false);

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

              },
            ),
            SizedBox(height: 20),
            customTextFormField(
              maxLines: 6,
              labelText: 'Description',
              prefixIcon: Icons.details_sharp,
              onChanged: (String v) {

              },
            ),
            SizedBox(height: 40),
            //(isLoading.value) ?
            customElevatedButton(
                text: 'Add Product',
                onPressed: () {

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
