import 'package:flutter/material.dart';
import 'package:pupedia_app/api_service.dart';

class ResultPage extends StatefulWidget {
  final String selectedBreed;

  ResultPage({required this.selectedBreed});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final ApiService service2 = ApiService();

  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    fetchDogImage();
  }

  Future<void> fetchDogImage() async {
    try {
      final image = await service2.fetchDogImageByBreed(widget.selectedBreed);
      setState(() {
        imageUrl = image;
      });
    } catch (e) {
      Text('Error fetching the image.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: imageUrl.isNotEmpty
                      ? DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        )
                      : null, //
                ),
                child: imageUrl.isEmpty // Display a loading spinner if imageUrl is empty
                    ? Center(
                  child: CircularProgressIndicator(), // Loading spinner widget
                )
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// child: Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     Text('Selected Breed: ${widget.selectedBreed}'),
//     if (imageUrl.isNotEmpty)
//       Image.network(imageUrl) // Display the image if available
//     else
//       Text('Image not available'), // Display a message if no image is available
//   ],
// ),
// ),
// );

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
// body: FutureBuilder(
// future: service.getData(),
// builder: (context, snapshot) {
//   if(snapshot.hasData) {
//     body: Container(
//       width: double.maxFinite,
//       height: double.maxFinite,
//       child: Stack(
//         children: [
//           Positioned(
//             child: Container(
//               width: double.maxFinite,
//               height: 350,
//               decoration: BoxDecoration(
//                 image: DecorationImage(image: AssetImage("Images/german_shepherd.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 320,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: 500,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "hello",
//
//                       style: TextStyle(
//                         fontFamily: 'PT Serif Caption',
//                         fontSize: 30.0,
//
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Text('10 years',
//                       style: TextStyle(
//                         fontSize: 20.0,
//                       ),
//                     ),
//                   ],
//
//                 ),
//               ),
//
//             ),
//           ),
//         ],
//       ),
// );
// }
// else{
//   return Center(
//     child: CircularProgressIndicator(),
//   );
//
// }
//
//   },
// ),
//   );
// }
