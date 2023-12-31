import 'package:flutter/material.dart';
import 'package:pupedia_app/api_service.dart';
import 'result_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ApiService service1 = ApiService();

  List<String> dogBreeds = []; //store all the dog breeds that fetch from API.
  List<String> filteredBreeds = [];  //store the dog breeds that are related to the user typed letter in search query.
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  //fetches the list of dog breeds by calling the "fetchDogBreeds" method from the "ApiService".
  Future<void> fetchData() async {
    try {
      final breeds = await service1.fetchDogBreeds();
      setState(() {
        dogBreeds = breeds; //If successful, it updates the "dogBreeds" list in the state.
      });
    } catch (e) {
      Text('Error fetching the dog breed.');
    }
  }

  /*dynamically update the list of displayed dog breeds in response to the user's search input.
  It allows the user to search for specific dog breeds by entering text into the search bar,
  and only the breeds that match the search query are displayed in the UI.*/
  void filterBreeds() {
    setState(() {
      filteredBreeds = dogBreeds
          .where((breed) =>
              breed.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList(); //convert the filtered results back into a list.
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
            image: AssetImage(
              'Images/dog_image.webp',
            ),
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
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
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white38,
                      border:
                          Border.all(width: 1, color: Colors.orangeAccent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: ListTile(
                      title: Text(breedName),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ResultPage(
                                selectedBreed: breedName,
                              );
                            },
                          ),
                        );
                      },
                    ),
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
