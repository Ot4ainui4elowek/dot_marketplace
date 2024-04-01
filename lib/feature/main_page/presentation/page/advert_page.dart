import 'package:dot_marketplace/core/presentation/UI/app_bar/app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/adverisement_list_item.dart';
import 'package:flutter/material.dart';

class AdvertPage extends StatelessWidget {
  const AdvertPage({super.key, required advertisementListItem})
      : _advertisementListItem = advertisementListItem;
  final AdvertisementListItem _advertisementListItem;

  Widget _titleBuilder(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _advertisementListItem.creationDate
                    .toString()
                    .split(' ')
                    .first
                    .split('-')
                    .join(' '),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                _advertisementListItem.locality.name(context),
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _advertisementListItem.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            '${_advertisementListItem.cost} руб',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
        ],
      );

  Widget _descriptionBuilder(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Описание',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 8),
          Text(
            _advertisementListItem.description,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      );

  Widget get _imageCarouselBuilder => Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(28)),
        ),
        clipBehavior: Clip.hardEdge,
        child: CarouselSlider(
          options: CarouselOptions(
            height: 205.0,

            //enableInfiniteScroll: false,
            padEnds: false,
          ),
          items:
              List<Image>.generate(5, (index) => Image.network(image)).map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(right: 10.0),
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(28))),
                  child: FittedBox(
                    child: i,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
      );

  Widget _authorInformationBuilder(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Image(
                  image: AssetImage('assets/image/logo.png'),
                  height: 40,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Иван Иванов',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'на купи - и точка с декабря 2024',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 8),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.mail_outline,
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'alex@mail.gg',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(
                    Icons.call_outlined,
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '+373 777 7 77 77',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          ],
        ),
      );

  final image =
      'https://media.cnn.com/api/v1/images/stellar/prod/230419133455-velotric-thunder-1-ebike-lead-cnnu.jpg?c=16x9&q=h_653,w_1160,c_fill/f_webp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context: context,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _imageCarouselBuilder,
                const SizedBox(height: 16),
                _titleBuilder(context),
                _descriptionBuilder(context),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          _authorInformationBuilder(context),
        ],
      ),
    );
  }
}
