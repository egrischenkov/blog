part of 'package:blog/features/home/presentaition/home_page.dart';

/// Widgt with information about me.
class AboutSectionWidget extends StatelessWidget {
  /// @nodoc
  const AboutSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final colorsTheme = context.colorsTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          32.h,
          Text(l10n.aboutSectionTitle, style: textTheme.bold24),
          SizedBox(
            width: 816,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(l10n.aboutSectionGreetings, style: textTheme.bold18.copyWith(color: colorsTheme.inactive)),
                const SizedBox(height: 16),
                Text(l10n.aboutSectionMyself, style: textTheme.bold18.copyWith(color: colorsTheme.inactive)),
                const SizedBox(height: 16),
                Text(l10n.aboutSectionWork, style: textTheme.bold18.copyWith(color: colorsTheme.inactive)),
                const SizedBox(height: 16),
                Text(l10n.aboutSectionHobby, style: textTheme.bold18.copyWith(color: colorsTheme.inactive)),
                const SizedBox(height: 16),
                Text(l10n.aboutSectionEnding, style: textTheme.bold18.copyWith(color: colorsTheme.inactive)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
