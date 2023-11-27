import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_sihotel/bloc/sihotel/sihotel_bloc.dart';
import 'package:project_sihotel/models/table_hotel_model.dart';
import 'package:project_sihotel/ui/hotel/sihotel_awal.dart';
import 'package:project_sihotel/ui/hotel/sihotel_deskripsi.dart';

class SihotelData extends StatelessWidget {
  static const routeName = '/sihoteldata';

  const SihotelData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: const Text('Informasi Hotel'),
      ),
      body: BlocProvider(
        create: (context) => SihotelBloc()..add(SihotelIndexEvent()),
        child: BlocBuilder<SihotelBloc, SihotelState>(
          builder: (context, state) {
            if (state is SihotelLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SihotelError) {
              return Center(child: Text(state.message));
            } else if (state is SihotelLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                itemBuilder: (context, index) {
                  SihotelModel sihotelModel = state.listSihotelModel[index];
                  return Card(
                    elevation: 2.0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SihotelDeskripsiData(sihotelModel: sihotelModel),
                          ),
                        );
                      },
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        title: Text(
                          sihotelModel.name.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8.0),
                            Text(
                              "Location: ${sihotelModel.location ?? ''}",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              "Rating: ${sihotelModel.rating ?? ''}",
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            SizedBox(height: 8.0),
                          ],
                        ),
                        leading: sihotelModel.image != null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            sihotelModel.image!,
                            width: 56.0,
                            height: 56.0,
                            fit: BoxFit.cover,
                          ),
                        )
                            : SizedBox.shrink(),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1.0,
                    height: 0.0,
                    color: Colors.grey[300],
                  );
                },
                itemCount: state.listSihotelModel.length,
              );
            }

            // Default return statement for all other cases
            return Container();
          },
        ),
      ),
    );
  }
}
