import 'package:dot_marketplace/core/presentation/UI/app_bar/app_bar.dart';
import 'package:dot_marketplace/feature/create_advert_page/presentation/create_advert_page_vm.dart';
import 'package:dot_marketplace/feature/locality/domain/entity/locality.dart';
import 'package:flutter/material.dart';

class CreateAdvertPage extends StatefulWidget {
  const CreateAdvertPage({super.key, required this.vm});
  final CreateAdvertPageViewModel vm;

  @override
  State<CreateAdvertPage> createState() => _CreateAdvertPageState();
}

class _CreateAdvertPageState extends State<CreateAdvertPage> {
  CreateAdvertPageViewModel get vm => widget.vm;

  AppBar get _appBarBuilder => CustomAppBar(
        leading: BackButton(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        context: context,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
      );

  Widget get _titleBuilder => TextField(
        controller: vm.titleTextFieldController,
        style: Theme.of(context).textTheme.headlineMedium,
        decoration: InputDecoration(
          hintText: 'Название',
          hintStyle: Theme.of(context).textTheme.headlineMedium,
          border: InputBorder.none,
        ),
      );

  Widget get _costBuilder => Row(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width / 3, minWidth: 30),
            child: IntrinsicWidth(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: vm.costTExtFieldController,
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '0',
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
          Text(
            'руб.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      );
  Widget get _citiesDropDownBuider => DropdownMenu(
      initialSelection: LocalityList.values[0],
      hintText: 'Город',
      textStyle: Theme.of(context).textTheme.labelLarge,
      onSelected: (LocalityList? locality) {
        if (locality != null) {
          vm.curentLocale(locality);
        }
      },
      inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none, contentPadding: EdgeInsets.zero),
      dropdownMenuEntries: LocalityList.values
          .map((e) => DropdownMenuEntry(value: e, label: e.name(context)))
          .toList());

  Widget get _descriptionBuilder => TextField(
        style: Theme.of(context).textTheme.bodyLarge,
        maxLines: null,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Описание',
            hintStyle: Theme.of(context).textTheme.bodyLarge),
      );

  Widget _imageCardBuilder(String src) => Container(
        width: MediaQuery.of(context).size.width / 2 - 28,
        margin: const EdgeInsets.only(right: 12),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4.5))),
        height: 125,
        child: FittedBox(
          clipBehavior: Clip.hardEdge,
          fit: BoxFit.cover,
          child: Image.asset(src),
        ),
      );

  Widget get _mainContentBuilder => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 52),
          child: Column(
            children: [
              const SizedBox(height: 40),
              _titleBuilder,
              const SizedBox(height: 12),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _costBuilder,
                  _citiesDropDownBuider,
                ],
              ),
              _descriptionBuilder,
              const SizedBox(height: 16),
              Row(
                children: [
                  _imageCardBuilder('assets/image/macbook.webp'),
                  _imageCardBuilder('assets/image/macbook.webp'),
                ],
              ),
            ],
          ),
        ),
      );

  Widget get _footerBuilder => Container(
        color: Theme.of(context).colorScheme.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  child: IconButton(
                    padding: const EdgeInsets.all(10),
                    onPressed: () {},
                    icon: const Icon(Icons.camera_alt_outlined),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(4),
                  child: IconButton(
                    padding: const EdgeInsets.all(10),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo_outlined,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(4),
              child: IconButton(
                padding: const EdgeInsets.all(10),
                onPressed: () {},
                icon: const Icon(
                  Icons.more_vert_outlined,
                ),
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuilder,
      body: _mainContentBuilder,
      bottomSheet: _footerBuilder,
    );
  }
}
