# SURL

Swifty URL


```swift
"https://raw.githubusercontent.com/0xLeif/0xLeif/master/README.md"
    .url?
    .get  { (data, response, error) in
    
    print(String(data: data!, encoding: .utf8))
    
}
```
