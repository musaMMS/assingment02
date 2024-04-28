
import 'package:flutter/material.dart';
import 'package:online/const/app_colors.dart';
import 'package:online/views/landscapeScreen.dart';
import '../model/photo_gallery.dart';
import '../widget/custom_button.dart';
import '../widget/detailsScreen/custom_headline.dart';
import '../widget/detailsScreen/custom_image.dart';
import '../widget/detailsScreen/custom_text.dart';

class PortraitScreen extends StatefulWidget {
  const PortraitScreen({super.key});

  @override
  State<PortraitScreen> createState() => _PortraitScreenState();
}

class _PortraitScreenState extends State<PortraitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: GridView.builder(
          itemCount: galleries.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PortraitDetailsScreen(
                    gallery: galleries[index],
                  ),
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(galleries[index].thumbnail),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: Text(
                        galleries[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
class PortraitDetailsScreen extends StatelessWidget {
  final PhotoGallery gallery;

  const PortraitDetailsScreen({Key? key, required this.gallery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        if (MediaQuery.of(context).orientation == Orientation.portrait) {
          return Scaffold(
            appBar: AppBar(title: Text(gallery.title), centerTitle: true),
            body: OrientationBuilder(
              builder: (context, orientation) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: customImage(
                          gallery.thumbnail,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            headLine(
                              gallery.title,
                            ),
                            customText(
                              gallery.description,
                            ),
                            SizedBox(height: 10),
                            customButton('See More', () {}),
                            SizedBox(height: 10),
                            Text(
                              gallery.suggestion,
                              style: TextStyle(
                                color: AppColors.greenColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: 200,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 2.5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: AssetImage(gallery.suggestionImage1),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 10,
                                                left: 10,
                                                child: Text(
                                                  'Dawn',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 2.5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            image: DecorationImage(
                                              image: AssetImage(gallery.suggestionImage2),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                bottom: 10,
                                                left: 10,
                                                child: Text(
                                                  'Leaves',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return LandScapeDetailsScreen(gallery: gallery);
        }
      },
    );
  }
}


