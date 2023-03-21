import 'package:flutter/material.dart';
import 'package:recipe_app/screens/search.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      //Search Wala Container

      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if ((searchController.text).replaceAll(" ", "") ==
                  "") {
                print("Blank search");
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Search(searchController.text)));
              }
            },
            child: Container(
              child: Icon(
                Icons.search,
                color: Colors.blueAccent,
              ),
              margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
            ),
          ),
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Let's Cook Something!"),
            ),
          )
        ],
      ),
    );
  }
}
