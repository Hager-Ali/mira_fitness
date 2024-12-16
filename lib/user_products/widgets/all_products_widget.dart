import 'package:flutter/material.dart';
import 'package:mira_fitness/constants.dart';

class AllProducts extends StatelessWidget {
  final String productImage, productName, productPrice, productDetails;
  final VoidCallback onPress;

  AllProducts({
    required this.onPress,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productDetails,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 235, 235, 235),
                ),
                width: 120.0,
                height: 125.0,
                child: Image.asset(
                  productImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                          fontFamily: "Tajawal",
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        productPrice,
                        style: TextStyle(
                          fontFamily: "Tajawal",
                          fontWeight: FontWeight.bold,
                          color: darkYellow,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      SizedBox(
                        child: Text(
                          productDetails,
                          style: TextStyle(
                            fontFamily: "Tajawal",
                            fontSize: 15,
                            color: Color.fromARGB(255, 107, 107, 107),
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        width: 300,
                      ),
                    ],
                  ),
                )),
          ],
        ),
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 8),
        padding: const EdgeInsets.all(10),
        height: 145,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 238, 238, 238),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
          color: white,
        ),
      ),
    );
  }
}
