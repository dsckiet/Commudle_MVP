import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:commudle/models/communities_model.dart';
import 'package:commudle/providers/communities_providers.dart';
import 'package:commudle/routes/community_screen.dart';

class CommunitiesWidget extends StatefulWidget {
  @override
  _CommunitiesWidgetState createState() => _CommunitiesWidgetState();
}

class _CommunitiesWidgetState extends State<CommunitiesWidget> {
  // bool _isInit = true;
  // bool _isLoading = false;
  // bool _isDataAvl = false;
  // String _errorMsg;
  //List<CommunitiesModel> _communities = [];

  // void didChangeDependencies() async {
  //   if (_isInit) {
  //     setState(
  //       () {
  //         _isLoading = true;
  //       },
  //     );
  //     try {
  //       await Provider.of<CommunitiesProviders>(context)
  //           .viewCommunities(context)
  //           .then(
  //         (_) {
  //           setState(
  //             () {
  //               _communities =
  //                   Provider.of<CommunitiesProviders>(context).communitiesData;
  //               _isDataAvl =
  //                   Provider.of<CommunitiesProviders>(context).isDataAvl;

  //               _errorMsg = Provider.of<CommunitiesProviders>(context).errorMsg;

  //               _isLoading = false;
  //               //print(json.decode(_communities);
  //             },
  //           );
  //         },
  //       );
  //     } catch (error) {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  void initState() {
    // _isInit = true;
    // _isLoading = false;
    // _isDataAvl = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Communities",
                style: Theme.of(context).textTheme.title,
              ),
              GestureDetector(
                onTap: navigationPage,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Product Sans',
                        color: const Color(0xFFDB4437),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
        // _isLoading
        //     ? Center(
        //         child: Container(
        //             padding: EdgeInsets.all(20),
        //             width: 100,
        //             height: 100,
        //             child: CircularProgressIndicator(
        //                 // valueColor:
        //                 //     AlwaysStoppedAnimation<Color>(Color(0XFFB4344D)),
        //                 )))
        //     : _isDataAvl == false
        //         ? Container(
        //             padding: EdgeInsets.all(10),
        //             height: 40.0,
        //             child: FittedBox(
        //               //fit: BoxFit.fitWidth,
        //               child: Text(
        //                 'No Data to Show',
        //                 style: TextStyle(
        //                   fontSize: 10.0,
        //                   fontFamily: 'Product Sans',
        //                   fontWeight: FontWeight.w600,
        //                   color: const Color(0xFF707070),
        //                 ),
        //               ),
        //             ),
        //           )
        //         :
        Container(
          margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
          height: 100.0,
          child: Container(
            child: Consumer<CommunitiesProviders>(
              builder: (_, commudata, ch) => ListView.builder(
                padding: EdgeInsets.only(left: 20.0),
                // itemCount: _communities.length,
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 2.0, right: 2.0),
                    child: InkWell(
                      child: FittedBox(
                        child: Container(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            color: const Color(0xFFF9F9F9),
                            elevation: 6.0,
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: 50,
                                    height: 50,
                                    child: Image(
                                      // height: 40.0,
                                      // width: 40.0,
                                      image: AssetImage(
                                          'assets/images/temp-wtm.png'),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'WTM BVP',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: const Color(0xFF707070),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommunityScreen(),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  void navigationPage() {
    Navigator.pushNamed(context, '/CommunitiesListScreen');
  }
}
