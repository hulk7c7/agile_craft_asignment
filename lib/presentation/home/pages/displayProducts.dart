

import 'package:agile_craft_asignment/presentation/addProduct/pages/addProduct_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
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
      body: ListView.builder(
        itemCount: 10,
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
                  Icon(Icons.production_quantity_limits_sharp, color: Colors.green,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Item $index', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                        Text('This is description.'*5, style: TextStyle(fontSize: 14.0)),
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
                            
                          },
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
    ));
  }
}
