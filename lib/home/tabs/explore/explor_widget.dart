import 'package:flutter/material.dart';
import 'package:rahhal_app/place_details/place_details_screen.dart';
import 'package:rahhal_app/utils/app_assets.dart';
import 'package:rahhal_app/utils/screen_size.dart';

import 'explor_model.dart';

class PlaceCard extends StatelessWidget {
  final Map<String, dynamic> place;
  final int placeId;
  const PlaceCard({
    super.key,
    required this.place, required this.placeId,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (_)=>
            PlaceDetailScreen(placeId: placeId)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            Stack(
              children: [
      
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child:Image.network(
                    place["mainImageUrl"],
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AppAssets.pyramidsImage,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
      
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.cyan,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:Text(
                      place["city"] ?? "Unknown",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
      
                  Text(
                    place["name"] ?? "No Name",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
      
                  const SizedBox(height: 6),
      
                  Row(
                    children: [
                      const Icon(
                        Icons.people_outline,
                        size: 16,
                      ),
                       SizedBox(width: context.width*0.02),
                      Expanded(
                        child: Text(
                          place["category"] ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
      
                  const SizedBox(height: 4),
      
                  Text(
                    "${place["price"] ?? 0} EGP",
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
      
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.end,
                    children: [
      
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.cyan,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
      
                      const SizedBox(width: 8),
      
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}