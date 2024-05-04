import 'package:flutter/material.dart';

class CreatePagesImageItem {
  final String src;
  final String id;
  const CreatePagesImageItem({required this.src, required this.id});
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        children: [
          const SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width / 2 - 36,
            margin: const EdgeInsets.only(right: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(4.5)),
            ),
            height: 125,
            child: FittedBox(
              clipBehavior: Clip.hardEdge,
              fit: BoxFit.cover,
              child: Image.asset(src),
            ),
          ),
          Positioned(
              right: 0,
              top: -20,
              child: IconButton(
                style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.outline),
                color: Theme.of(context).colorScheme.surface,
                onPressed: () {},
                icon: const Icon(Icons.close),
              ))
        ],
      );
}
