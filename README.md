<img width="2000" height="1125" alt="image" src="https://github.com/user-attachments/assets/8f1d2995-8b55-4c78-a294-4c3bcb52740e" />


# AndroidWeb - revolutionary invention of entire flutter world

turn any website into an “android app” (because why not)

## setup

```bash
git clone https://github.com/jasurlive/AndroidWeb.git
cd AndroidWeb
```

## structure

```text
lib/
├─ loader.dart
├─ main.dart
├─ page.dart
```

edit url in `page.dart`

```bash
flutter pub get
```

(optional) edit permissions as you like in  
`android/app/src/main/AndroidManifest.xml`

## build

big brain move: smaller apk (~13–15MB) instead of chunky ~60MB  

```bash
flutter build apk --release --split-per-abi
```

use **arm64-v8a** unless you enjoy living in 2012

## what it does

opens your site  
wraps it in a webview  
pretends it’s an app  

that’s it

## bugs / ideas

open PR  
or don’t  
your call bro