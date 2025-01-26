# Hexagonal Architecture

Hexagonal Architecture, also known as Ports and Adapters, is a design pattern that emphasizes the separation of 
concerns within an application. It divides the application into a core (business logic) and external 
interfaces (like databases, user interfaces, APIs) connected via ports and adapters. 

Understanding the roles of ports and adapters, especially on the driving side, is crucial for building scalable, 
maintainable, and testable applications.

1.	Defining Ports and Adapters
2.	Driving vs. Driven Adapters
3.	Ports and Adapters on the Driving Side
4.	Pros and Cons


## 1. Defining Ports and Adapters

![Overview](https://miro.medium.com/v2/resize:fit:720/format:webp/1*VSW-bsk-O8oJhldK88Gumw.png)


Ports
- Definition: Ports are interfaces that define how the core application interacts with the outside world. They abstract the underlying implementation details of external systems.
- Types of Ports:	
  - Primary (Driving) Ports: Entry points into the application (e.g., API endpoints, CLI commands). 
  - Secondary (Driven) Ports: Exit points from the application to external systems (e.g., databases, external APIs).

Adapters	
- Definition: Adapters are concrete implementations of ports. They handle the communication between the application and external systems, translating requests and responses as needed.	
- Types of Adapters:
  - Primary (Driving) Adapters: Interfaces through which external actors (like users or other systems) interact with the application (e.g., FastAPI routes). 
  - Secondary (Driven) Adapters: Implementations that allow the application to interact with external resources (e.g., SQLAlchemy repositories).

## 2. Driving vs. Driven Adapters

![Flow](https://miro.medium.com/v2/resize:fit:720/format:webp/1*nLNGZ52BoT58uN5v1gQHvA.png)

-	Driving Adapters (Primary):
  - Role: Act as the input mechanisms, initiating actions within the application.
    -	Examples: Web controllers (FastAPI routes), CLI interfaces, message queue listeners.
- Driven Adapters (Secondary):
  - Role: Act as the output mechanisms, allowing the application to perform actions like persisting data or communicating with other services.
  - Examples: Database repositories, external API clients, email senders.


## 3. Ports and Adapters on the Driving Side

Focusing on the driving side, let’s break down the roles of ports and adapters within the context of a FastAPI application.

Driving Ports
-	Definition: Interfaces that define the operations the application offers to the outside world. They represent the use cases or services that can be invoked by external actors.
-	Purpose: To abstract the core application’s functionalities, allowing adapters to interact with the core without knowing its internal implementation.

Driving Adapters
-	Definition: Implementations that expose the driving ports to external actors. In a FastAPI application, this typically involves defining API routes that handle HTTP requests and delegate actions to the core via ports.
-	Purpose: To translate external requests (e.g., HTTP calls) into operations that the core application can understand and process.

## 4 Pros and Cons

### 4.1 Pros

- Separation of Concerns

Description:
Hexagonal Architecture distinctly separates the application’s core business logic from its external interfaces (like databases, APIs, user interfaces). This division ensures that changes in one area have minimal impact on others.

Benefits:
•	Modularity: Each component has a single responsibility, making the system easier to understand and manage.
•	Isolation: Core logic remains unaffected by changes in external systems, reducing the risk of unintended side effects.

- Testability

Description:
By isolating the core logic from external dependencies through ports and adapters, Hexagonal Architecture facilitates comprehensive testing.

Benefits:
•	Unit Testing: Core business logic can be tested in isolation without the need for external systems.
•	Mocking External Interfaces: Adapters can be mocked or stubbed, allowing tests to focus solely on business rules.
•	Integration Testing: Ensures that adapters correctly implement ports and interact with external systems as expected.

- Flexibility and Maintainability

Description:
The decoupled nature of Hexagonal Architecture allows for easier modifications and extensions to the application.

Benefits:
•	Ease of Updates: Switching external systems (e.g., changing the database) requires updating or replacing adapters without altering the core logic.
•	Scalability: New features can be added by introducing new adapters or expanding existing ports, without disrupting the core.

- Technology Agnosticism

Description:
Hexagonal Architecture promotes independence from specific technologies or frameworks in the core business logic.

Benefits:
•	Framework Independence: Core logic doesn’t rely on web frameworks, ORMs, or other technologies, making it adaptable to different environments.
•	Future-Proofing: Reduces the risk of being tied to outdated or changing technologies, as adapters can evolve independently.

- Enhanced Reusability

Description:
Core business logic, being decoupled from external systems, can be reused across different applications or interfaces.

Benefits:
•	Multi-Interface Support: The same core logic can serve web APIs, CLI tools, desktop applications, or other interfaces by simply adding appropriate adapters.
•	Shared Business Rules: Ensures consistency in business operations across various platforms and interfaces.

- Clear Boundaries

Description:
Hexagonal Architecture enforces well-defined boundaries between the core and its external interactions.

Benefits:
•	Clarity: Developers can easily identify which parts of the codebase handle business logic versus external communications.
•	Team Organization: Facilitates parallel development, where teams can work on core logic and adapters independently.

### 4.2 Cons

- Increased Complexity

Description:
Introducing ports and adapters adds layers of abstraction to the application.

Drawbacks:
•	Complex Structure: For small or simple applications, the added layers might be unnecessary overhead.
•	Steep Learning Curve: New developers may find the architecture harder to grasp compared to more straightforward patterns.

- Steeper Learning Curve

Description:
Understanding and correctly implementing Hexagonal Architecture requires a solid grasp of its principles and patterns.

Drawbacks:
•	Training Required: Teams may need additional training or time to become proficient in this architecture.
•	Potential Misimplementation: Without proper understanding, developers might implement ports and adapters incorrectly, leading to confusion and maintenance challenges.

- Potential Overhead

Description:
The abstraction layers can introduce additional code and configuration.

Drawbacks:
•	Boilerplate Code: Defining ports and adapters often requires writing interfaces and multiple implementations, increasing the codebase size.
•	Performance Considerations: While typically negligible, the added layers could introduce minor performance overhead, especially in high-throughput applications.

- Verbose Codebase

Description:
The necessity to define interfaces (ports) and their implementations (adapters) can lead to a larger codebase.

Drawbacks:
•	Maintenance Burden: More files and classes to manage can make the project harder to navigate.
•	Increased Development Time: Writing and maintaining additional abstractions can slow down initial development.

- Implementation Challenges

Description:
Ensuring that all components adhere to the architecture’s principles can be challenging.

Drawbacks:
•	Consistency Enforcement: Maintaining consistent implementation of ports and adapters across the team requires discipline and possibly code reviews or architectural guidelines.
•	Integration Complexity: Integrating new adapters with existing ports must be handled carefully to avoid breaking changes in the core.