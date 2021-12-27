import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:provider/provider.dart';

import 'package:babysitter/components/app_text.dart';
import 'package:babysitter/components/profile_card.dart';
import 'package:babysitter/models/profile.dart';
import 'package:babysitter/providers/profiles.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 700), () {
      Provider.of<ProfilesState>(context, listen: false).fetchAllProfiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Profile> profiles =
        Provider.of<ProfilesState>(context, listen: false).profiles;

    final double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          ...createCardPage(
              profiles.length > 4 ? 4 : profiles.length - 1, width),
          Expanded(
            child: Stack(
              children: getCardDeck(profiles),
            ),
          ),
        ],
      ),
    );
  }

  List<Swipable> getCardDeck(List<Profile> profiles) {
    List<Swipable> cardDeck = [];
    for (int i = 0; i < profiles.length; ++i) {
      cardDeck.add(
        Swipable(
          verticalSwipe: false,
          child: ProfileCard(profile: profiles[i]),
          onSwipeLeft: (_) => onSwipe(i),
          onSwipeRight: (_) => onSwipe(i),
        ),
      );
    }
    cardDeck.add(welcomeSwipeCard());
    return cardDeck;
  }

  List<Widget> createCardPage(int count, double width) {
    List<Widget> cardPaginator = [];
    for (var i = count; i > 0; i--) {
      cardPaginator.add(cardPage(i, width));
    }
    return cardPaginator;
  }

  Widget cardPage(int page, double width) {
    return Container(
      height: 20,
      width: width - (page * 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFf1f1f1),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(color: Color(0xFFf1f1f1), blurRadius: 5.0),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      // child: AppText(text: ''),
    );
  }

  Swipable welcomeSwipeCard() {
    return Swipable(
      verticalSwipe: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        height: MediaQuery.of(context).size.height * 0.65,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/welcome.png'),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 16),
                child: AppText(
                  text: '!איזה כיף עכשיו תוכלו למצוא עבודה בקלות',
                  size: 20,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 48),
              Image.asset('images/left-arrow.png'),
              const SizedBox(height: 16),
              const AppText(text: 'החליקו שמאלה', size: 20),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
        ),
        decoration: const BoxDecoration(color: Colors.white70),
      ),
      onSwipeLeft: (_) {},
      onSwipeRight: (_) {},
    );
  }

  void onSwipe(i) {
    Provider.of<ProfilesState>(context, listen: false).removeProfile(i);
  }
}
