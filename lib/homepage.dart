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
  List<String> filteredBreeds = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final breeds = await service1.fetchDogBreeds();
      setState(() {
        dogBreeds = breeds;
      });
    } catch (e) {
      // Handle error here
    }
  }

  void filterBreeds() {
    setState(() {
      filteredBreeds = dogBreeds
          .where((breed) =>
              breed.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('Images/dog_image.webp',),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height:30.0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                    filterBreeds();
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Enter a dog breed',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  filled: true,
                  fillColor: Colors.white38,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredBreeds.length,
                itemBuilder: (context, index) {
                  final breedName = filteredBreeds[index];
                  return ListTile(
                    title: Text(breedName),
                    onTap: () {
                      print('Selected breed: $breedName');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ResultPage();
                          },
                        ),
                      );
                    },
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


