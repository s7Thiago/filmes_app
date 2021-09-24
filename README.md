# Movies App

A movie sugestion app made with Flutter Framework using TMDB API.

## Project Status

This project is just a personal showcase, done with de aim of  register what i have studied, and show my skills. It may receives improvements in the future.

## Features in this project

 - [x] Login with Google via Firebase
 - [x] Logout feature
 - [x] Get movies from TMDB API
 - [x] Firebase Firestore to save logged user favorite movies information
 - [x] Used Firebase Remote Config to store the TMDB API key and app secrets
 - [x] Filter movies by genre
 - [x] Filter movies by title
 - [x] State management with GetX
 - [x] Route management with Navigator 2.0
 - [x] Dependencies injection with GetX
 - [x] MVC architecture mediated via GetX
 - [x] Used some design patterns like Prototype, Proxy and Singleton


Acess [The movie DB API Docs](https://developers.themoviedb.org/3/getting-started/introduction) to get started.

## Project features preview

| Login error, Login, Logout                                                              | Movies page and movies detail                                                                  | Filter movies by genre or by title                                            | Managing Favorite movies                                                               |
| --------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| <div><img style="width:300px;" src="assets/images/prints/error_login_logout.gif"></div> | <div><img style="width:300px;" src="assets/images/prints/movies_page_movie_details.gif"></div> | <div><img style="width:300px;" src="assets/images/prints/filtering.gif"></div> | <div><img style="width:300px;" src="assets/images/prints/managing_favorites.gif"></div> |

##
## Installation and Setup Instructions

Clone down this repository. You will need `Flutter` and `Dart` installed globally on your machine.

Installation:

`flutter pub get install` on the project root.

To Run the android application:

`flutter run -d <device or emulator id>`

To build a android release:

`flutter build apk` the package will be generated on **./build/app/outputs/flutter-apk/app-release.apk**



## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
