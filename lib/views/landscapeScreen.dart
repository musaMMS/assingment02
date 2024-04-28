import 'package:flutter/material.dart';
import 'package:online/views/portraitScreen.dart';
import 'package:online/widget/custom_button.dart';
import '../model/photo_gallery.dart';
import '../widget/detailsScreen/custom_headline.dart';
import '../widget/detailsScreen/custom_image.dart';
import '../widget/detailsScreen/custom_text.dart';

class LandScapeScreen extends StatefulWidget {
  const LandScapeScreen({super.key});

  @override
  State<LandScapeScreen> createState() => _LandScapeScreenState();
}

class _LandScapeScreenState extends State<LandScapeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: GridView.builder(
          itemCount: galleries.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LandScapeDetailsScreen(
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


class LandScapeDetailsScreen extends StatelessWidget {
  final PhotoGallery gallery;

  const LandScapeDetailsScreen({Key? key, required this.gallery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        if (MediaQuery.of(context).orientation == Orientation.landscape) {
          return Scaffold(
            appBar: AppBar(title: Text(gallery.title), centerTitle: true),
            body: OrientationBuilder(
              builder: (context, orientation) {
                return SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: customImage(gallery.thumbnail),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              headLine(gallery.title),
                              customText(gallery.description),
                              SizedBox(height: 5),
                              customButton('See More', () {}),
                              SizedBox(height: 5),
                              headLine(gallery.suggestion),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5),
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
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return PortraitDetailsScreen(gallery: gallery);
        }
      },
    );
  }
}


