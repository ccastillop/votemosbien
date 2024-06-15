# Votemos Bien

Votemos Bien is a project aimed at improving the quality of voting for Peruvians. The goal is to provide a platform that ensures transparency, accessibility, and fairness in the voting process. This web application is built with Ruby on Rails and is open for contributions from the developer community.

Look at the [demo](https://votemosbien.softwarebajodemanda.com)

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Introduction

In 2021, we initiated the Votemos Bien project to enhance the quality of voting for Peruvians. The platform aims to:
- Provide accurate and timely information about the voting process.
- Ensure accessibility for all eligible voters.
- Promote transparency in the electoral process.

This project is open source and we welcome contributions from developers around the world to help us improve and maintain the platform.

## Features

- User-friendly interface for voters.
- Real-time updates on voting processes.
- Secure and transparent data handling.
- Multilingual support for accessibility.

## Installation

To get a local copy up and running, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/ccastillop/votemosbien.git
   cd votemosbien
   ```

2. **Install dependencies:**
   Make sure you have Ruby and Bundler installed. 
   Also Yarn classic (1.22) and node v20 are required. 

   Then run:
   ```bash
   bundle install
   yarn install
   ```

3. **Setup the database:**
   Set up the database by running:
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the server:**
   Start the Rails server with:
   ```bash
   rails server
   ```

5. **Access the application:**
   Open your browser and navigate to `http://localhost:3000`.

## Usage

Once the application is up and running, you can explore the features and functionalities of the platform. You can register as a user, access voting information, and interact with various components of the application.

## Contributing

We welcome contributions to Votemos Bien! To contribute, please follow these steps:

1. **Fork the repository:**
   Click the "Fork" button at the top right of the repository page.

2. **Clone your fork:**
   ```bash
   git clone https://github.com/your-username/votemosbien.git
   cd votemosbien
   ```

3. **Create a new branch:**
   ```bash
   git checkout -b feature/your-feature-name
   ```

4. **Make your changes:**
   Implement your feature or bug fix.

5. **Commit your changes:**
   ```bash
   git add .
   git commit -m "Add feature/your-feature-name"
   ```

6. **Push to your fork:**
   ```bash
   git push origin feature/your-feature-name
   ```

7. **Create a pull request:**
   Open a pull request from your fork's feature branch to the main repository's `main` branch. Provide a detailed description of your changes and any relevant information.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

