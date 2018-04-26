## Simplify using Redux with Flutter

These days you may here about raising start of mobile cross platform [Flutter](https://flutter.io), me too so I decided to check  and quickly like it. But instead of have one strong recommend development pattern, you can write Flutter in many ways. There are a lot of wonderful writing about Flutter development pattern for you to choose, such as [Flutter architecture samples](https://github.com/brianegan/flutter_architecture_samples), [scoped_model](https://pub.dartlang.org/packages/scoped_model) and [Flutter MVP architecture](https://medium.com/@develodroid/flutter-iv-mvp-architecture-e4a979d9f47e). 

Among of these pattern, I decided to try [Redux](https://pub.dartlang.org/packages/redux) pattern which I heard alot about it but have no change to practice. 

I don't intend to explain about Flutter-Redux and I assume you already familiar with them, instead I want to share my trouble and solution when I approach.

#### The Application

Alright let make an simple application for practice. The application is about download a list from Server, display it with filter and able to add more data, simple enough but have some foundation for a real world application. 
![Sample](/Users/csnguyen/Downloads/Sample smaller.gif)

Below is how my project grow up:

#### Part1: Load and display the List

Tap to refresh button to start getting list through API, show indicator, show dialog in case error or update list in case success, stop indicator. Here is my Redux setup

**AppState**

* ListData
* IsLoading
* ErrorMessage

**Action**

* GetListRequest
* GetListSuccess with Data
* GetListFail with Message
* ResetErrorMessage

**Middleware**

* Handle GetListRequest: call API
  * Success: dispatch GetListSuccess with Data
  * Fail: dispatch GetListFail with Message

**Reducer**

- Handle GetListRequest
  - Update AppState with: IsLoading = true
- Handle GetListSuccess with data
  - Update AppState with: IsLoading = false, ListData = data
- HandleGetListFail with message
  - Update AppState with: IsLoading = false, ErrorMessage = message
- Handle ResetErrorMessage
  - Update AppState with: ErrorMessage = null

**UI Connect**

* UI List update when AppState-ListData change
* UI Spinner show or hide when AppState-IsLoading change
* UI Dialog show or hide when AppState-ErrorMessage change


**UI Action**

* Refresh button tapped event: dispatch GetListRequest
* Done dialog button tapped event: dispatch ResetErrorMessage

  ​

