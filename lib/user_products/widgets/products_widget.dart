import 'package:flutter/material.dart';
import 'package:mira_fitness/constants.dart';

class Products extends StatelessWidget {
  final String productImage, productName, productPrice;
  final VoidCallback onPress;

  Products({
    required this.onPress, // required:  null يعني القيمه مينفعش تبقي 
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 180,
        margin: const EdgeInsets.symmetric(horizontal: 7.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: lightGrey,
              ),
              width: 120.0,
              height: 125.0,
              child: Image.asset(
                productImage,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 120.0,
              child: Container(
                padding: const EdgeInsets.only(right: 5.0),
                child: Text(
                  productName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontFamily: 'Tajawal',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 114, 114, 114),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 120.0,
              child: Container(
                padding: const EdgeInsets.only(right: 5.0),
                child: Text(
                  productPrice,
                  textDirection: TextDirection.rtl,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
