        // Task 1    👍

var a = -2
var b = 2 + 5
var c = a > b ? a : b
        
        // Task 2    👍

var userName = "Alex"
var userAge = 21

var inputName = "Alex"
        if userName == inputName && userAge < 18 {
            print("user under 18")
        } else {
            if userName == inputName && userAge >= 18 {
                print("user over 18")
            } else {
                print("no such user")
            }
        }

        // Task 3    👍

        // switch
var age = 156
        switch age {
        case 18...65:
            print("access is allowed")
        case 65...: ///здорово, что знаешь про такой вид записи, но здесь он не совсем логичен, потому что можно вести возраст 1000 лет, понятно, что доступ будет отклонен, но лучше сразу пресечь попытки ввода всех таких странных возрастов.
            print("service for persons under 65")
        default:
            print("access is denied")
        }
       
        // if
        if age < 18 {
            print("access is denied")
        } else {
            if age > 65 {
                print("service for persons under 65")
            } else {
                print("access is allowed")
            }
        }

        // Task 4    👍
var balance = [5, 9, -10, 18, -5]
var summ = 0
        for i in balance {
            print(i)
            summ += i
        }
print("Сумма на балансе: \(summ)!")

        
        // Task 5    👍
var emptyArray = [AnyObject]()
var isEmpty = emptyArray.isEmpty
print(isEmpty ? "Array is empty" : "Array is not empty")

        // Task 6    👍
    
var userId = [1,2,3,3,3,4,5,5,5,6,6,7,8,9,10,11,12,13,13,14,15,15,15]
var userIdwithoutDuplicates = Array(Set(userId))
print(userIdwithoutDuplicates.sorted())
        
        // Task 7    👍
        let months = ["Jan" : 31,
                      "Feb" : 28,
                      "Mar" : 31,
                      "Apr" : 30,
                      "May" : 31,
                      "Jun" : 30,
                      "Jul" : 31,
                      "Aug" : 31,
                      "Sep" : 30,
                      "Oct" : 31,
                      "Nov" : 30,
                      "Dec" : 31]
        for (key, value) in months {
            print("There are \(value) days in \(key) ")
        }

        // Task 8    👍

        var userList = [0875 : "Alex",
                        0678 : "Bob",
                        7789 : "Casey"]
        
        userList.removeValue(forKey: 0678)
        userList.removeValue(forKey: 0875)
        userList[8999] = "Jhon"
        userList[1245] = "Tracy"
        
        for (key, value) in userList {
            print("\(value) - ID: \(key) ")
        }
