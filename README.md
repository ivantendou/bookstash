# Bookstash App
[![Stars](https://img.shields.io/github/stars/ivantendou/bookstash.svg)](https://github.com/ivantendou/bookstash/stargazers)
[![Forks](https://img.shields.io/github/forks/ivantendou/bookstash.svg)](https://github.com/ivantendou/bookstash/network/members)
[![Watchers](https://img.shields.io/github/watchers/ivantendou/bookstash.svg)](https://github.com/ivantendou/bookstash/watchers)

[![GitHub license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/ivantendou/bookstash/blob/main/LICENSE)
[![platform](https://img.shields.io/badge/platform-Flutter-blue.svg)](https://flutter.dev/)
[![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/ivantendou/bookstash)

![Mini Project Alterra](https://github.com/ivantendou/bookstash/assets/70643310/7b71c780-9af8-44fe-99c8-742248d0ca8a)

## 📚 About Bookstash
Welcome to **Bookstash**, where the world of books unfolds at your fingertips! 🌟 Bookstash is not just another book app; it's your gateway to a universe of literary wonders. Harnessing the power of the Google Books API, Bookstash empowers users to explore a treasure trove of book information, bookmark their favorites, dive into detailed book insights, and even enjoy personalized recommendations powered by AI! 🤖📖

Dive into the realms of knowledge, discover new literary gems, and embark on an adventure through the pages of your favorite books with Bookstash! 🚀


## 📘 Bookstash Features

### 🌟 View Latest Books
Discover new books easily. Find the latest reads in fiction, history, and programming on the home screen.
### 📚 View Books by Genre
Explore books by category. Browse through different genres to find what interests you.
### 🔍 Search Books
Find books quickly. Search by title or author's name with ease.
### 📌 Bookmark
Save your favorites. Mark books you love to come back to later.
### 📖 Book Detail
Learn more about each book. Get details like the description, author, publication year, language, page count, and where to buy or read.
### 🤖 Book Recommendation
Get personalized suggestions. Ask our AI, Gemini, for recommendations based on your favorite genre and language.
### 📤 Share Book Information
Spread the word about great books. Share book info through WhatsApp, email, and more.

## 🛠️ Tech Stack
| Feature                             | Package                                                   |
|-------------------------------------|-----------------------------------------------------------|
| Framework                           | [Flutter](https://flutter.dev/)                           |
| Programming Language                | Dart                                                      |
| UI Toolkit                          | Flutter Widgets                                           |
| State Management                    | [Provider](https://pub.dev/packages/provider)             |
| Networking                          | [Dio](https://pub.dev/packages/dio)                       |
| Database                            | [Sqflite](https://pub.dev/packages/sqflite)               |
| Navigation                         | [Flutter Navigator](https://flutter.dev/docs/development/ui/navigation) |
| API Integration                     | RESTful APIs                                              |
| Testing                             | [Flutter Test](https://flutter.dev/docs/cookbook/testing/unit/introduction) |
| Dependency Injection                | [Provider](https://pub.dev/packages/provider)             |
| HTML Parsing                        | [Html]
| Environment Variables Management   | [Envied](https://pub.dev/packages/envied)                 |
| AI Recommendation                  | [Flutter Gemini](https://pub.dev/packages/flutter_gemini) |
| Markdown Rendering                  | [Flutter Markdown](https://pub.dev/packages/flutter_markdown) |
| Share Content                      | [Share Plus](https://pub.dev/packages/share_plus)         |
| Fake Asynchronous Testing          | [Fake Async](https://pub.dev/packages/fake_async)         |
| UI Enhancement                     | [Google Nav Bar](https://pub.dev/packages/google_nav_bar), [Shimmer](https://pub.dev/packages/shimmer) |



## Sample App Demo
sertakan link apk yang sudah di-build

## :hammer: Build it yourself
1. Run the following command:
   ```bash
   # Clone this repo
   git clone https://github.com/ivantendou/bookstash

   # Install all dependencies and run the project
   flutter pub get
   flutter run
   ```
2. You need to obtain an API Key from Google to use the book recommendation feature with Gemini AI. Visit this [link](https://ai.google.dev) and create a new project if you haven't already. Next, enable the Gemini AI service and obtain the API Key.
3. After obtaining the API Key, insert the API Key into your project's code. Open the `constants/gemini_ai.dart` file and replace ApiKey with the API Key you obtained.
   ```dart
   import 'package:flutter_gemini/flutter_gemini.dart';

   class GeminiAi {
     static const String apiKey = 'YOUR_API_KEY_HERE';
   }
   ```
   If you prefer to use .env to store the API Key, you can use the `flutter_dotenv` or `envied` package. Make sure to install the package and add the .env file to your project by storing the API Key inside it. Then, you can access this API Key from your project's code.
4. Perform hot reload or hot restart.

## :newspaper: License
MIT License. See [LICENSE](./LICENSE) file for more information.

## 😊 Author
This project is created by [Ivan](https://github.com/ivantendou). If you have any questions or feedback, feel free to contact me via email at [ivanfadillah153@gmail.com](mailto:ivanfadillah153@gmail.com) 📧.

