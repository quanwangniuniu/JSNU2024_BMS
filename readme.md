### Project Background 😊📚

Welcome to the SSM Framework Training Example Project! This project serves as a demonstration for students of the 2021 class to learn about the SSM (Spring, Spring MVC, MyBatis) framework. It's designed to provide hands-on experience with fundamental technologies such as JSP and Servlets, offering insights into lower-level development techniques.



### Project Configuration and Run Instructions  👹 👺 🤖 

#### 1. Add Dependency Management to pom.xml

Add the necessary dependency management to the `pom.xml` file, including various libraries required for the project.

#### 2. Configure Resource Search Paths and Compilation Plugins

Also, add configuration in the `pom.xml` file to set resource search paths and compilation plugins to ensure the project can compile and run correctly.

#### 3. Configure a New web.xml File

- Delete the original `web.xml` file and create a new `web.xml` file (version 4.0).

- In the new 

  ```
  web.xml
  ```

  , configure the following:

  - Register the `ContextLoaderListener` listener.
  - Register the central dispatcher.
  - Register a character set filter to solve the issue of Chinese garbled characters.

#### 4. Create Directory Structure

Create `java` and `resources` folders under `src/main` and set the appropriate folder properties.

#### 5. Add Resource Files

Under the `src/main/resources` folder, add the following files:

- `jdbc.properties`: Configure database-related parameters.
- `mybatis-config.xml`: Set up MyBatis-related content.
- `applicationContext.xml`: Set up Spring-related content.
- `springmvc.xml`: Set up Spring MVC-related content.

#### 6. Layered Package Structure

Create various packages under `src/main/java` for different layers:

- `cn.edu.jsnu.controller`
- `cn.edu.jsnu.service`
- `cn.edu.jsnu.dao`
- `cn.edu.jsnu.domain`
- `cn.edu.jsnu.util`

#### 7. Add Static Files

Under `src/main/webapp`, add static file content:

- Add folders such as `css`, `img`, `js`, etc., and copy-paste the corresponding content.
- Create `login.jsp` and paste the content of `login.html` from the static files into it.

#### 8. Database Configuration

- In Navicat, create a database named `bms` and set the encoding to `utf8`.
- Import the `bms.sql` file to create the corresponding database tables and data.

#### 9. Implement Login Functionality

In the `src/main/java/controller` package:

- Create a `LoginController` class.
- Write the code for the login module.

#### 10. Configure Tomcat to Start the Project

- Configure Tomcat and start the project.
- If a 404 error occurs, possible reasons include:
  - Incorrect JSP page path or failure to load after compilation.
  - Incorrect request path.
  - Configuration file errors.

#### 11. Add Captcha Functionality

- Modify the captcha request in `login.jsp` to `/login/checkCode.do`.
- Add a `createImage` method in the `LoginController` to generate captcha images.
- Create an `ImageUtil` class in the `util` package to generate captcha images.

#### 12. Book Management Functionality

Implement basic CRUD operations for books. Refer to the project source code for specific implementation details.

### Running the Project😉 😊 😇

1. Ensure that JDK(Version 1.8 recommended) and Maven are installed and configured.
2. Download the project to your local machine and extract it.
3. Open the project in an IDE.
4. Follow the configuration steps outlined above.
5. Start the Tomcat server.
6. Access the project by entering the project URL in a web browser.

### 🧡 💛 💚Notes

- During the configuration process, make adjustments as necessary to ensure correctness.
- If problems arise, refer to error messages or log files for troubleshooting.
- For additional requirements or feature extensions, modify or add as needed based on project specifications.