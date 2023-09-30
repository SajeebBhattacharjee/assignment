import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isLandscape = orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: isLandscape
            ? _buildLandscapeLayout()
            : _buildPortraitLayout(),
      ),
    );
  }

  Widget _buildPortraitLayout() {
    return Column(
      children: <Widget>[
        SizedBox(height: 8.0),
        Center(
          child: CircleAvatar(
            radius: 160,
            backgroundImage: NetworkImage(
                'https://wallpapers.com/images/hd/naruto-profile-pictures-sa1tekghfajrr928.jpg'),
          ),
        ),
        SizedBox(height: 16.0),
        Center(
          child: Text(
            'Naruto Uzumaki',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          'This is the profile app task given to me by the Ostad team, and now I am completing it with flutter.',
          style: TextStyle(
            fontSize: 18,
          ),
        ),

        SizedBox(height: 16.0),
        _buildPhotoGrid(3),
      ],
    );
  }

  Widget _buildLandscapeLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: CircleAvatar(
              radius: 160,
              backgroundImage: NetworkImage(
                  'https://wallpapers.com/images/hd/naruto-profile-pictures-sa1tekghfajrr928.jpg'),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Naruto Uzumaki',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'This is the profile app task given to me by the Ostad team, and now I am completing it with flutter.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 16.0),
              _buildPhotoGrid(3),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoGrid(int crossAxisCount) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: crossAxisCount,
      children: List.generate(6, (index) {
        final imageUrl =
            'https://images.immediate.co.uk/production/volatile/sites/3/2023/04/naruto-762b09d.jpg?resize=768,574';
        return Padding(
          padding: EdgeInsets.all(4.0),
          child: Image.network(imageUrl, fit: BoxFit.cover),
        );
      }),
    );
  }
}
