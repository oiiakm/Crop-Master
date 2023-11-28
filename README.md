# Crop Planner

## Overview

Crop Planner is a Flutter application designed to assist farmers in planning their crops by predicting crop prices based on different markets and crops. The app includes features such as user authentication via OTP, current weather conditions, weather alerts, and a machine learning model hosted on a Flask app through Amazon EC2 instances for dynamic crop price predictions.

## Screenshots

https://github.com/oiiakm/Crop-Master/assets/100027640/d3550b4b-0ec0-4db0-9256-9ab31e0e7813



## Features

- **User Authentication:**
  - Users can authenticate using a one-time password (OTP) system.

- **Crop Price Prediction:**
  - Utilizes a machine learning model hosted on a Flask app via Amazon EC2 instances.
  - Predicts crop prices based on various markets and crops.

- **Weather Information:**
  - Provides current weather conditions.
  - Offers weather alerts to keep users informed about potential risks.

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Python](https://www.python.org/downloads/)
- [Amazon EC2](https://aws.amazon.com/ec2/) instance for hosting the Flask app.

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/your-username/crop-planner.git
    ```

2. Navigate to the Flutter app directory:

    ```bash
    cd crop-planner/flutter_app
    ```

3. Install dependencies:

    ```bash
    flutter pub get
    ```

4. Run the app:

    ```bash
    flutter run
    ```

### Backend Setup

1. Set up an Amazon EC2 instance.
2. Install required Python packages on the EC2 instance:

    ```bash
    pip install flask requests
    ```

3. Transfer the machine learning model script to the EC2 instance.

4. Run the Flask app on the EC2 instance:

    ```bash
    python flask_app.py
    ```

## Usage

- Launch the Crop Planner app on your device.
- Authenticate using the OTP system.
- Explore crop prices, weather conditions, and alerts.
- Plan your crops based on predictions.

## Contributing

If you'd like to contribute to Crop Planner, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature: `git checkout -b feature-name`.
3. Make changes and commit: `git commit -m "Add new feature"`.
4. Push to the branch: `git push origin feature-name`.
5. Submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- Thanks to [OpenAI](https://www.openai.com/) for the GPT-3.5 language model.
