import 'package:cat_api/presentation/screen/image_screen.dart';
import 'package:flutter/material.dart';

class BreedCard extends StatelessWidget {
  final String breedImage;
  final String breedName;
  final String description;
  final String origin;
  final String lifespan;
  const BreedCard({required this.breedImage,required this.breedName,required this.description,required this.origin,required this.lifespan});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BreedImagesScreen(breedName: "$breedName",breedImage: "$breedImage",description: description, origin: origin,lifeSpan: lifespan,),
            ),
          );
        },
        child: Row(
          // Change to Row here
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the top
          children: [
            // Place the image widget here on the left
            Image.network(
              "$breedImage", // Replace with actual image URL
              width: 150, // Adjust the width of the image as needed
              height: 150, // Adjust the height of the image as needed
              fit: BoxFit.fill,
            ),
            SizedBox(width: 8.0), // Add some spacing
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
               
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: 170,
                      child: Text(
                        "$breedName ",
                        style:
                            TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                      ),
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
