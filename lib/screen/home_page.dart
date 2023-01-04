import 'package:flutter/material.dart';
import 'package:my_first_app/services/video_service.dart';
import 'package:my_first_app/utils/constants.dart';
import 'package:my_first_app/utils/helper.dart';
import 'package:my_first_app/widgets/videos_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedFilter = VideoSort.id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orange Valley CAA'),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: _onChangeFilter,
            icon: Icon(Icons.sort),
            offset: Offset(0, 100),
            itemBuilder: (context) => [
              PopupMenuItem(value: VideoSort.id, child: Text('Par défaut')),
              PopupMenuItem(value: VideoSort.name, child: Text('Par nom')),
              PopupMenuItem(
                  value: VideoSort.duration, child: Text('Par durée')),
            ],
          ),
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: FutureBuilder(
            future: getVideoFromApi(filter: _selectedFilter),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              else if (snapshot.hasError)
                return Center(child: Text(snapshot.error));
              else
                return VideosGrid(videos: snapshot.data);
            }),
      ),
    );
  }

  void _onChangeFilter(VideoSort choice) {
    if (choice != _selectedFilter) {
      setState(() {
        _selectedFilter = choice;
      });
    }
  }
}
