import 'package:dot_marketplace/core/presentation/UI/text_fields/app_text_field.dart';
import 'package:dot_marketplace/feature/main_page/presentation/page/main_page_vm.dart';
import 'package:dot_marketplace/core/presentation/UI/sheets/app_bottom_sheet.dart';
import 'package:dot_marketplace/feature/main_page/presentation/widget/advertise_list_item.dart';
import 'package:dot_marketplace/theme/app_light_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:reactive_variables/reactive_variables.dart';

class MainPage extends StatefulWidget {
  final MainPageViewModel vm;
  const MainPage({super.key, required this.vm});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainPageViewModel get vm => widget.vm;
  final _currentPageIndex = 0.rv;

  @override
  void initState() {
    super.initState();
    vm.getAdvertisementPage(page: 0);
    vm.getFavoriteList(0);
    vm.getmtAdvertisementPage(0);
    // vm.init();
  }

  @override
  void didUpdateWidget(covariant MainPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.vm != widget.vm) {
      vm.getAdvertisementPage(page: 0);
      vm.getFavoriteList(0);
      vm.getmtAdvertisementPage(0);
    }
  }

  @override
  void dispose() {
    super.dispose();
    // vm.dispose();
  }

  void _setCurenBottomSheetWidget(int index) {
    if (index >= 0 && index < _bottomSheetwidgetsBuilder.length) {
      vm.curentBottomSheetWidget(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabHeadersBuilder.tabs.length,
      child: Scaffold(
        appBar: _appBarBuilder,
        bottomNavigationBar: _bottomNavBarBuilder,
        body: _currentPageIndex
            .observer((context, value) => _pageTabsBuilder[value]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppLightColors.primaryContainer,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  List<Widget> get _pageTabsBuilder => [
        _tabBarViewBuilder,
        _favoritesBuilder,
      ];

  Widget get _favoritesBuilder => vm.favoriteAdvertisementList.observer(
        (context, value) => ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => AdvertisementListItemWidget(
              advertisementListItem: vm.favoriteAdvertisementList()[index]),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemCount: vm.favoriteAdvertisementList.value.length,
        ),
      );

  Widget get _localityListBuilder => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: AppBar(
                  leading: BackButton(
                    onPressed: () => vm.curentBottomSheetWidget(0),
                  ),
                  title: Text('Город'),
                  backgroundColor: Colors.transparent,
                  actions: [
                    TextButton(onPressed: () {}, child: Text('Сбросить')),
                    const SizedBox(width: 16),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemCount: vm.localityListItem.length,
              itemBuilder: (context, index) => vm.localityListItem[index],
              separatorBuilder: (context, index) => const SizedBox(height: 8),
            ),
          ),
        ],
      );

  List<Widget> get _bottomSheetwidgetsBuilder => [
        _filterBottomSheetBuilder,
        _localityListBuilder,
      ];

  Widget get _favoriteIsempty => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                size: 70,
                color: AppLightColors.outlineVariant,
              ),
              const SizedBox(height: 16),
              Text(
                'У вас пока нет объявлений',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Не упустите возможность! \nСоздайте и опубликуйте своё объявление прямо сейчас, чтобы предложить товары или услуги широкой аудитории.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );

  Widget get _filterBottomSheetBuilder => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Фильтры',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  TextButton(
                      onPressed: () {
                        vm.isValidPrice();
                        context.pop();
                      },
                      child: Text('Применить')),
                ],
              ),
            ),
            Text(
              'Город',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => vm.curentBottomSheetWidget(1),
              child: Text('Добавить город'),
            ),
            const SizedBox(height: 24),
            Text(
              'Цена объявления',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: AppTextField(
                    labelText: 'От',
                    controller: vm.minPrice,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: AppTextField(
                    labelText: 'До',
                    controller: vm.maxPrice,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      );

  Widget get _appFiltersBottomSheetBuilder => AppBottomSheet(
      widget: vm.curentBottomSheetWidget
          .observer((context, value) => _bottomSheetwidgetsBuilder[value]));

  AppBar get _appBarBuilder => AppBar(
        toolbarHeight: 68,
        forceMaterialTransparency: true,
        bottom: _tabHeadersBuilder,
        title: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(28)),
            color: AppLightColors.surfaceContainer,
          ),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                padding: const EdgeInsets.all(16),
              ),
              Expanded(
                child: TextField(
                  controller: vm.searchTextField,
                  decoration: InputDecoration(
                      hintText: 'Поиск объявлений', border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                vm.onFilterTap(context, _appFiltersBottomSheetBuilder),
            icon: const Icon(Icons.filter_alt_outlined),
            padding: const EdgeInsets.all(16),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(AppLightColors.surfaceContainer),
            ),
          ),
          const SizedBox(width: 16),
        ],
      );

  Widget get _preloaderBuilder => Center(
        child: LoadingAnimationWidget.discreteCircle(
          color: AppLightColors.primary,
          secondRingColor: AppLightColors.secondary,
          thirdRingColor: Colors.transparent,
          size: 45,
        ),
      );

  Widget get _otherAdvertiseBuilder => vm.advertisementList.observer(
        (context, value) => value.isEmpty
            ? _preloaderBuilder
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => AdvertisementListItemWidget(
                    advertisementListItem: vm.advertisementList()[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: vm.advertisementList.value.length,
              ),
      );
  Widget get _myAdvertiseBuilder => vm.myAdverList.observer(
        (context, value) => value.isEmpty
            ? _favoriteIsempty
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => AdvertisementListItemWidget(
                    advertisementListItem: vm.myAdverList()[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: vm.myAdverList.value.length,
              ),
      );

  Widget get _bottomNavBarBuilder => _currentPageIndex.observer(
        (context, value) => NavigationBar(
          onDestinationSelected: (int index) {
            if (_pageTabsBuilder.length > index) _currentPageIndex(index);
          },
          selectedIndex: _currentPageIndex.value,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.library_books),
              icon: Icon(Icons.library_books_outlined),
              label: 'Объявления',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.favorite_outlined),
              icon: Icon(Icons.favorite_outline_rounded),
              label: 'Избранное',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
              label: 'Профиль',
            ),
          ],
        ),
      );

  TabBar get _tabHeadersBuilder => const TabBar(tabs: <Widget>[
        Tab(
          text: 'Все',
        ),
        Tab(
          text: 'Мои',
        ),
      ]);
  TabBarView get _tabBarViewBuilder =>
      TabBarView(children: [_otherAdvertiseBuilder, _myAdvertiseBuilder]);
}
