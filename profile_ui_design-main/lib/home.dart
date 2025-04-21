import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'appstate.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  double iconButtonPaddingHorizontalRange = const RangeValues(5, 15).end;
  double iconButtonPaddingVerticalRange = const RangeValues(5, 15).end;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<AppState>();
    final theme = Theme.of(context);
    final displayStyle = theme.textTheme.headlineSmall!.copyWith(
      color: const Color.fromARGB(255, 0, 0, 0),
      fontWeight: FontWeight.w700,
    );
    final bodyStyle = theme.textTheme.bodyMedium!.copyWith(
      color: const Color.fromARGB(255, 0, 0, 0),
    );
    final iconButtonStyle = IconButton.styleFrom(
      foregroundColor: Colorz().softBrown,
      backgroundColor: Colorz().softBeige,
      elevation: 4,
      padding: EdgeInsets.symmetric(
          horizontal: iconButtonPaddingHorizontalRange,
          vertical: iconButtonPaddingVerticalRange),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
    return Card(
      color: Colorz().softBeige,
      shadowColor: const Color.fromARGB(99, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: appState.image,
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: IconButton(
                    style: iconButtonStyle,
                    onPressed: () => appState.dislikeProfile(),
                    icon: const Icon(Icons.thumb_down),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: IconButton(
                    style: iconButtonStyle,
                    onPressed: () => appState.likeProfile(),
                    icon: const Icon(Icons.thumb_up),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${appState.firstName} ${appState.lastName}, ${appState.age}",
                style: displayStyle,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
              child: Text(appState.description, style: bodyStyle),
            ),
          ],
        ),
      ),
    );
  }
}
