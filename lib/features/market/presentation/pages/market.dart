import 'package:cropmaster/features/market/presentation/widgets/market_dialogue_widget.dart';
import 'package:flutter/material.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MarketDialogueWidget(),

          
        ],
      ),
    );
  }
}
