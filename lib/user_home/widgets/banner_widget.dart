import 'package:flutter/material.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner({
    required String this.bannerImage,
  });

  final String bannerImage;

  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      bannerImage,
                      width: MediaQuery.of(context).size.width -
                          20, // تحديد عرض الصورة بحيث يكون أقل من عرض الشاشة بـ 20 نقطة
                      alignment:
                          Alignment.center, // تحديد موضع الصورة داخل الحاوية
                    ),
                  ),
                ],
              );
  }
}