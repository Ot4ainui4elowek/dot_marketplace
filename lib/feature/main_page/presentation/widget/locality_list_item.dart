import 'package:dot_marketplace/feature/locality/domain/entity/locality.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class LocalityListItem extends StatefulWidget {
  final Locality locality;
  const LocalityListItem({
    super.key,
    required this.locality,
  });
  @override
  State<LocalityListItem> createState() => _LocalityListItemState();
}

class _LocalityListItemState extends State<LocalityListItem> {
  final isSelect = false.rv;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isSelect.observer(
          (context, value) => Checkbox(
            value: isSelect.value,
            onChanged: (value) {
              isSelect(value ?? false);
            },
          ),
        ),
        const SizedBox(width: 24),
        Text(
          widget.locality.name(context),
          style: Theme.of(context).textTheme.bodyLarge,
        )
      ],
    );
  }
}
