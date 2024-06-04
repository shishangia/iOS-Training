import Cocoa

// Lazy properties are the kind of properties which are initialized only when they are called or accessed. They are usually used for resource heavy tasks. Putting resource heavy tasks into lazy properties will significantly increase the app performance for the other use cases.

struct Test {
    lazy var resourceHeavyTask: String = {
        return "Resource Heavy Task Completed"
    }()
}

var test = Test()
print(test) // Check print - resourceHeavyTask will be nil
print(test.resourceHeavyTask)
