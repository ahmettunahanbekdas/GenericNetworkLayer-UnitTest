# SwiftUnitTestWithGeneric

This project demonstrates a reusable **Generic Network Layer** for API communication and robust **Unit Testing** to ensure application reliability and maintainability. The application is built using **Swift** and emphasizes scalability, modularity, and testability.

## Features

- **Generic Network Layer**:
  - Simplifies API requests with a reusable and type-safe architecture.
  - Supports GET, POST, and other HTTP methods.
  - Decodes responses using Swift's `Codable` protocol.
  - Error handling for network and parsing issues.

- **Unit Testing**:
  - Comprehensive test coverage for network requests and response handling.
  - Mocking capabilities to simulate API responses.
  - Ensures the reliability of the network layer and application logic.

## Technologies Used

The project leverages the following technologies:

- **Swift**: Programming language.
- **URLSession**: For networking tasks.
- **XCTest**: For writing and running unit tests.

## Architecture and Development Principles

The following architectural patterns and principles are applied:

- **Generic Network Layer**:
  - Built with generics to allow flexibility for different types of API requests.
  - Centralized `NetworkManager` to handle requests and responses.
  - Decoupled logic to facilitate testing and code reuse.

- **Unit Testing**:
  - Uses `XCTest` framework.
  - Includes mock data and stubs for API responses.
  - Verifies error handling, data decoding, and network calls independently.



### Example Usage Network Manager:
```swift
class NetworkService<T: Decodable> {
    func fetchData(from url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        // Code to make network request and process data
    }
}
```

### Example of Writing a Unit Test:
```swift
import XCTest
@testable import ProjectName

class NetworkServiceTests: XCTestCase {
    func testFetchData() {
        // Test code
    }
}
 ```
