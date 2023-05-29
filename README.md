
<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <!-- <a href="https://github.com/Ark667/AzureDevOpsAgent">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a> -->

<h1 align="center">AzureDevOpsAgent</h1>

  <p align="center">
    Ready to go docker image with Azure Devops agent with some tools to run pipelines included.
    <br />
    <a href="https://github.com/Ark667/AzureDevOpsAgent"><strong>Explore the docs »</strong></a>
    <br />    
    <a href="https://github.com/Ark667/AzureDevOpsAgent/issues">Report Bug</a>
    ·
    <a href="https://github.com/Ark667/AzureDevOpsAgent/issues">Request Feature</a>
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#getting-started">Getting Started</a></li>
    <li><a href="#usage">Usage</a></li>
    <!-- <li><a href="#roadmap">Roadmap</a></li> -->
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <!-- <li><a href="#acknowledgments">Acknowledgments</a></li> -->
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

<!-- [![Product Name Screen Shot][product-screenshot]](https://example.com) -->

This project is the finished work of creating and Azure DevOps Agent container image, with some components to run pipelines. I just followed Microsoft documentation, and installed the tools required for me.
Check the Microsoft doc for more info: https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

* [Ubuntu](https://ubuntu.com/)
* [Docker](https://www.docker.com/)
* [.Net7](https://dotnet.microsoft.com/download/dotnet/7.0)
* [Powershell](https://docs.microsoft.com/powershell/)
* [Terraform](https://www.terraform.io/)
* [SqlPackage](https://docs.microsoft.com/es-es/sql/tools/sqlpackage/sqlpackage?view=sql-server-ver15)
* [Java](https://www.java.com/)
* [AwsCli](https://aws.amazon.com/es/cli/)


<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

You can execute current release with Docker.

```pws
docker run -e AZP_URL="https://dev.azure.com/[yourorganization]" -e AZP_TOKEN=[token] --name AzureDevOpsAgent --detach ghcr.io/ark667/azuredevopsagent:master
```

You can also clone the repo and build the image yourself.

```pws
git clone https://github.com/Ark667/AzureDevOpsAgent.git
Docker build -t azuredevopsagent .\AzureDevOpsAgent
```


<p align="right">(<a href="#top">back to top</a>)</p>


<!-- USAGE EXAMPLES -->
## Usage

Basic usage is pretty straightforrward, just run the container with your organization name and access token. It will connect automatically and become available in Azure Devops portal to process pipielines.

```pws
docker run -e AZP_URL="https://dev.azure.com/[yourorganization]" -e AZP_TOKEN=[token] --name AzureDevOpsAgent --detach azuredevopsagent:master
```

Setting this volume, it will be able to execute docker builds using the host machine docker service.

```pws
docker run -e AZP_URL="https://dev.azure.com/[yourorganization]" -e AZP_TOKEN=[token] --name AzureDevOpsAgent -v /var/run/docker.sock:/var/run/docker.sock --detach azuredevopsagent:master
```

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- LICENSE -->
## License

Feel free to use the code in this repository as it is under MIT license. See `LICENSE.txt` for more information. You can also buy me a coffee for my little effort.

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/I2I16OYC5)

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

Aingeru Medrano - [@AingeruBlack](https://twitter.com/AingeruBlack) <!-- - email@email_client.com -->

Project Link: [https://github.com/Ark667/AzureDevOpsAgent](https://github.com/Ark667/AzureDevOpsAgent)

<p align="right">(<a href="#top">back to top</a>)</p>


<!-- ACKNOWLEDGMENTS
## Acknowledgments

* []()

<p align="right">(<a href="#top">back to top</a>)</p> -->


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Ark667/AzureDevOpsAgent.svg?style=for-the-badge
[contributors-url]: https://github.com/Ark667/AzureDevOpsAgent/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Ark667/AzureDevOpsAgent.svg?style=for-the-badge
[forks-url]: https://github.com/Ark667/AzureDevOpsAgent/network/members
[stars-shield]: https://img.shields.io/github/stars/Ark667/AzureDevOpsAgent.svg?style=for-the-badge
[stars-url]: https://github.com/Ark667/AzureDevOpsAgent/stargazers
[issues-shield]: https://img.shields.io/github/issues/Ark667/AzureDevOpsAgent.svg?style=for-the-badge
[issues-url]: https://github.com/Ark667/AzureDevOpsAgent/issues
[license-shield]: https://img.shields.io/github/license/Ark667/AzureDevOpsAgent.svg?style=for-the-badge
[license-url]: https://github.com/Ark667/AzureDevOpsAgent/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/aingeru/
[product-screenshot]: images/screenshot.png
