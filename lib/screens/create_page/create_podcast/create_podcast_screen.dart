import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:voxify_client/utils/constants.dart';

class CreatePodcastScreen extends StatelessWidget {
  const CreatePodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> _categoryList = [
      const DropdownMenuItem(
        value: 'True Crime',
        child: Text('True Crime'),
      ),
      const DropdownMenuItem(
        value: 'Comedy',
        child: Text('Comedy'),
      ),
      const DropdownMenuItem(
        value: 'Health & Wellness',
        child: Text('Health & Wellness'),
      ),
      const DropdownMenuItem(
        value: 'Technology',
        child: Text('Technology'),
      ),
      const DropdownMenuItem(
        value: 'Self-Improvement',
        child: Text('Self-Improvement'),
      ),
      const DropdownMenuItem(
        value: 'News & Politics',
        child: Text('News & Politics'),
      ),
      const DropdownMenuItem(
        value: 'Education',
        child: Text('Education'),
      ),
      const DropdownMenuItem(
        value: 'Business & Finance',
        child: Text('Business & Finance'),
      ),
      const DropdownMenuItem(
        value: 'History',
        child: Text('History'),
      ),
      const DropdownMenuItem(
        value: 'Entertainment & Pop Culture',
        child: Text('Entertainment & Pop Culture'),
      ),
      const DropdownMenuItem(
        value: 'Science',
        child: Text('Science'),
      ),
      const DropdownMenuItem(
        value: 'Relationships & Dating',
        child: Text('Relationships & Dating'),
      ),
      const DropdownMenuItem(
        value: 'Sports',
        child: Text('Sports'),
      ),
      const DropdownMenuItem(
        value: 'Storytelling',
        child: Text('Storytelling'),
      ),
      const DropdownMenuItem(
        value: 'Spirituality & Religion',
        child: Text('Spirituality & Religion'),
      ),
    ];

    List<String> categoryList = [
      'Crime',
      'Comedy',
      'Health & Wellness',
      'Technology',
      'Self-Improvement',
      'News & Politics',
      'Education',
      'Business & Finance',
      'History',
      'Entertainment & Pop Culture',
      'Science',
      'Relationships & Dating',
      'Sports',
      'Storytelling',
      'Spirituality & Religion'
    ];

