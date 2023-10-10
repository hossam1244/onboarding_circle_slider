// TODO: Put public facing types in this file.
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  final int currentPage;
  final int totalPages;
  final Function onCompleted;
  final Function onChange;
  final Color? checkIconColor;
  final Color? arrowIconColor;


  OnBoardingScreen(
      this.onCompleted, this.onChange, this.checkIconColor, this.arrowIconColor,
      {super.key, required this.currentPage, required this.totalPages});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 1;
  final int _totalPages = 3;

  _updatePage() {
    if (_currentPage == _totalPages) {
      widget.onCompleted;
    }

    setState(() {
      _currentPage++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _determineOnBoardingItemStepWidget(),
          Positioned(
              bottom: 50,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Align(
                    alignment: Alignment.center,
                    child: _stepProgressIndicator()),
              )),
        ],
      ),
    );
  }

  Widget _buildOnBoardingItem(
      String title, String description, String imageAsset) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.asset(
            imageAsset,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 160,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: _titleAndDescription(title, description),
            ),
          )
        ],
      ),
    );
  }

  Widget _titleAndDescription(String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: ReserveItTheme.instance
              .getStyle(ReserveItTheme.heading6Bold18, CustomColors.white),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          textAlign: TextAlign.center,
          style: ReserveItTheme.instance
              .getStyle(ReserveItTheme.bodyText10Regular14, CustomColors.white),
        ),
      ],
    );
  }

  // Widget _stepProgressIndicator() {
  //   return CircularStepProgressIndicator(
  //     totalSteps: _totalPages,
  //     currentStep: _currentPage,
  //     stepSize: 5,
  //     selectedColor: CustomColors.primaryYellow,
  //     unselectedColor: CustomColors.yellowColorFA,
  //     padding: 0,
  //     width: 73,
  //     height: 73,
  //     selectedStepSize: 5,
  //     roundedCap: (_, __) => true,
  //     child: Center(
  //       child: Container(
  //         width: 60,
  //         height: 60,
  //         margin: const EdgeInsets.all(3),
  //         decoration: BoxDecoration(
  //           color: _completedPages()
  //               ? CustomColors.primaryYellow
  //               : CustomColors.white,
  //           borderRadius: BorderRadius.circular(30),
  //         ),
  //         child: InkWell(
  //           onTap: _updatePage,
  //           child: Center(
  //             child: Icon(
  //               _completedPages()
  //                   ? FontAwesomeIcons.check
  //                   : FontAwesomeIcons.arrowRight,
  //               color: _completedPages()
  //                   ? CustomColors.white
  //                   : CustomColors.primaryYellow,
  //               size: 20,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  bool _completedPages() {
    if (_currentPage == _totalPages) {
      return true;
    } else {
      return false;
    }
  }
}
