import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> categoryList = [
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

var enabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(
    color: Colors.transparent,
  ),
);
var focusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Colors.teal[400]!.withOpacity(0.8),
    width: 0.9,
  ),
);
var errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Colors.red.withOpacity(0.6),
    width: 0.9,
  ),
);
var focusedErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: BorderSide(
    color: Colors.red.withOpacity(0.6),
    width: 0.9,
  ),
);

List<String> _categoryList = [
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
