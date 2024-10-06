//
//  Generic_Network_LayerTests.swift
//  Generic Network LayerTests
//
//  Created by Ahmet Tunahan Bekdaş on 2.10.2024.
//

import XCTest
@testable import Generic_Network_Layer

// MARK: - Test Class
final class GenericNetworkLayerTests: XCTestCase {
    // MARK: - Properties
    private var viewModel: UserListViewModel!
    private var view: MockUserView!
    private var service: MockUserListService!
    
    // MARK: - Setup
    override func setUpWithError() throws {
        service = MockUserListService()
        view = MockUserView()
        viewModel = UserListViewModel(service: service)
        viewModel.delegate = view
    }
    
    // MARK: - Load Test
    func testLoad() throws {
        // Given:
        let movie1 = try ResourceLoader.userLoader(resource: .user1)
        service.user = [movie1]
        let expectedUser = [movie1].map({UserPresentation(user: $0)})

        
        // When:
        viewModel.loadUserList()
        
        // Then:
        XCTAssertEqual(view.outpust.count, 2)

//        switch view.outpust[0] {
//        case .updateTitle(_):
//            // Success!
//            break
//        default:
//            XCTFail("First outpute is wrong")
//        }
        
        XCTAssertEqual(view.outpust[0], .updateTitle("Users"))
        XCTAssertEqual(view.outpust[1], .showUser(expectedUser))
        
    }
}

// MARK: - Navigate Test
func testNavigate() throws {
    // Given:
    
    // When:
    
    // Then:
}
        
        // MARK: - Mock Service
        final class MockUserListService: UserServiceProtocol {
            var user: [User] = []
            
            func getUser(complation: @escaping (Result<[Generic_Network_Layer.User], Generic_Network_Layer.NetworkError>) -> Void) {
                complation(.success(user))
            }
        }
        
        // MARK: - Mock View
        final class MockUserView: UserListViewModelDelegate {
            var outpust: [UserListViewModelOutput] = []
            
            func handleViewModelOutput(_ output: Generic_Network_Layer.UserListViewModelOutput) {
                outpust.append(output)
            }
            
            func navigate(to route: Generic_Network_Layer.UserListViewRoute) {
                
            }
        }

