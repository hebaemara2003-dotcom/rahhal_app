import 'package:flutter/material.dart';
import 'package:rahhal_app/itinerary_details/itinerary_details_screen.dart';
import 'package:rahhal_app/place_details/place_details_screen.dart';
import 'package:rahhal_app/utils/app_assets.dart';
import 'package:rahhal_app/utils/app_colors.dart';
import 'package:rahhal_app/utils/app_styles.dart';
import 'package:rahhal_app/utils/screen_size.dart';

class ItineraryCard extends StatelessWidget {
  final int placeId;
  final int tripId;
  final String image;
  final String title;
  final String places;
  final String price;
  final String duration;

  const ItineraryCard({
    super.key,
    required this.tripId,
    required this.image,
    required this.title,
    required this.places,
    required this.price,
    required this.duration, required this.placeId
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PlaceDetailScreen(
                placeId:placeId )
          ),
        );
        
      },
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // الصورة
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.network(
                    image,
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
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                        duration,
                        style: AppStyles.nunito11White
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.caption12navyBlueColor,
                  ),

                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, size: 16),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          places,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppStyles.caption10navyBlueColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                      price,
                      style:AppStyles.regular12greenColor
                  ),

                  SizedBox(height: context.height*0.01),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: AppColors.lightMainColor,
                              width: 1.5
                          )
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ItineraryDetailsScreen(
                              tripId: tripId,
                            ),
                          ),
                        );
                      },
                      child: Text("View Details",
                        style: AppStyles.nunito11LightMainColor,),
                    ),
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