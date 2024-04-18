import 'package:dot_marketplace/feature/locality/domain/entity/locality.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class LocalityListItem extends StatefulWidget {
  final Locality locality;
  final Function(Locality locality) addLocality;
  final Function(Locality locality) delleteLocality;
  final bool isSelect;
  const LocalityListItem({
    super.key,
    required this.locality,
    required this.addLocality,
    required this.delleteLocality,
    required this.isSelect,
  });
  @override
  State<LocalityListItem> createState() => _LocalityListItemState();
}

class _LocalityListItemState extends State<LocalityListItem> {
  final isSelect = false.rv;

  @override
  void initState() {
    super.initState();
    isSelect(widget.isSelect);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Row(
        children: [
          isSelect.observer(
            (context, value) => Checkbox(
              value: isSelect.value,
              onChanged: (value) {
                isSelect(value ?? false);
                isSelect.value
                    ? widget.addLocality(widget.locality)
                    : widget.delleteLocality(widget.locality);
              },
            ),
          ),
          const SizedBox(width: 24),
          Text(
            widget.locality.name(context),
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
