import 'package:dot_marketplace/core/presentation/UI/app_bar/app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdvertPage extends StatelessWidget {
  const AdvertPage({super.key});

  final image =
      'https://media.cnn.com/api/v1/images/stellar/prod/230419133455-velotric-thunder-1-ebike-lead-cnnu.jpg?c=16x9&q=h_653,w_1160,c_fill/f_webp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(28)),
              ),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 205.0,
                  enableInfiniteScroll: false,
                  padEnds: false,
                ),
                items: List<Image>.generate(5, (index) => Image.network(image))
                    .map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(28))),
                        child: i,
                      );
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
