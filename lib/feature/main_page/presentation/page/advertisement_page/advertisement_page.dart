import 'package:dot_marketplace/core/presentation/UI/preloader/preloader.dart';
import 'package:dot_marketplace/core/presentation/UI/text_fields/app_text_field.dart';
import 'package:dot_marketplace/feature/locality/domain/entity/locality.dart';
import 'package:dot_marketplace/feature/main_page/domain/bloc/advertisement_service.dart';
import 'package:dot_marketplace/feature/main_page/presentation/page/advertisement_page/advertisement_page_vm.dart';
import 'package:dot_marketplace/feature/main_page/presentation/widget/advertise_list_item.dart';
import 'package:dot_marketplace/feature/main_page/presentation/widget/locality_list_item.dart';
import 'package:dot_marketplace/feature/sidebar/presentation/sidebar_widget.dart';
import 'package:dot_marketplace/feature/sidebar/presentation/sidebar_widget_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AdvertisementPage extends StatefulWidget {
  const AdvertisementPage({super.key, required this.vm});
  final AdvertisementPageViewModel vm;

  @override
  State<AdvertisementPage> createState() => _AdvertisementPageState();
}

class _AdvertisementPageState extends State<AdvertisementPage> {
  @override
  void initState() {
    super.initState();
    vm.getAdvertisementPage();
    vm.getMyAdvertisementPage();
  }

  @override
  void didUpdateWidget(covariant AdvertisementPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.vm != widget.vm) {
      vm.getAdvertisementPage();
      vm.getMyAdvertisementPage();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget get _localityListBuilder => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppBar(
                  leading: BackButton(
                    onPressed: context.pop,
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
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: LocalityList.values.length,
              itemBuilder: (context, index) => LocalityListItem(
                locality: LocalityList.values[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 24),
            ),
          ),
        ],
      );

  AdvertisementPageViewModel get vm => widget.vm;
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
                        vm.getAdvertisementPage();
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
              onPressed: () => vm.onFilterTap(context, _localityListBuilder),
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

  AppBar get _appBarBuilder => AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 68,
        forceMaterialTransparency: true,
        bottom: _tabHeadersBuilder,
        title: Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(28)),
            color: Theme.of(context).colorScheme.surfaceVariant,
          ),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    padding: const EdgeInsets.all(16),
                    onPressed: Scaffold.of(context).openDrawer,
                  );
                },
              ),
              Expanded(
                child: TextField(
                  controller: vm.searchTextField,
                  decoration: const InputDecoration(
                      hintText: 'Поиск объявлений', border: InputBorder.none),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => vm.onFilterTap(context, _filterBottomSheetBuilder),
            icon: const Icon(Icons.filter_alt_outlined),
            padding: const EdgeInsets.all(16),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.surfaceVariant,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      );

  Widget get _advertiseBuilder =>
      BlocBuilder<AdvertisementService, AdvertisemetState>(
          bloc: vm.advertisementService,
          builder: (context, state) {
            if (state is AdvertisementIsSuccessState) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => AdvertisementListItemWidget(
                    advertisementListItem: state.advertice[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: state.advertice.length,
              );
            } else if (state is AdvertisementIsLoadingState) {
              return const Center(child: Preloader());
            } else if (state is AdvertisementIsEmptyState) {
              return const Center(
                child: Text('Ничего не найдено'),
              );
            } else if (state is AdvertisementIsErrorState) {
              return const Center(
                child: Text('Ошибка'),
              );
            } else {
              return const Center(
                child: Text('Что-то пошло не так'),
              );
            }
          });

  Widget get _myAdvertiseBuilder =>
      BlocBuilder<AdvertisementService, AdvertisemetState>(
          bloc: vm.myAdvertisementService,
          builder: (context, state) {
            if (state is AdvertisementIsSuccessState) {
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) => AdvertisementListItemWidget(
                    advertisementListItem: state.advertice[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemCount: state.advertice.length,
              );
            } else if (state is AdvertisementIsLoadingState) {
              return const Center(
                child: Preloader(),
              );
            } else if (state is AdvertisementIsEmptyState) {
              return Center(
                child: Text('Ничего не найдено'),
              );
            } else if (state is AdvertisementIsErrorState) {
              return Center(
                child: Text('Ошибка'),
              );
            } else {
              return Center(
                child: Text('Что-то пошло не так'),
              );
            }
          });

  Widget get _tabsBuilder =>
      TabBarView(children: [_advertiseBuilder, _myAdvertiseBuilder]);

  TabBar get _tabHeadersBuilder => const TabBar(tabs: <Widget>[
        Tab(
          text: 'Все',
        ),
        Tab(
          text: 'Мои',
        ),
      ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabHeadersBuilder.tabs.length,
      child: Scaffold(
        appBar: _appBarBuilder,
        body: _tabsBuilder,
        drawer: SideBarWidget(
          vm: SidebarWidgetViewModel(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