    var _enabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );
    var _focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.teal[400]!.withOpacity(0.8),
        width: 0.9,
      ),
    );
    var _errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.red.withOpacity(0.6),
        width: 0.9,
      ),
    );
    var _focusedErrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.red.withOpacity(0.6),
        width: 0.9,
      ),
    );
    TextEditingController titleController = TextEditingController();
    TextEditingController imagePromptController= TextEditingController();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.bottomNavbarColor,
                counterText: '',
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                enabledBorder: _enabledBorder,
                focusedBorder: _focusedBorder,
                errorBorder: _errorBorder,
                focusedErrorBorder: _focusedErrorBorder,
                hintText: 'Title',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 24),

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
                items: _categoryList,
                onChanged: (onChanged) {},
                menuMaxHeight: 400,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white.withOpacity(0.6),
                ),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                elevation: 0,
                isExpanded: true,
                // dropdownColor: AppColors.bottomNavbarColor,
                dropdownColor: const Color(0xFF242F35),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.bottomNavbarColor,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  enabledBorder: _enabledBorder,
                  focusedBorder: _focusedBorder,
                  errorBorder: _errorBorder,
                  focusedErrorBorder: _focusedErrorBorder,
                  hintText: 'Select a Category',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            // AnimatedContainer(
            //   duration: const Duration(milliseconds: 240),
            //   height: ,
            // ),
            const SizedBox(height: 24),

            // --- DESCRIPTION ---
            const Text(
              'Description',
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
                return 'Description cannot be empty';
              },
              controller: titleController,
              maxLength: 400,
              maxLines: 4,
              cursorColor: Colors.teal[100],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.bottomNavbarColor,
                counterText: '',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                enabledBorder: _enabledBorder,
                focusedBorder: _focusedBorder,
                errorBorder: _errorBorder,
                focusedErrorBorder: _focusedErrorBorder,
                hintText: 'Write a short description',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 35),

            Container(
              height: 0.9,
              color: const Color(0xff2E3036),
            ),
            const SizedBox(height: 35),

            // AI PROMPT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'AI Prompt',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  height: 34,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.teal[400],
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      'Generate Audio',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                }
                return 'Prompt cannot be empty';
              },
              controller: titleController,
              maxLength: 400,
              maxLines: 4,
              cursorColor: Colors.teal[100],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.bottomNavbarColor,
                counterText: '',
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                enabledBorder: _enabledBorder,
                focusedBorder: _focusedBorder,
                errorBorder: _errorBorder,
                focusedErrorBorder: _focusedErrorBorder,
                hintText: 'Provide transcription for AI to generate audio',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 25),
            // GENERATED PODCAST

            // --- UPLOAD IMAGE ---
            UploadImageWidget(enabledBorder: _enabledBorder, focusedBorder: _focusedBorder, errorBorder: _errorBorder, focusedErrorBorder: _focusedErrorBorder, imagePromptController: imagePromptController),
            const SizedBox(height: 30),

            // --- PUBLISH ---
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.teal[500],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  'Publish',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class UploadImageWidget extends StatefulWidget {
  final enabledBorder;
  final focusedBorder;
  final errorBorder;
  final focusedErrorBorder;
  final imagePromptController;
  const UploadImageWidget(
      {super.key,
     required this.enabledBorder,
     required this.focusedBorder,
     required this.errorBorder,
     required this.focusedErrorBorder,
     required this.imagePromptController});

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  bool customImage = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 325,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.bottomNavbarColor,
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 0.8,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.bounceInOut,
                right: customImage ? 0 : 119,
                left: customImage ? 184 : 0,
                child: Container(
                  width: 100,
                  height: 37,
                  decoration: BoxDecoration(
                    color: const Color(0xff222429),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (customImage) {
                        setState(() {
                          customImage = false;
                        });
                      }
                    },
                    child: const Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: const Text(
                        'AI generated thumbnail',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!customImage) {
                        setState(() {
                          customImage = true;
                        });
                      }
                    },
                    child: const Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: const Text(
                        'Upload image',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        customImage
            ? DottedBorder(
                borderType: BorderType.RRect,
                padding: const EdgeInsets.all(1),
                radius: const Radius.circular(8),
                dashPattern: [6, 8],
                strokeWidth: 0.7,
                color: Colors.teal.withOpacity(0.35),
                child: Center(
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: AppColors.bottomNavbarColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/upload.png',
                            height: 40,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Click to upload',
                            style: TextStyle(
                              color: Colors.teal[700],
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'SVG, PNG or JPG (max 1080x1080px)',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.4),
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : TextFormField(
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  }
                  return 'Prompt cannot be empty';
                },
                controller: widget.imagePromptController,
                maxLength: 300,
                maxLines: 3,
                cursorColor: Colors.teal[100],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.bottomNavbarColor,
                  counterText: '',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  enabledBorder: widget.enabledBorder,
                  focusedBorder: widget.focusedBorder,
                  errorBorder: widget.errorBorder,
                  focusedErrorBorder: widget.focusedErrorBorder,
                  hintText: 'Prompt for AI to generate image',
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 15,
                  ),
                ),
              ),
      ],
    );
  }
}

// class AnimatedDropDownbutton extends StatefulWidget {
//   final List<String> categoryList;
//   final OutlineInputBorder enabledBorder;
//   final OutlineInputBorder focusedBorder;
//   final OutlineInputBorder errorBorder;
//   final OutlineInputBorder focusedErrorBorder;
//   const AnimatedDropDownbutton(
//       {super.key,
//       required this.categoryList,
//       required this.enabledBorder,
//       required this.focusedBorder,
//       required this.errorBorder,
//       required this.focusedErrorBorder});

//   @override
//   State<AnimatedDropDownbutton> createState() => _AnimatedDropDownbuttonState();
// }

// class _AnimatedDropDownbuttonState extends State<AnimatedDropDownbutton> {
//   bool isExpanded = false;
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 240),

//     );
//   }
// }
