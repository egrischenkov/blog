import 'dart:developer';

import 'package:blog/core/assets/res/resources.dart';
import 'package:blog/core/common/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

const _githubUrl = 'https://github.com/egrischenkov';
const _tgUrl = 'https://t.me/egrischenkov';
const _linkedinUrl = 'https://www.linkedin.com/in/egor-grishchenkov-424ab3282/';
const _vkUrl = 'https://vk.com/id802661280';

/// Site's footer.
///
/// Contains links to social accounts.
class FooterWidget extends StatelessWidget {
  /// @nodoc
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = context.colorsTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 64),
          const Divider(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialMediaButton(
                url: _githubUrl,
                iconPath: AppSvgIcons.icGithub,
                color: colorsTheme.onSecondary,
              ),
              const SizedBox(width: 8),
              const _SocialMediaButton(
                url: _tgUrl,
                iconPath: AppSvgIcons.icTelegram,
              ),
              const SizedBox(width: 8),
              const _SocialMediaButton(
                url: _linkedinUrl,
                iconPath: AppSvgIcons.icLinkedin,
              ),
              const SizedBox(width: 8),
              _SocialMediaButton(
                url: _vkUrl,
                iconPath: AppSvgIcons.icVk,
                color: colorsTheme.onSecondary,
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _SocialMediaButton extends StatelessWidget {
  final String url;
  final String iconPath;
  final Color? color;

  const _SocialMediaButton({
    required this.url,
    required this.iconPath,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final color = this.color;
    return SizedBox.square(
      dimension: 44,
      child: IconButton(
        onPressed: () => _launchUrl(url),
        icon: SvgPicture.asset(
          iconPath,
          colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      log('Could not launch $urlString');
    }
  }
}
