import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mira_fitness/constants.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final List<String> imgList = [
    "assets/img/products_img/img1.png",
    "assets/img/products_img/img2.png",
    "assets/img/products_img/img3.png"
  ];

  int _currentImage = 0, quantity = 1;

  whatsapp() async {
    String productLink =
        "https://example.com/product/1"; //  رابط المنتج هستخدمه بعدين
    final String phoneNumber = "+201117991627";
    final String productName = "اسم المنتج";

    final String message =
        "أرغب في شراء $productName و الكميه $quantity $productLink";

    // ترميز النص وبناء الرابط
    final String url =
        "whatsapp://send?phone=$phoneNumber&text=${Uri.encodeFull(message)}";

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw "لا يمكن الوصول لتطبيق الواتساب";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: lightGrey,
            surfaceTintColor: lightGrey,
            expandedHeight: 300,
            elevation: 0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  CarouselSlider(
                    items: imgList
                        .map((e) => Image.asset(
                              e,
                              fit: BoxFit.cover,
                            ))
                        .toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 300.0,
                      onPageChanged: (value, _) {
                        setState(() {
                          _currentImage = value;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 7,
                    left: 0,
                    right: 0,
                    child: buildCarouselIndicator(),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 7),
                          child: const Text(
                            "اسم المنتج",
                            style: TextStyle(
                              fontFamily: "Tajawal",
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          "110",
                          style: TextStyle(
                            fontFamily: "Tajawal",
                            fontWeight: FontWeight.w800,
                            fontSize: 23,
                            color: darkYellow,
                          ),
                        ),
                        Text(
                          "ج",
                          style: TextStyle(
                            fontFamily: "Tajawal",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: darkYellow,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 320,
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      'التقليل من مستويات الكوليسترول: هناك تباين بين نتائج الدراسات حول هذه الفائدة، إذ أُجريت دراسةٌ نشرتها مجلة The Scientific World Journal عام 2008 على الأشخاص الذين يعانون من فرط الوزن أو السمنة، وقد تبيّن أنّ استهلاكهم للعسل مدة 30 يوماً ساعد على خفض مستوى الكوليسترول الكليّ، والكوليسترول الضارّ، وثلاثي الغليسريد، ومستوى الدهون، إضافةً إلى تقليل الوزن بشكل بسيط،[٤] ومن جانبٍ آخر أشارت دراسة نشرتها مجلة Journal of Medicinal Food عام 2009 وأجريت على الأشخاص الذين يعانون من ارتفاع نسبة الكوليسترول في الدم، إلى أنّ استهلاك العسل مرةً واحدةً يومياً مدّة 14 يوماً، وأظهرت النتائج أنّه لم يقلل من مستوى الكوليسترول الضارّ لديهم، ولكنّه لم يُسبّب زيادته في الوقت ذاته مقارنةً باستهلاكهم للسكر، وبالتالي فإنّ استهلاك العسل بدلاً منه يُعدُّ مفيداً بشكلٍ عامٍ\n',
                                  style: TextStyle(
                                    height: 1.5,
                                    fontFamily: "Tajawal",
                                    fontWeight: FontWeight.w200,
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 107, 107, 107),
                                  ),
                                ),
                                // TextSpan(
                                //   text: 'التقليل من خطر الإصابة بتقرحات الجهاز الهضمي: أشارت دراسةٌ أوليّةٌ أُجريت على الفئران ونُشرت في مجلة Oxidative Medicine and Cellular Longevity عام 2015 إلى أنّ عسل المانوكا يمتلك خصائص تقلل خطر الإصابة بالقرحة بشكلٍ واضح، بالإضافة إلى المحافظة على الغشاء المخاطيّ، وتقليل خطر إصابته بالآفة والضرر، وكذلك الحفاظ على البروتين السُكري المخاطي في المعدة، والإنزيمات المضادة للأكسدة، وتقليل السيتوكينات المُحرضة على الالتهابات، وفوق أكسدة الدهون\n',
                                //   style: TextStyle(
                                //     fontFamily: "Tajawal",
                                //     fontWeight: FontWeight.w200,
                                //     fontSize: 18,
                                //     color: Color.fromARGB(255, 107, 107, 107),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            onPressed: () {
                              whatsapp();
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(black),
                              minimumSize: WidgetStateProperty.all(
                                const Size(
                                  double.infinity, // استخدام عرض الشاشة
                                  50, // ارتفاع الزر
                                ),
                              ),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              ),
                            ),
                            child: const Text(
                              "شراء المنتج",
                              style: TextStyle(
                                color: white,
                                fontSize: 16,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: lightGrey,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    size: 19,
                                    color: Color.fromARGB(255, 92, 92, 92),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: AutoSizeText(
                                    textAlign: TextAlign.center,
                                    quantity.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Tajawal',
                                    ),
                                    maxLines: 1,
                                    maxFontSize: 16,
                                    minFontSize: 6,
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (quantity > 1) {
                                          quantity--;
                                        }
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      size: 19,
                                      color: Color.fromARGB(255, 92, 92, 92),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            childCount: 1,
          ))
        ]),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: const EdgeInsets.all(5),
            height: i == _currentImage ? 8 : 5,
            width: i == _currentImage ? 8 : 5,
            decoration: BoxDecoration(
              color: i == _currentImage ? black : Colors.grey,
              shape: BoxShape.circle,
            ),
          )
      ],
    );
  }
}


//               Stack(
//                 children: [
//                   Container(
//                     color: const Color.fromARGB(255, 235, 235, 235),

//                   ),
//                   Container(
//                     margin: const EdgeInsets.all(6),
//                     child: Positioned(
//                       right: 0,
//                       top: 0,
//                       child: IconButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                           },
//                           icon: const Icon(Icons.arrow_back),
//                           iconSize: 30),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     left: 0,
//                     child: Container(
//                       margin: const EdgeInsets.fromLTRB(0, 10, 0, 8),
//                       child: buildCarouselIndicator(),
//                     ),
//                   ),
//                 ],
//               ),




                      




            

