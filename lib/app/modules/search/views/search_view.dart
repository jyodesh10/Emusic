import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/constants.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainBackground,
        appBar: AppBar(
          toolbarHeight: 60.sp,
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: 22.sp,
                  color: Colors.black,
                )),
          ),
          title: Text(
            'Search',
            style: titleStyle.copyWith(color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              // padding: EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    // blurStyle: BlurStyle.solid,
                    // spreadRadius: 2,
                    color: AppColors.shadow,
                    offset: Offset(0, 2))
              ], color: Colors.white, borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                      focusColor: AppColors.primaryClr,
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'songs, albums or artists'),
                  onTap: () {
                    showSearch(
                        context: context, delegate: CustomSearchDelegate());
                  },
                ),
              ),
            )
          ],
        ));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Ma ra malai',
    'Cobweb',
    'Albatross',
    'Adhar',
    'Jindabaad',
    'Hatkela',
    'Putali',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];

    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );

    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}
