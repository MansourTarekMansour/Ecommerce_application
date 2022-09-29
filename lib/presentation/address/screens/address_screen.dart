// import 'package:flutter/material.dart';
//
// class AddressScreen extends StatelessWidget {
//   const AddressScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//     );
//   }
// }




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:man_shop_app/presentation/address/bloc/address_cubit.dart';
import 'package:man_shop_app/presentation/address/widgets/location_search_dialog.dart';
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late CameraPosition _cameraPosition;
  @override
  void initState(){
    super.initState();
    _cameraPosition=CameraPosition(target: LatLng(
        45.521563,-122.677433
    ), zoom: 17);
  }

  late GoogleMapController _mapController;
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AddressCubit, AddressState>(

  builder: (context, state) {
    final addressCubit = BlocProvider.of<AddressCubit>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
                onMapCreated: (GoogleMapController mapController) {
                  _mapController = mapController;
                  //addressCubit.setMapController(mapController);
                },
                initialCameraPosition: _cameraPosition
            ),
            Positioned(
              top: 100,
              left: 10, right: 20,
              child: GestureDetector(
                onTap:() {
                  LocationSearchDialog(mapController: _mapController);
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(children: [
                    Icon(Icons.location_on, size: 25, color: Theme.of(context).primaryColor),
                    SizedBox(width: 5),
                    //here we show the address on the top
                    Expanded(
                      child: Text(
                        '${addressCubit.pickPlaceMark.name ?? ''} ${addressCubit.pickPlaceMark.locality ?? ''} '
                            '${addressCubit.pickPlaceMark.postalCode ?? ''} ${addressCubit.pickPlaceMark.country ?? ''}',
                        style: TextStyle(fontSize: 20),
                        maxLines: 1, overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.search, size: 25, color: Theme.of(context).textTheme.bodyText1!.color),
                  ]),
                ),
              ),
            ),
          ],
        )
    );
  },
);
  }
}