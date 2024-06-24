import Cocoa

extension String {
    static func convertFrom(date: Date, format: String = "dd/MM/yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
}

let now = Date()
print(String.convertFrom(date: now))

func taskA() {
    print("Task A started")
    Thread.sleep(forTimeInterval: 2)
}

func taskB() {
    print("Task B started")
    Thread.sleep(forTimeInterval: 2)
}

func taskC() {
    print("Task C started")
    Thread.sleep(forTimeInterval: 2)
}

DispatchQueue.main.async {
    taskA()
    print("Task A completed")

    DispatchQueue.main.async {
        taskB()
        print("Task B completed")
        
        DispatchQueue.main.async {
            taskC()
            print("Task C completed")
        }
    }
}
