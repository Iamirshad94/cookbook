import 'package:cookbook/cuisine_provider.dart';
import 'package:cookbook/global.dart';
import 'package:cookbook/home_page.dart';
import 'package:cookbook/recipe_list.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = new TextEditingController();
  String filter;
  var focusNode = new FocusNode();
  bool descTextShowFlag = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var found = false;

  // No result found page ui container
  Widget noResultFound(){
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 15.0,
      ),
      child: InkWell(
        child: Stack(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start ,
                  children: <Widget>[
                    Text(
                      "No Result Found.",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    new Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text("We can't find any item matching your search.",
                      style: TextStyle(fontSize: 14.0, color: Colors.white54),
                      textAlign: TextAlign.left,)
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  // Default search page UI container
  Widget defaultSearchPage(){
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 15.0,
      ),
      child: InkWell(
        child: Stack(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start ,
                  children: <Widget>[
                    Text(
                      "Find what to watch next.",
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    new Padding(padding: EdgeInsets.only(top: 10.0)),
                    Text("Search for shows for the commute, movies to help unwind, or your go-to genres.",
                      style: TextStyle(fontSize: 14.0, color: Colors.white54),
                      textAlign: TextAlign.left,
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget searchItemColumn(index){
    var recipeVar = Provider
        .of<CuisineProvider>(context, listen: false)
        .cuisineElement;
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: <Widget>[
        new Container(height: 2.0),
        new Text(recipeVar[index].title,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
          maxLines: 1,
        ),
        new Container(height: 10.0),
        // new Text(
        //   recipeVar[index].description,
        //   style: TextStyle(
        //       color: Colors.white54),
        //   maxLines: 2,
        // ),
        // new Separator(),
        new Row(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: <Widget>[
            new Expanded(
                flex: 1,
                child: new Container(
                  child: new Row(
                      mainAxisSize:
                      MainAxisSize.min,
                      children: <Widget>[
                        // new RatingInformationSearch(
                        //     movieTvList[index])
                      ]),
                )),
            new Container(
              width: 32.0,
            ),
          ],
        ),
      ],

    );
  }

  // List container
  Widget listContainer(index){
    var recipeVar = Provider
        .of<CuisineProvider>(context, listen: false)
        .cuisineElement   ;
    return

      Column(
         children: [
          InkWell(
            onTap: (){
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: RecipeListPage(index: index,),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              child: Center(
                child: Text("${recipeVar[index].title}",style: TextStyle(fontFamily: 'cursive',fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),
          ),
           Divider(
             color: Colors.grey,
           )
        ],
      );
  }

  // Search result item column
  Widget searchResultItemColumn(){
    var recipeVar = Provider
        .of<CuisineProvider>(context, listen: false)
        .cuisineElement;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        new Expanded(
            child: searchController.text == '' ? defaultSearchPage() : Padding(padding: EdgeInsets.only(top: 10.0),
                child: ListView.builder(
                  itemCount: recipeVar.length,
                  itemBuilder: (context, index) {
                    return '${recipeVar[index].title}'
                        .toLowerCase()
                        .contains(filter.toLowerCase())
                        ? listContainer(index)
                        : Container(
                      color: Colors.white,
                    );
                  },
                )
            )
        ),
      ],
    );
  }

  // Search TexField
  Widget searchField(){
    return TextField(
      focusNode: focusNode,
      controller: searchController,
      style: TextStyle(fontSize: 14.0),
      decoration: InputDecoration(
        hintText: 'Search for a show, movie, etc.',
        border: InputBorder.none,
      ),
    );
  }

  //  App bar
  Widget appBar() {
    return AppBar(

      leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              child:BottomNavigationBar(),
            ),
          );        },
      ),
      title: searchField(),

      backgroundColor: base_color,
      actions: <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: searchController.text == '' ? new IconButton(
            icon: new Icon(Icons.search,color: Colors.grey.withOpacity(0.3)), onPressed: (){
            FocusScope.of(context).requestFocus(focusNode);
          },) : new IconButton(icon: new Icon(Icons.clear,color: Colors.white.withOpacity(1.0)), onPressed: () {
            searchController.clear();
          },
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var recipeVar = Provider
        .of<CuisineProvider>(context, listen: false)
        .cuisineElement;

    if(searchController.text == '' || searchController.text == null){
      found = true;
    } else{
      for(var i=0; i < recipeVar.length; i++){
        var watchName =  '${recipeVar[i].title}';
        var watchListItemName = watchName.toLowerCase().contains(filter.toLowerCase());
        if(watchListItemName == true){
          found = true;
          break;
        }else{
          found = false;
        }
      }
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(),
      body: found == false ?  noResultFound() : searchResultItemColumn(),
      backgroundColor: Colors.white,
    );
  }
}
