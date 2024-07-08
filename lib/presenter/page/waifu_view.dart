import 'package:exempla_change_notifier/presenter/store/waifu_store.dart';
import 'package:flutter/material.dart';


class WaifuView extends StatefulWidget {
  const WaifuView({super.key});

  @override
  State<WaifuView> createState() => _WaifuViewState();
}

class _WaifuViewState extends State<WaifuView> {
  final store = WaifuStore();

  @override
  void initState()  {
    store.addListener((){
      setState(() {});
    });
    super.initState();
  }

  @override
  dispose(){
    store.dispose();
    super.dispose();
  }
  
  Widget _buildLoading() {
   switch(store.state){
     case WaifuState.INIT:
       return const Center(child: Text('Press the button to get a waifu'));
     case WaifuState.LOADING:
       return Container(width: MediaQuery.of(context).size.width - 20,height: MediaQuery.of(context).size.height/2, child: const Center(child: CircularProgressIndicator()));
     case WaifuState.SUCCESS:
       return Image.network(store.waifu.url!,width: MediaQuery.of(context).size.width - 20,height: MediaQuery.of(context).size.height/2,errorBuilder: (context, error, stackTrace) {
          return const Text('Failed to load image');
       });
     case WaifuState.FAILURE:
       return const Text('Failed to get a waifu');
   } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildLoading(),
          Center(
            child: ElevatedButton(
              onPressed: store.getWaifu,
              child: const Text('Get Waifu'),
            ),
          ),
        ],
      
      ),
    );
  }
}