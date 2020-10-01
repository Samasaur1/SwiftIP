# SwiftIP

A library to help with getting IP addresses in Swift.

## Installing

Add the following to your `Package.swift`:
```swift
.package(url: "https://github.com/Samasaur1/SwiftIP.git", from: "2.0.0"),
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

guard let localIP = IP.local() else {
    fatalError("Could not find local IP")
}

let publicIP: String? = IP.public()

print("Local IP: \(localIP); public IP: \(publicIP ?? "Not connected")")
```
