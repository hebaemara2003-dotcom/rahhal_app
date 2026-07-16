import 'dart:async';

import 'package:flutter/material.dart';

import '../../../api/explor_api_directory/explore_api.dart';
import '../../../api/search_places_api.dart';
import 'explor_data.dart';
import 'explor_widget.dart';

class ExploreTap extends StatefulWidget {
  const ExploreTap({super.key});

  @override
  State<ExploreTap> createState() => _ExploreTapState();
}

class _ExploreTapState extends State<ExploreTap> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounce;
  List places =[];
  @override
  void initState() {
    super.initState();
    loadPlaces();
  }
    Future<void> loadPlaces() async {
      places = await getPlaces();
      setState(() {});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text("Explore Places"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search for Places...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),

              onChanged: (value) {
                if (_debounce?.isActive ?? false) {
                  _debounce!.cancel();
                }

                _debounce = Timer(const Duration(milliseconds: 500), () async {
                  print("Searching: $value");

                  if (value.isEmpty) {
                    print("Loading Places...");
                    places = await getPlaces();
                    print(places);
                  } else {
                    places = await searchPlaces(value);
                  }

                  setState(() {});
                });
              },
            ),

            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${places.length} places found",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: places.isEmpty
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : GridView.builder(
                itemCount: places.length,
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (context, index) {
                  var place = places[index];

                  return PlaceCard(
                    place: place,
                    placeId: place["id"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}