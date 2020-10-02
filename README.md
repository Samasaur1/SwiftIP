# SwiftIP

A library to help with getting IP addresses in Swift.

## Installing

Add the following to your `Package.swift`:
```swift
.package(url: "https://github.com/Samasaur1/SwiftIP.git", from: "1.1.0"),
```

Or use [Ice](https://github.com/jakeheis/Ice):
```sh
$ ice add SwiftIP
```

## Usage

The documentation is available here: [https://samasaur1.github.io/SwiftIP/](https://samasaur1.github.io/SwiftIP/)

Effectively, however, you do this:
```swift
import SwiftIP

let localIP: String
do {
    localIP = try IP.local()
} catch is IP.Error {
    fatalError("Could not find local IP")
}

let publicIP: String? = IP.publicIP

print("Local IP: \(localIP); public IP: \(publicIP ?? "Not connected")")
```

If you want to capture the error as a constant, you can use `catch let error as IP.error`, but as of 1.1.0 the errors don't have any more information.
