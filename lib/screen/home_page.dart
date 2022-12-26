import 'package:flutter/material.dart';
import 'package:my_first_app/services/video_service.dart';
import 'package:my_first_app/utils/constants.dart';
import 'package:my_first_app/widgets/videos_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orange Valley CAA'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        color: backgroundColor,
        child: FutureBuilder(
            future: getVideoFromApi(),
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
}
