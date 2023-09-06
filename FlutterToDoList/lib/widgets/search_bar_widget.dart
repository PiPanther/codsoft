import 'package:flutter/material.dart';

Widget searchBarWidget(BuildContext context, Function(String) searchFunction) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      onChanged: (value) =>
          searchFunction(value), // Chama a função passada como parâmetro
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.secondary,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
          border: InputBorder.none,
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.grey)),
    ),
  );
}
