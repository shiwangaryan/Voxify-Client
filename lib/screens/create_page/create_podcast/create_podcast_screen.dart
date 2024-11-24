import 'package:flutter/material.dart';
import 'package:voxify_client/utils/constants.dart';

class CreatePodcastScreen extends StatelessWidget {
  const CreatePodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // --- HEADING ---
            const SizedBox(height: 20),
            const Text(
              'Create a Podcast',
              style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 35),

            // --- TITLE ---
            const Text(
              'Podcast title',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                }
                return 'Title cannot be empty';
              },
              controller: titleController,
              maxLength: 100,
              cursorColor: Colors.teal[100],
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.bottomNavbarColor,
                counterText: '',
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.teal[100]!,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.withOpacity(0.6),
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.withOpacity(0.6),
                  ),
                ),
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 15,
                ),
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 22),

            // --- CATEGORY DROPDOWN ---
            const Text(
              'Category',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonHideUnderline(
              child: DropdownButtonFormField(
                
                items: [],
                onChanged: (onChanged) {},
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
