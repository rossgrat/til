# Builtin-in Getters and Setters
Many languages have getters and setters that allow class variables to execute functions when they are updated. This can be useful for dynamically changing variables or updating. Examples in Typescript and Swift are below.
    ```typescript
    // Typescript
    class Person {
        firstName: string
        lastName: string
        get fullName() {
            return this.firstName + ' ' + this.lastName
        }
        set fullName(fullName: string) {
            let strs = fullName.split(' ')
            if (strs.length > 0) {
                this.firstName = strs[0]
            }
            if (strs.length > 1) {
                this.lastName = strs[1]
            }
        }
    }
    ```
    ```swift
    // Swift
    class Person {
        var firstName: String
        var lastName: String
        var fullName: String {
            get {
                return this.firstName + " " + this.lastName
            }
            set {
                ...
            }
        }
    }
    ```

