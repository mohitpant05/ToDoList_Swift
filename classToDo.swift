import Foundation

class TodoList {
    var userName: String
    var password: String
    var arr = [String]()
    
    func printTask() {
        var j = 0
        for i in arr {
            print("\(j + 1). \(i)")
            j += 1
        }
    }

    func addTask(value: String) {
        arr.append(value)
    }

    func removeTask(value: String) {
        if let index = arr.firstIndex(of: value) {
            arr.remove(at: index)
        } else {
            print("Task not found.")
        }
    }

    func toDoList() {
        var iValue = 0
        
        while iValue != 4 {
            print("To do list operations:\n1. Enter a task\n2. Delete a task\n3. Print List\n4. Log Out\nEnter Your Choice: ", terminator: "")
            if let uValue = readLine(), let choice = Int(uValue) {
                iValue = choice
            } else {
                print("Invalid input. Please enter a number.")
                continue
            }
            
            switch iValue {
            case 1:
                print("Enter your task: ", terminator: "")
                if let task = readLine() {
                    addTask(value: task)
                    printTask()
                }
            case 2:
                print("Enter the task you want to delete: ", terminator: "")
                if let task = readLine() {
                    removeTask(value: task)
                    printTask()
                }
            case 3:
                printTask()
            case 4:
                print("Logged Out Successfully")
            default:
                print("Invalid Choice")
            }
        }
    }
    
    func login(name: String, pass: String) {
        if userName == name && password == pass {
            print("Logged in Successfully")
            toDoList()
        } else {
            print("Invalid username or password")
        }
    }
    
    init(name: String, pass: String) {
        self.userName = name
        self.password = pass
    }
}

var users: [TodoList] = []

while true {
    print("Choose an option:\n1. Login\n2. Create New User\n3. Delete Existing User\n4. List Existing Users\n5. Exit\nEnter your choice: ", terminator: "")
    guard let uValue = readLine(), let iValue = Int(uValue) else {
        print("Invalid input. Please enter a number.")
        continue
    }
    
    switch iValue {
    case 1:
        print("Enter Username: ", terminator: "")
        if let username = readLine() {
            if let user = users.first(where: { $0.userName == username }) {
                print("Enter Password: ", terminator: "")
                if let passw = readLine() {
                    user.login(name: username, pass: passw)
                }
            } else {
                print("Username does not exist.")
            }
        }
    case 2:
        print("Enter Username for the new user: ", terminator: "")
        if let username = readLine() {
            print("Enter password: ", terminator: "")
            if let passw = readLine() {
                let user = TodoList(name: username, pass: passw)
                users.append(user)
                print("User created successfully.")
            }
        }
    case 3:
        print("Enter Username of the user to delete: ", terminator: "")
        if let username = readLine() {
      
            if let index = users.firstIndex(where: { $0.userName == username }) {
              print("Enter Password for the same : ", terminator: "")
        let passw = readLine()!
            if(users[index].password == passw){
                users.remove(at: index)
                print("User deleted successfully.")}
                else{
                    print("Wrong Password unable to delete th user ")
                }
            } else {
                print("Username does not exist.")
            }
        }
    case 4:
        print("Existing Users:")
        for user in users {
            print(user.userName)
        }
    case 5:
        print("Exiting program.")
        exit(0)
    default:
        print("Invalid Choice")
    }
}
