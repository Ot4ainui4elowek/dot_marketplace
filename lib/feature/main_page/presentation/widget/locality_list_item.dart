import 'package:dot_marketplace/feature/locality/domain/entity/locality.dart';
import 'package:flutter/material.dart';
import 'package:reactive_variables/reactive_variables.dart';

class LocalityListItem extends StatefulWidget {
  final Locality locality;
  final Rv<List<Locality>> localityList;
  const LocalityListItem(
      {super.key, required this.locality, required this.localityList});
  @override
  State<LocalityListItem> createState() => _LocalityListItemState();
}

class _LocalityListItemState extends State<LocalityListItem> {
  final isSelected = false.rv;
  @override
  void initState() {
    super.initState();
    isSelected(widget.localityList.value.contains(widget.locality));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      child: Row(
        children: [
          Obs(
            rvList: [isSelected, widget.localityList],
            builder: (context) => Checkbox(
              value: widget.localityList.value.contains(widget.locality),
              onChanged: (value) {
                value != null &&
                        widget.localityList.value.contains(widget.locality)
                    ? widget.localityList.remove(widget.locality)
                    : widget.localityList.add(widget.locality);
                value = isSelected.value ? null : true;
                isSelected(value);
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
