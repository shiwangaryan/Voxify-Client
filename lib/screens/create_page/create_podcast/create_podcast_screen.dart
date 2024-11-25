import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:voxify_client/screens/create_page/create_podcast/constants.dart';
import 'package:voxify_client/utils/constants.dart';

class CreatePodcastScreen extends StatelessWidget {
  const CreatePodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController promptController = TextEditingController();
    TextEditingController imagePromptController = TextEditingController();
    String caterogyValue;

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
                enabledBorder: enabledBorder,
                focusedBorder: focusedBorder,
                errorBorder: errorBorder,
                focusedErrorBorder: focusedErrorBorder,
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
                validator: (value) {
                  if (value == null) {
                    return 'Category cannot be empty';
                  }
                  return null;
                },
                items: categoryList,
                onChanged: (onChanged) {
                  caterogyValue = onChanged.toString();
                  print(caterogyValue);
                },
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
                hint: Text(
                  'Select a Category',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.4),
                    fontSize: 15,
                  ),
                ),
                dropdownColor: const Color(0xFF242F35),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.bottomNavbarColor,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  enabledBorder: enabledBorder,
                  focusedBorder: focusedBorder,
                  errorBorder: errorBorder,
                  focusedErrorBorder: focusedErrorBorder,
                ),
              ),
            ),
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
              controller: descriptionController,
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
                enabledBorder: enabledBorder,
                focusedBorder: focusedBorder,
                errorBorder: errorBorder,
                focusedErrorBorder: focusedErrorBorder,
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
              controller: promptController,
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
                enabledBorder: enabledBorder,
                focusedBorder: focusedBorder,
                errorBorder: errorBorder,
                focusedErrorBorder: focusedErrorBorder,
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
            UploadImageWidget(
              enabledBorder: enabledBorder,
              focusedBorder: focusedBorder,
              errorBorder: errorBorder,
              focusedErrorBorder: focusedErrorBorder,
              imagePromptController: imagePromptController,
            ),
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
  final OutlineInputBorder enabledBorder;
  final OutlineInputBorder focusedBorder;
  final OutlineInputBorder errorBorder;
  final OutlineInputBorder focusedErrorBorder;
  final TextEditingController imagePromptController;
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
