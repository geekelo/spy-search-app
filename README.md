<a name="readme-top"></a>
<div align="center">
  <!-- You are encouraged to replace this logo with your own! Otherwise you can also remove it. -->
  <img src="https://dl.dropboxusercontent.com/s/110axfscx8e9q3q/Screenshot%202023-04-27%20024351.png" alt="logo" width=""  height="auto" />
  <br/>

  <h3><b>SPY SEARCH APP</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 PERSONAL INVENTORY ](#-personal-inventory-)
  - [Live demo](#live-demo)
  - [Video Presentation](#video-presentation-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [🛠 Development Process ](#development-process)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 Spy Search App <a name="about-project"></a>


"**The Spy Search App** is a web application designed to record search results in real-time and provide analytics on search queries and user interactions. It is built to efficiently capture search data, analyze it, and present insights to users. Below, I'll outline the key aspects of the app, including its description, tech stack, development process, features, and how search inputs are recorded in real-time."

## Real-time Search Input Recording:
To record search inputs in real-time, the Spy Search App employs techniques such as AJAX requests. Here's a simplified explanation of how it works:

**Client-Side Interaction:** When a user performs a search on the platform, a JavaScript code on the frontend captures the search query. When a user types into the search bar, the input value is recorded immediately and a 5secs timer kicks in.
Based on online researches made, a user can be assumed to have concluded typing a sentence after a 5 seconds pause. Therefore, the timer is made to restart when the user resumes typing before the 5secs timer elapses, then the new input value replaces the former.
In the absence of a new input value after the 5 secs timer elapses, an automatic AJAX request is made.
**AJAX Request:** The frontend sends an AJAX request to the backend server, containing the search query data.
**Backend Processing:** The backend server receives the AJAX request, processes the search query, and stores it in the database.

## Live Demo & Presentation <a name="live-demo">
[LIVE DEMO](https://spy-search-app.onrender.com)

<!-- Video Presentation -->
## Video Presentation <a name="video-presentation"></a>
[See Video](https://youtu.be/GskJWBBWkCk)


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

The Spy Search App utilizes a modern tech stack to ensure reliability, scalability, and performance. Some of the technologies and frameworks used in its development include:

**Frontend:** HTML, CSS, JavaScript
**Backend:** Ruby on Rails for server-side logic and API endpoints
**Database:** PostgreSQL or MySQL for storing search data and analytics
<!-- <details>
  <summary>Ruby on Rails</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
    <li><a href="https://guides.rubyonrails.org/">Rails</a></li>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>  -->


<!-- Features -->

### Key Features <a name="key-features"></a>

- **Real-time Search Recording:** Captures search queries and user interactions as they occur in real-time.
- **Analytics Dashboard:** Provides visualizations and insights into search trends, popular queries, and user behavior.
- **IP Tracking:** Records the IP addresses of users making search queries to identify geographic trends and patterns.
- **Query Ranking:** Ranking search queries based on popularity and frequency.
- **Database Optimization using Batches:** Implementing batch processing techniques to handle scalability and optimize database performance thereby minimizing resource consumption and improving efficiency.
- **Intrinsic User-Interface**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- DEVELOPMENT PROCESS -->
## 💻 Development Process: <a name="development-process"></a>

The development of the Spy Search App followed followed a process that involved:

- **Requirements Gathering:** Understanding the requirements of the project by studying project materials and doing online researches to better implement the required features
- **Design and Prototyping:** Creating wireframes and prototypes to visualize the user interface and interactions.
- **Development:** 
  - Code Quality: Writing clean code for frontend and backend components, implementing features through the use of appopriate linters.    
  - Branching Model: Using Gitflow branching model, to establish a clear and organized workflow for feature development, testing, and deployment, ensuring code quality and stability throughout the development lifecycle.
- **Testing:** Conducting rspec tests, to ensure the app functions correctly and meets requirements.
- **Deployment:** Deploying the app to a production environment, using Render.
- **Monitoring and Maintenance:** Monitoring app performance, addressing bugs and issues.


<p align="right">(<a href="#readme-top">back to top</a>)</p>
<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>


To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:


- Code editor like VS code
- Ruby installed in your machine


### Setup

Clone this repository to your desired folder:


```sh
   git clone https://github.com/geekelo/spy-search-app.git
   cd spy-search-app
```


### Install

Install this project with:


```sh
  cd spy-search-app
  gem install
```


### Usage

To run the project, execute the following command:


```sh
  rails server
```

### Run Tests
To run tests, run the following command:
```
  rspec spec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>



👤 **Eloghene Otiede**

- GitHub: [@githubhandle](https://github.com/geekelo)
- Twitter: [@twitterhandle](https://twitter.com/geekelo_xyz)
- LinkedIn: [LinkedIn](https://linkedin.com/in/eloghene-otiede)


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] Load more button to load analytic results in batches
- [ ] Display 5 most popular searches as part of analytics


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/geekelo/spy-search-app/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>


If you like this project drop a ⭐️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>


My appreciations to [Helpjuice](https://helpjuice.com/) for inspiring this project

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./mit.md) licensed.


<p align="right">(<a href="#readme-top">back to top</a>)</p>