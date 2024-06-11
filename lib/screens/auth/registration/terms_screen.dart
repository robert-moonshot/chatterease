import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Welcome to Chatter Ease!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'By accessing or using Chatter Ease, you agree to be bound by these terms and conditions. Please read them carefully before using the app.',
          ),
          const SizedBox(height: 20.0),
          _buildTermsAndConditionsItem(
            '1. Acceptance of Terms',
            'By downloading, installing, or using Chatter Ease, you agree to comply with and be bound by these Terms and Conditions.',
          ),
          _buildTermsAndConditionsItem(
            '2. User Registration',
            '- You must provide accurate, complete, and current registration information.\n'
                '- You are responsible for maintaining the confidentiality of your account and password.',
          ),
          _buildTermsAndConditionsItem(
            '3. User Conduct',
            '- You agree not to use Chatter Ease for any unlawful purpose or in any way that violates these Terms and Conditions.\n'
                '- You agree not to harass, abuse, or harm other users of the app.',
          ),
          _buildTermsAndConditionsItem(
            '4. Privacy',
            '- Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and disclose information about you.',
          ),
          _buildTermsAndConditionsItem(
            '5. Intellectual Property',
            '- All content, features, and functionality provided by Chatter Ease are owned by us and are protected by international copyright, trademark, patent, trade secret, and other intellectual property laws.',
          ),
          _buildTermsAndConditionsItem(
            '6. Limitation of Liability',
            '- We shall not be liable for any indirect, incidental, special, consequential, or punitive damages, or any loss of profits or revenues.',
          ),
          _buildTermsAndConditionsItem(
            '7. Modifications',
            '- We reserve the right to modify or replace these Terms and Conditions at any time. If a revision is material, we will provide at least 30 days\' notice prior to any new terms taking effect.',
          ),
          _buildTermsAndConditionsItem(
            '8. Governing Law',
            '- These Terms and Conditions shall be governed and construed in accordance with the laws of [Your Country], without regard to its conflict of law provisions.',
          ),
          _buildTermsAndConditionsItem(
            '9. Contact Us',
            '- If you have any questions about these Terms and Conditions, please contact us at [Your Contact Email].',
          ),
          _buildTermsAndConditionsItem(
            '10. File Storage',
            '- Files sent through Chatter Ease will be automatically deleted after 24 hours to save storage space. We are not responsible for any loss of data due to the deletion of files. Please ensure that you have backed up any important files before sending them through the app.',
          ),
        ],
      ),
    );
  }

  Widget _buildTermsAndConditionsItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(content),
        const SizedBox(height: 15.0),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TermsAndConditionsScreen(),
  ));
}
