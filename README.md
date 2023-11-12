# Description
I have successfully developed a Java project, seamlessly integrating continuous implementation and delivery practices. This entails maintaining a Docker image in a running state. When a modification is introduced to the codebase and committed to GitHub, the automated pipeline, made using Jenkins, initiates a rebuilding process. The updated code is then efficiently redistributed, ensuring a smooth and continuous delivery workflow within the Docker environment. This comprehensive approach streamlines development processes, enhances version control, and optimizes project deployment.

# Usage and Modify

**0. Prerequisites:**

- Install [Java SE JDK-14](https://www.oracle.com/java/technologies/javase/jdk14-archive-downloads.html) or check if already installed with `java -version`.
- Install [Maven 3.8.7+](https://maven.apache.org/install.html) or check if already installed with `mvn -v`.
- Install [Docker Desktop]()  or check if already installed with `aws --version`.
- Install [Jenkins]() or check if already installed with `sam --version`.
- Create a repository on GitHub or fork this one

**1. Start Docker**
- Open the docker desktop program, create an account or log in and start the docker (Test if everything is okay by opening a CMD and running `docker info`)

**2. Configure Jenkins**

- Browse to `http://localhost:8080/ or the configured Jenkins location` and navigate to Manage Jenkins
- Under Plugins > install or enable those plugins:
  - Docker Pipeline 
  - Docker plugin
  - GitHub Integration Plugin
  - Maven Integration plugin
  - Pipeline
- Under Tools > and configure:
  - JDK Installation setting the *JAVA_HOME* as the path where is installed the JDK14 (In my case *C:\Program Files\Java\jdk-14.0.1*)
  - Maven Installation setting the *MAVEN_HOME* as the path where is installed the Maven (In my case *C:\Program Files\Maven\apache-maven-3.8.7*)
  - Docker Installation setting the *installation root* as the path where is installed the Docker (In my case *C:\Program Files\Docker\Docker*)
- Under Credentials > Domanis > (Global) > Add Credentials with the username and password of your docker.
> [!NOTE]
> There is the possibility to generate a token in docker under Account Settings > Security > New Access Token, this goes in the password field

**3. Create a pipeline**

- On Jenkins create a New Item > Pipeline
- Enable the GitHub project checkmark and insert the repository URL
- Enable the GitHub hook trigger for GITScm polling
- Copy the Jenkinsfile in the pipeline script and configure the possibility to read the file from SCM
> [!NOTE]
> Edit with your repository, tools and credentials variable names

**4. Test**

- Click on Build Now to test if the pipeline works, waiting for a SUCCESS
- In CMD run `docker images` to see if the image has been created, or in [Docker Hub](https://hub.docker.com/) see if the image has been correctly pushed
- In CMD run `docker run -t IMAGE_NAME`

Happy coding!


