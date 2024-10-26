import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_management_system/presentation/state_holders/ai_content_controller.dart';
import 'package:learning_management_system/presentation/ui/utils/assets_path.dart';

class StudentAiContentScreen extends StatefulWidget {
  const StudentAiContentScreen({super.key});

  @override
  State<StudentAiContentScreen> createState() => _StudentAiContentScreenState();
}

class _StudentAiContentScreenState extends State<StudentAiContentScreen> {
  final TextEditingController _promptController = TextEditingController();
  String _lastUserMessage = ''; // Store the last user message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('AI Text'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Display the last user message
            if (_lastUserMessage.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(_lastUserMessage),
                  const SizedBox(width: 8),
                  Image.asset(AssetsPath.aiUserIcon, height: 40, width: 40),
                ],
              ),
            const SizedBox(height: 30),

            // AI response section
            GetBuilder<AiContentController>(builder: (aiContentController) {
              return Visibility(
                visible: !aiContentController.inProgress,
                replacement: const Center(child: CircularProgressIndicator()),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AssetsPath.aiIcon, height: 40, width: 40),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        aiContentController.reply,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 65),

            // TextFormField and Send button
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _promptController,
                    decoration: const InputDecoration(
                      hintText: "Enter Your Query",
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size.fromWidth(12),
                  ),
                  onPressed: () {
                    _onTapSendButton();
                  },
                  child: const Text('Send'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onTapSendButton() async {
    String promptText = _promptController.text.trim();
    if (promptText.isNotEmpty) {
      // Update the last user message
      setState(() {
        _lastUserMessage = promptText; // Store the last user message
      });

      // Get AI content
      await Get.find<AiContentController>().getAiContent(promptText);

      // Clear the input field after the request is sent
      _promptController.clear();
    }
  }
}
