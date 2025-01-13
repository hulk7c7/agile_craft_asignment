

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductShowcase extends HookConsumerWidget {
  const ProductShowcase({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // useEffect(() {
    //   Future.microtask((){
    //
    //   });
    //   return null;
    // },[]);


    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf2f5fc),
        centerTitle: true,
        title: Text(
          "Product Display",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
      ),
      backgroundColor: Color(0xFFffffff),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          // Return your widget for the current index
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    ));
  }
}
