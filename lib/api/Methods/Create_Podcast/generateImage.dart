import 'package:http/http.dart' as http;

Future<String> generateImageAPI(String prompt) async {
  String updatedPrompt = prompt.replaceAll(' ', '_');
  String url = 'https://image.pollinations.ai/prompt/$updatedPrompt';

  // Poll the website to check if the image is ready
  while (true) {
    final response = await http.head(Uri.parse(url));
    if (response.statusCode == 200) {
      // Image is ready
      return url;
    }
    await Future.delayed(const Duration(seconds: 1)); // retry
  }
}
