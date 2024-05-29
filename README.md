# Trending GitHub Repositories iOS App
Trending GitHub Repositories


## Project Description

This project is a single-screen iOS application designed to display the latest trending repositories on GitHub. It fetches data from a public API and presents it to the user with a clean and user-friendly interface. 

## Key Features

-	Trending Repositories List: Fetches and displays the latest trending repositories from GitHub.
-	Shimmer Animation: Provides a loading animation for a better user experience while fetching data.
-	Dark Mode Support: Adapts the interface for dark mode.
-	Caching: Utilizes Core Data for caching to minimize API calls.
-	Error Handling: Displays an error view if the API is unreachable.
-	Concurrency: Implements Swift concurrency features.
-	Animations: Uses Lottie animations in the loader view.

## Getting Started

### Prerequisites

-	Xcode 13.0 or later
- iOS 16.0 or later
-	Swift 5.5 or later

## Installation

1. Clone the repository
2. Navigate to the project directory
3. Open the project in Xcode
4. Install dependencies
   - Lottie for iOS
   - SDWebImage
   - SDWebImageSwiftUI

  
 ## Running the App

1. Build and run the project in Xcode.
2. Ensure you have an active internet connection to fetch data from the GitHub API.

## Usage

- Initial Load: The app will fetch and display the latest trending repositories with a shimmer animation during the data fetch.
-	Data Refresh: Users can refresh the data to get the latest trending repositories.
-	Error Handling: In case of an API fetch error, an error view will be displayed with a retry option using Lottie animations.
-	Dark Mode: The app supports dark mode for a seamless user experience.
