import 'package:dot_marketplace/core/domain/router/dot_marketplace_routes.dart';
import 'package:dot_marketplace/feature/main_page/domain/entity/adverisement_list_item.dart';
import 'package:dot_marketplace/theme/app_light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AdvertisementListItemWidget extends StatelessWidget {
  final AdvertisementListItem advertisementListItem;

  final image =
      'https://media.cnn.com/api/v1/images/stellar/prod/230419133455-velotric-thunder-1-ebike-lead-cnnu.jpg?c=16x9&q=h_653,w_1160,c_fill/f_webp';

  const AdvertisementListItemWidget(
      {super.key, required this.advertisementListItem});

  Icon _isfavorite(BuildContext context) {
    if (advertisementListItem.isFavorite) {
      return Icon(
        Icons.favorite_outlined,
        size: 24,
        color: Theme.of(context).colorScheme.primary,
      );
    } else {
      return Icon(
        Icons.favorite_border_outlined,
        size: 24,
        color: Theme.of(context).colorScheme.outline,
      );
    }
  }

  BoxDecoration _cardDecoration(BuildContext context) => BoxDecoration(
        color: AppLightColors.surface,
        border: Border.all(
          color: AppLightColors.outlineVariant,
        ),
        borderRadius: BorderRadius.circular(12),
      );

  Widget _headerBuilder(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 16),
            child: Text(
              advertisementListItem.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: _isfavorite(context),
            padding: EdgeInsets.all(16),
          ),
        ],
      );
  Widget _textContentBuilder(BuildContext context) => Container(
        width: double.maxFinite,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${advertisementListItem.description.split(' ').getRange(0, 12).join(' ')}...',
                style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Text(
              '${advertisementListItem.cost.toString()} руб.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              advertisementListItem.creationDate
                  .toString()
                  .split(' ')
                  .first
                  .split('-')
                  .reversed
                  .join(' '),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(advertisementListItem.locality.name(context)),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.pushNamed(DotMarketplaceRoutes.advertPage,
          extra: advertisementListItem),
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      icon: Container(
        clipBehavior: Clip.hardEdge,
        decoration: _cardDecoration(context),
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 176,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.network(
                    image,
                  ),
                )),
            _headerBuilder(context),
            _textContentBuilder(context),
          ],
        ),
      ),
    );
  }
}
