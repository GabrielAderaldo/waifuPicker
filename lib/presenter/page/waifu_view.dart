import 'package:exempla_change_notifier/presenter/store/waifu_store.dart';
import 'package:flutter/material.dart';


class WaifuView extends StatefulWidget {
  const WaifuView({super.key});

  @override
  State<WaifuView> createState() => _WaifuViewState();
}

class _WaifuViewState extends State<WaifuView> {
  final store = WaifuStore();

  

  //PEGAR AS INFORMAÇÕES DA CONTROLLER -> STORE, FAZER MOSTRAR NA TELA ESSAS INFORMAÇÕES.
  // STORE -> GETWAIFU -> TODA VEZ QUE EU APERTAR UM BOTÃO APARECER UM LOADING -> MUDAR DE WAIFU.
  // CLOSURE -> FUNÇÃO ANONIMA QUE RETORNA OUTRA FUNÇÃO. -> CALLBACK
  // function teste(callback){
  //      callback();
  // } 

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
       return const Center(child: CircularProgressIndicator());
     case WaifuState.SUCCESS:
       return Image.network(store.waifu.url!,errorBuilder: (context, error, stackTrace) {
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