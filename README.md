# GenericNetworkLayer-UnitTest

This project is an iOS application developed using the MVVM architecture. The project stands out with its modular structure and generic network layer. Additionally, unit tests have been written to validate the functionality of the application.

## Table of Contents

- [Getting Started](#getting-started)
- [Architecture](#architecture)
- [Generic Network Layer](#generic-network-layer)
- [Modular Architecture](#modular-architecture)
- [Unit Tests](#unit-tests)

## Getting Started

To clone the project to your local machine, use the following command:

```bash
git clone https://github.com/username/project-name.git
```

## Architecture

The project has been developed using the MVVM (Model-View-ViewModel) architecture. MVVM allows for the separation of application components (model, view, and view model), making the code more readable and easier to maintain.

### MVVM Components:
- **Model:** Represents the data. Contains business logic related to the application data.
- **View:** Represents the user interface. Receives user interactions and communicates with the ViewModel.
- **ViewModel:** Acts as a bridge between the Model and the View. It binds data to the View and processes user interactions with the model.

 ## Generic Network Layer
 
A generic network layer has been created in the project. This layer provides a reusable structure for managing different API calls. Thanks to its generic nature, we can make network requests using the same code for different data types.

### Example Usage:

```swift
class NetworkService<T: Decodable> {
    func fetchData(from url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        // Code to make network request and process data
    }
}
```


## Unit Tests

Unit tests have been written for the project to test the functionality of the application. Unit tests are used to verify that each component works as expected. This increases the reliability of the code and allows for early detection of potential issues.

#### Example of Writing a Unit Test:
```swift
import XCTest
@testable import ProjectName

class NetworkServiceTests: XCTestCase {
    func testFetchData() {
        // Test code
    }
}
 ```
