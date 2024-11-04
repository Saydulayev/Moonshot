# Moonshot

Moonshot is a SwiftUI-based iOS application that presents information about NASA’s Apollo missions and astronauts. Users can explore details about each mission and learn more about the astronauts involved in the historic Apollo program.

Features

	•	Mission Overview: View a list or grid of Apollo missions with mission patches, names, and launch dates.
	•	Detailed Mission Information: Tap on a mission to view in-depth details, including crew members, launch dates, and mission objectives.
	•	Astronaut Profiles: Get to know the astronauts who participated in the Apollo missions with individual profiles.

Screenshots

	(Soon)

Project Architecture

The app follows the MVVM (Model-View-ViewModel) architecture to separate the business logic from the UI components, ensuring maintainability and scalability. Here’s a brief overview of the project structure:

	•	Model: Contains data models for Mission and Astronaut, as well as utilities for data decoding.
	•	ViewModel: Manages data flow between the Model and the Views (currently empty).
	•	View: Contains SwiftUI views for displaying mission details and astronaut profiles.
	•	Modifiers: Custom view modifiers for reusable styles across the app.
	•	Resources: Contains JSON files, assets, and themes for UI styling.


Installation

	1.	Clone the repository:

git clone https://github.com/Saydulayev/Moonshot.git


	2.	Open the project in Xcode:

cd moonshot
open Moonshot.xcodeproj


	3.	Build and run the project on a simulator or a device.

JSON Data Structure

The project uses locally stored JSON files for missions and astronaut data. This data is decoded using Swift’s Codable protocol. You can find the JSON files in the Resources/JSON file folder.

Contributing

Contributions are welcome! If you’d like to improve the project, please follow these steps:

	1.	Fork the repository.
	2.	Create a new branch (git checkout -b feature/YourFeature).
	3.	Commit your changes (git commit -am 'Add new feature').
	4.	Push to the branch (git push origin feature/YourFeature).
	5.	Create a new Pull Request.

License

This project is licensed under the MIT License. See the LICENSE file for details.
