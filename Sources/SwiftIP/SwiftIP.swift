import Foundation

public final class IP {
    public enum Version: String {
        case IPv4 = "ipv4"
        case IPv6 = "ipv6"
    }

    private init() {}

    public class func `public`(_ version: Version = .IPv4) -> String? {
        let semaphore = DispatchSemaphore(value: 0)
        let url = URL(string: "https://\(version.rawValue).icanhazip.com")!//i can haz ip
        let request = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)

        var ip: String? = nil
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                return
            }
            ip = String(data: data, encoding: .utf8)
            semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        return ip
    }

    public class func local(_ version: Version = .IPv4) -> String? {
        var addresses = [String]()

        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {

            // For each interface ...
            var ptr = ifaddr
            while ptr != nil {
                guard let pointer = ptr else {
                    return nil
                }
                let flags = Int32(pointer.pointee.ifa_flags)
                var addr = pointer.pointee.ifa_addr.pointee

                // Check for running IPv4, IPv6 interfaces. Skip the loopback interface.
                if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                    if addr.sa_family == UInt8(version == .IPv4 ? AF_INET : AF_INET6) {

                        // Convert interface address to a human readable string:
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),
                                        nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                            //                        if let address = String(cString: hostname) {
                            //                            addresses.append(address)
                            //                        }
                            addresses.append(String(cString: hostname))
                        }
                    }
                }
                ptr = pointer.pointee.ifa_next
            }
            freeifaddrs(ifaddr)
        }

        return addresses.first
    }
}
