

import 'dart:convert';

import 'package:agile_craft_asignment/backend/network/api_urls.dart';
import 'package:agile_craft_asignment/backend/network/request_methods.dart';
import 'package:agile_craft_asignment/presentation/addProduct/pages/addProduct_screen.dart';
import 'package:agile_craft_asignment/presentation/home/models/product_model.dart';
import 'package:agile_craft_asignment/presentation/updateProduct/pages/updateProduct_screen.dart';
import 'package:agile_craft_asignment/utils/globalStrings.dart';
import 'package:agile_craft_asignment/utils/globalWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';



class ProductShowcase extends HookConsumerWidget {
  const ProductShowcase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final products = useState<ProductList>(ProductList(products: []));

    useEffect(() {
      Future.microtask((){
        ApiService().getRequest(
            targetUrl: APIUrls.getProduct,
            context: context,
            headers: GlobalStrings.header
        ).then((onValue){
          if(onValue!=null) products.value = onValue;
        });
      });
      return null;
    },[]);

    Future<void> _onRefresh() async{
      await ApiService().getRequest(
          targetUrl: APIUrls.getProduct,
          context: context,
          headers: GlobalStrings.header
      ).then((onValue){
        if(onValue!=null) products.value = onValue;
      });
    }


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
        actions: [
          IconButton(
            icon: Icon(Icons.logout_outlined, color: Colors.black87,),
            onPressed: () {
              // Handle search button press
              showLogoutDialog(context);
            },
          ),
        ],
      ),
      backgroundColor: Color(0xFFffffff),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductScreen()),
          );
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add_box_outlined, size: 24.0, color: Colors.white,),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: products.value.products.length,
          itemBuilder: (BuildContext context, int index) {
            // Return your widget for the current index
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white, // Optional: background color
                  border: Border.all(
                    color: Colors.blue, // Color of the border
                    width: 1.0, // Width of the border
                  ),
                  borderRadius: BorderRadius.circular(12.0), // Rounded corners
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.production_quantity_limits_sharp, color: (products.value.products[index].isAvailable) ? Colors.green : Colors.red,),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${products.value.products[index].name}', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                          Text('${products.value.products[index].description}', style: TextStyle(fontSize: 14.0)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50.0, // Control the width of the trailing widget
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(), // Add content here if needed
                          Bounce(
                            onPressed: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => UpdateProductScreen(
                                      id: products.value.products[index].id.toString(),
                                      name: products.value.products[index].name,
                                      description: products.value.products[index].description,
                                      isSwitched: products.value.products[index].isAvailable
                                  ), // Replace with your actual screen widget
                                ),
                              );                            },
                            duration: Duration(milliseconds: 110),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white, // Optional: background color
                                border: Border.all(
                                  color: Colors.blue, // Color of the border
                                  width: 2.0, // Width of the border
                                ),
                                borderRadius: BorderRadius.circular(12.0), // Rounded corners
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Icon(Icons.edit_note_sharp),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }
}
