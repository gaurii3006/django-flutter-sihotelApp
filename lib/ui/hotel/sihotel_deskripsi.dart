import 'package:flutter/material.dart';
import 'package:project_sihotel/models/table_hotel_model.dart';

class SihotelDeskripsiData extends StatelessWidget {
  final SihotelModel sihotelModel;

  SihotelDeskripsiData({required this.sihotelModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sihotelModel.name ?? 'Hotel Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (sihotelModel.image != null)
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(sihotelModel.image!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return _buildModalContent(context);
                      },
                    );
                  },
                  child: Text('Informasi Kamar'),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Name:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(
                sihotelModel.name ?? '',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Location:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(
                sihotelModel.location ?? '',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Contact Email:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(
                sihotelModel.contact_email ?? '',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Contact Phone:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(
                sihotelModel.contact_phone ?? '',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Description:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(
                sihotelModel.description ?? '',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Rating:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              Text(
                sihotelModel.rating?.toString() ?? '',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModalContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          // Text(
          //   'Room Type:',
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 18.0,
          //   ),
          // ),
          // Text(
          //   sihotelModel.room_type ?? '',
          //   style: TextStyle(
          //     fontSize: 16.0,
          //   ),
          // ),
          SizedBox(height: 16.0),
          Text(
            'Total Rooms:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Text(
            sihotelModel.total_rooms?.toString() ?? '',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Price',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
          Text(
            sihotelModel.price ?? '',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 16.0),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Menutup modal
                },
                child: Text('Close'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
