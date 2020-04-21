import 'package:flutter/material.dart';
import 'package:japanese_explorer/Pages/AdditionalData/VideoScreen.dart';
import '../Core/ApiService.dart';
import '../Data/Channel.dart';
import '../Data/Video.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  Channel _channel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initState();
  }

  _initState() async {
    Channel channel = await APIService.instance.fetchChannel(channelID: 'UCsQCbl3a9FtYvA55BxdzYiQ');
    setState(() {
      _channel = channel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Japanese videos'),
      ),
      body: _channel != null ? NotificationListener(
        onNotification: (ScrollNotification scrollDetails)  {
          if (
            !_isLoading && 
            _channel.videos.length != int.parse(_channel.videoCount) &&
            scrollDetails.metrics.pixels == scrollDetails.metrics.maxScrollExtent
          ) _loadMoreVideos();
          return false;
        },
        child: ListView.builder(
        itemCount:  1 + _channel.videos.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _buildProfile();
          }
          Video video = _channel.videos[index -1];
          return _buildVideo(video);
        },
      ),
      ): Center (
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Theme.of(context).primaryColor
          ),
        ),
      )
    );
  }

  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance.fetchVideosFromPlaylist(playlistID: _channel.uploadPlayList);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }

  _buildProfile() {
    return Container (
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      height: 100.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0
          )
        ]
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35.0,
            backgroundImage: NetworkImage(_channel.pictureUrl),
          ),
          SizedBox(width: 12.0,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _channel.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${_channel.subscribers} subscribers',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        )
        ),
      child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      height: 140.0,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 6.0,
          )
        ]
      ),
      child: Row(
        children: <Widget>[
          Image(
            width: 150.0,
            image: NetworkImage(video.thumbnailUrl),
          ),
          SizedBox(width: 10.0,),
          Expanded(
            child: Text(
              video.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          )
        ],
      ),
    ),
    );
  }
}