//
//  LoginViewControllerUnitTests.swift
//  XCTests1Tests
//
//  Created by Shivam Shishangia on 07/06/24.
//

import XCTest
@testable import XCTests1

class LoginViewControllerUnitTests: XCTestCase {

    var testLoginViewController: LoginViewController?
    var navigationController: UINavigationController?
    var window: UIWindow?

    override func setUpWithError() throws {
        window = UIWindow()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        testLoginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        if let testLoginViewController = testLoginViewController {
            navigationController = UINavigationController(rootViewController: testLoginViewController)
        }
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        testLoginViewController?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        testLoginViewController = nil
        navigationController = nil
                window = nil
    }
    
    func testNilUsername() {
        if let testLoginViewController = testLoginViewController {
            XCTAssertFalse(testLoginViewController.isUsernameValid(nil))
        }
    }

    func testInvalidAlphanumericUsername() {
        if let testLoginViewController = testLoginViewController {
            XCTAssertFalse(testLoginViewController.isUsernameValid("abc12345678"))
        }
    }

    func testOtherUsername() {
        if let testLoginViewController = testLoginViewController {
            XCTAssertFalse(testLoginViewController.isUsernameValid("abc@12345"))
        }
    }

    func testValidUsername() {
        if let testLoginViewController = testLoginViewController {
            XCTAssertTrue(testLoginViewController.isUsernameValid("abc12345"))
        }
    }

    func testNilPassword() {
        if let testLoginViewController = testLoginViewController {
            XCTAssertFalse(testLoginViewController.isPasswordValid(nil))
        }
    }

    func testShortPassword() {
        if let testLoginViewController = testLoginViewController {
            XCTAssertFalse(testLoginViewController.isPasswordValid("abc12@"))
        }
    }

    func testLongPassword() {
        if let testLoginViewController = testLoginViewController {
            XCTAssertFalse(testLoginViewController.isUsernameValid("abc12345678910"))
        }
    }

    func testValidPassword() {
        if let testLoginViewController = testLoginViewController {
            XCTAssertTrue(testLoginViewController.isPasswordValid("abc@12345"))
        }
    }

    func testInvalidLogin() {
        if let testLoginViewController = testLoginViewController {
            testLoginViewController.usernameTextField.text = "abc12345678"
            testLoginViewController.passwordTextField.text = "abc12@"
            testLoginViewController.loginButtonPressed(self)
            XCTAssertTrue(testLoginViewController.presentedViewController is UIAlertController)
            if let alert = testLoginViewController.presentedViewController as? UIAlertController {
                XCTAssertEqual(alert.title, "Invalid Input")
                XCTAssertEqual(alert.message, "Username or password is invalid.")
            }
        }
    }

    func testValidLogin() {
        guard let testLoginViewController = testLoginViewController,
              let navigationController = testLoginViewController.navigationController else {
            XCTFail("LoginViewController is not embedded in a navigation controller.")
            return
        }
        testLoginViewController.usernameTextField.text = "abc12345"
        testLoginViewController.passwordTextField.text = "abc@12345"
        testLoginViewController.loginButtonPressed(UIButton())
        RunLoop.current.run(until: Date())
        XCTAssertTrue(navigationController.topViewController is LoginDetailViewController)
    }
}
