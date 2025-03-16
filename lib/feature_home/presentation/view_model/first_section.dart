import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/movie_model.dart';
import '../../../shared/app_theme.dart';
import '../../../shared/custom_elevated_button.dart';

class FirstSection extends StatelessWidget {
  final MovieDetails movieDetails;
  final VoidCallback onTap;
  final VoidCallback save;
  final bool isSaved;

  const FirstSection({
    Key? key,
    required this.movieDetails,
    required this.onTap,
    required this.save,
    required this.isSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          Image.network(
            movieDetails.backgroundImage,
            fit: BoxFit.fitHeight,
            width: double.infinity,
            height: screenSize.height * .725,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: AppTheme.primary,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          size: 35,
                          Icons.arrow_back_ios_sharp,
                        ),
                      ),
                      InkWell(
                        onTap: save,
                        child: SvgPicture.asset(
                          'assets/icons/save.svg',
                          colorFilter: ColorFilter.mode(
                            isSaved ? AppTheme.primary : AppTheme.gray,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.23),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.yellow,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        size: 50,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.2),
                  Text(
                    movieDetails.title,
                    textAlign: TextAlign.center,
                    style: textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    movieDetails.year.toString(),
                    style: textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.lightGray,
                    ),
                  ),
                  const SizedBox(height: 15),
                  CustomElevatedButton(
                    lable: 'Watch',
                    onpressed: onTap,
                    widthOfElevatedButton: 1,
                    buttonColor: AppTheme.red,
                    labelColor: AppTheme.primary,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _customContainer(
                          context: context,
                          iconName: 'assets/icons/heart.svg',
                          text: movieDetails.likeCount.toString()),
                      _customContainer(
                          context: context,
                          iconName: 'assets/icons/time.svg',
                          text: movieDetails.runtime.toString()),
                      _customContainer(
                          context: context,
                          iconName: 'assets/icons/star.svg',
                          text: movieDetails.rating.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _customContainer({
    required BuildContext context,
    required String iconName,
    required String text,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);

    return Container(
      height: screenSize.width * 0.11,
      width: screenSize.width * 0.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppTheme.gray,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(iconName),
          const SizedBox(width: 10),
          Text(
            text,
            style: textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
