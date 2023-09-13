import 'package:flutter/material.dart';
import 'package:pupedia_app/api_service.dart';
import 'result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ApiService service1 = ApiService();
  List<String> dogBreeds = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final breeds = await service1.getData();
      setState(() {
        dogBreeds = breeds;
      });
    } catch (e) {
      // Handle error here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Breed Search'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Search Dog Breeds',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dogBreeds.length,
              itemBuilder: (context, index) {
                final breedName = dogBreeds[index];
                // Check if the breed name contains the search query
                if (breedName.toLowerCase().contains(searchQuery.toLowerCase())) {
                  return ListTile(
                    title: Text(breedName),
                  );
                }
                return SizedBox.shrink(); // Hide the breed if not matching the search query
              },
            ),
          ),
        ],
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Container(
//       width: double.maxFinite,
//       height: double.maxFinite,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           fit: BoxFit.cover,
//           image: AssetImage('Images/dog_image.webp',),
//         ),
//       ),
//       child: Container(
//         margin: EdgeInsets.only(top: 30.0),
//         padding: EdgeInsets.all(20.0),
//         child: TextField(
//           onSubmitted: (value) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (BuildContext context) {
//                   return ResultPage();
//                 },
//               ),
//             );
//           },
//           style: TextStyle(
//             color: Colors.black,
//           ),
//           decoration: InputDecoration(
//             icon: Icon(
//               Icons.search,
//               color: Colors.black38,
//             ),
//             hintText: 'Enter a dog breed',
//             hintStyle: TextStyle(
//               color: Colors.grey,
//             ),
//             filled: true,
//             fillColor: Colors.white38,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.all(Radius.circular(10.0)),
//               borderSide: BorderSide.none,
//             ),
//
//           ),
//
//         ),
//       ),
//     ),
//   );
// }
// }


