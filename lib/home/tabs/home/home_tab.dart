import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rahhal_app/api/top_rated_places_api.dart';
import 'package:rahhal_app/home/tabs/explore/explore_tab.dart';
import 'package:rahhal_app/place_details/start_planning_1_screen.dart';
import '../../../api/popular_trip_api.dart';
import '../../../camera/camera_screen.dart';
import '../../../custom/custom_text_field.dart';
import '../../../onBoarding_screen/custom_button.dart';
import '../../../profile/profile_screen.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/screen_size.dart';
import '../../item_home.dart';
import '../explore/explor_data.dart';
import '../explore/explor_widget.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List trips =[];
  List places =[];
  @override
  void initState() {
    super.initState();
    loadTrips();
  }

  Future<void> loadTrips() async {
    trips = await getPopularTrips();
    places = await getTopRatedPlaces();
    print(places);

    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children:[ Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: SizedBox(
                  height: context.height*.30,
                  child: Image.asset(AppAssets.homeScreenImage,
                    fit: BoxFit.cover,
                  ),
                )),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: context.width*0.06),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Hello, Traveler!',
                              style: AppStyles.regular15BlackColor,),
                            Spacer(),
                            FloatingActionButton.small(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              onPressed: (){
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder: (_)=>ProfileScreen()));
                              },
                              child: Icon(Icons.person_2_outlined,size: 25,
                                color: AppColors.cyanColor,),)

                          ],
                        ),
                        Text("Where do you\n want to go?",
                          style: AppStyles.sans24BlackColor,),
                        SizedBox(height: context.height*0.01,),
                        Text("Discover Egypt your way",
                          style: AppStyles.regular13BlackColor,),
                        SizedBox(height: context.height*0.065,),
                        CustomButton(
                            onPressed: (){
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (_)=>ExploreTap()));
                            },
                            borderRadius: BorderRadius.circular(40),
                            fillColor: AppColors.whiteColor,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search_outlined,
                                  color: AppColors.mainGrayColor,
                                  size: 25,
                                ),
                                Text("Search for places",
                                  style:AppStyles.sans24MainGrayColor ,),
                                Spacer(),
                                IconButton(
                                    onPressed: (){
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (_)=>CameraScreen()));
                                            },
                                    icon: Icon(Icons.camera_alt_rounded,
                                      color: AppColors.lightMainColor,
                                              size: 25,))

                              ],



                            ))

                      ]
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: context.height*0.02,),
          Stack(
            children: [
              SizedBox(
                width: context.width*0.92,
                height: context.height*0.22,
                child: Image.asset(
                  AppAssets.tripImage,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: context.height*0.02,
                    horizontal: context.width*0.03
                ),
                child: Column(
                  children: [
                    Text("Plan your trip easily!",
                      style: AppStyles.nunito16Black,),
                    SizedBox(height: context.height*0.01,),
                    Text("Create your perfect itinerary\nbased on your budget and\ninterests",
                      style: AppStyles.nunito11Black,),
                    SizedBox(height: context.height*0.02,),
                    CustomButton(
                      fillColor: AppColors.cyanColor2,
                      width: context.width*.45,
                      height: context.height*0.05,
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (_)=>StartPlanningScreen()));
                      },
                      borderRadius: BorderRadius.circular(44),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Start Planning",
                            style: AppStyles.nunito11White,),
                           Icon(Icons.arrow_forward_ios_outlined,
                                 color: AppColors.whiteColor,)


                        ],
                      ),
                    )

                  ],
                ),
              ),


            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: context.width*0.15,),
              Text("Popular Itineraries",
                style: AppStyles.nunito16navy,),
              Spacer()
            ],
          ),
          SizedBox(height: context.height*0.02,),
          SizedBox(
            height: context.height*0.37,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trips.length,
              itemBuilder: (context, index) {

                var trip = trips[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ItineraryCard(
                    tripId: trip["id"],
                    placeId: trip["tripPlaces"][0]["place"]["id"],
                    image: trip["tripPlaces"][0]["place"]["mainImageUrl"],
                    title: trip["tripName"],
                    places: "${trip["tripPlaces"].length} Places",
                    price: "${trip["tripPlaces"][0]["estimatedCost"]} EGP",
                    duration: "${trip["durationDays"]} Days",
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Popular places",
                style: AppStyles.nunito16navy,),
              TextButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (_)=>ExploreTap()));
                  },
                  child: Text("see all",
                    style: AppStyles.regular16cyanColor,))
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: places.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: .57,),
              itemBuilder: (context, index) {
              var place = places[index];
                return PlaceCard(
                  place: places[index],
                );
              },
          )





        ],
      ),
    );
  }
}
