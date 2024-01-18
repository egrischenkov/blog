## Introduction

Hi there! Today I'm going to tell about such important topic in programming as `NULL`, its history and find out how Dart solves the problem of work with null values.

&nbsp;

Let's start with a definition. Null is a special value or state which indicates an absence of information or data in variable. In other words Null represents the absence of value.

&nbsp;

![](resource:assets/articles/resources/null_in_dart/null_en.png)

&nbsp;

**What is role of Null?**

Here it's worth starting with history of Null. Before Null was existing, references to entities in low-level programming languages could contain garbage or arbitrary values if they were not explicitly initialized. It was happening because of memory management features. And when it was happening program might behave really weird - serious errors, failures or even data leaks occurs. And of course, this can't be liked by anyone.

&nbsp;

And this is where the null concept comes to the rescue. It helps us avoid unpredictable program's behaviour which can occurs if reference doesn't have any value and points to an arbitrary memory area. Though null also may lead to errors if you don't use it carefully. There are such probles as forgetting to check for null, incorrect use and mistakes in the code. That is why some programming laguages are searching for alternate solutions for handling null related errors to reduce the risk of errors and make code safer and more predictable.

&nbsp;

`C` code example:

```c
#include <stdio.h>

int main() {
    int* ptr; // Here we declare a pointer to int and don't initialize it.

    int x = *ptr; // Here we try to read value from an uninitialized pointer.

    printf("x value: %d\n", x);

    return 0;
}
```

&nbsp;

# History of Null

The history of the invention of null is quite fascinating, since its creator, Anthony Hoare (an English computer scientist who is also known for developing the “quick sort” algorithm), almost 50 years later, made a presentation with a title - “Null References: The Billion Dollar Mistake”. He said that he invented null, because it was most obvious solution for handling situations pointing to an arbitrary memory area. At the beggining of presentation he was underlining that most of errors and failures are relate to null pointers. That’s actually why the presentation is called that.

&nbsp;

![](resource:assets/articles/resources/null_in_dart/father_of_null_en.png)

&nbsp;

**Most negative consequences according to null related errors**
1. Variable has no value. Null usually used for indicating the absence of a value or object. It means that null variable doesn't have any value or reference to object. This may leads to a situation when code tries to access value or object that actually doesn't exist which causes an error.
2. Implicit checking. Oftenly programmers may forget to check variables for null before using them. This can leads to a situation where code is trying to access null, causing error or exceptions.
3. Implicit conversion. In some programming languages null can be implicitly converted to other data types. And this can leads to unpredictable program behaviour.
4. Difficult to debug. Null errors can be really difficult to identify and fix. Because Null can be in several variables it may be uneasy to find source of errors.
5. Unpredictable behaviour. Using null can cause program to behave unexpectedly depending on its current state. This can make code difficult to develop and maintain.

&nbsp;

So problem with null is that anybody can cause situations where code works upredictable. And this can leads to runtime errors which may be difficult to debug. So Hoar ends a lecture with a call to programmers and language developers to think about "Null problem" and strive to find more reliable ways to deal with null values. And Dart developers were no exception as they developed a null safety mechanism.

&nbsp;

# Null in Dart

Since Dart developed there were null and he was using for specifying absence of value or uninitialized variable.

It worth noting that such value could created in result from any call to type as previous type system allowed it.  

&nbsp;

![](resource:assets/articles/resources/null_in_dart/old_null_in_dart.png)

&nbsp;

Thanks to such type hierarchy it's getting more clear that it was possible because Null was a subtype for all type. So null could easily get into program and cause various exeptions.
 
 Example:
```dart
bool isEmpty(String string) => string.length == 0;

main() {
  isEmpty(null); // Causes NoSuchMethodException
}
```

Which of cource is completely unsafe.

Therefore Dart command decided not to stand aside and follow examples of languages such as Kotlin, Swift, Rust and many others. So they developed their own concept - `Null Safety`. This concept intends to safe programmers from null related errors and the basis of its work is that it changed all potential runtime errors to so-called edit-time errors.

&nbsp;

This means that analyzer will force us:
- mandatory assign value to variables that don't have a null value.
- prohibit setting the value null to such variables.
  
&nbsp;


In order to achieve this, the Dart team followed certain principles:

1. **Code should be safe by default**: It means that code creation using only Null Safety must not leads to exceptions.

2. **Null safe code should be easy to write**: Nothing too new is added to the syntax of language, therefore it will remain just as easy to write.
3. **The resulting null safe code should be fully sound**: This priciple ensures that code already written with Null Safety should be reliable unless you bypass rules yourself.

&nbsp;

But you need to understand that elimination of null isn't main goal for Dart command as there is nothing bad with null. Actually it's rather convenient if we want to specify absence of value, like in optional parameters when user has a right not to pass them all. As documentation says: "It is not null that is bad, it is having null go where you don’t expect it that causes problems." To minimize such unexpected moments Dart provides us with certain instruments and an updated type system. 

&nbsp;

# Null Safety features

Dart's new type system looks like:

&nbsp;

![](resource:assets/articles/resources/null_in_dart/new_type_system.png)

&nbsp;

Here we can see that Null is no more the subtype of all types and has been moved to a separate branch. Thus Dart fundamentally solves problem of accessing null since all types are now non-nullable by default. 

&nbsp;

However as we already said Null isn't useless. There are situations when he can be really necessary. Let's look at an example from the documentation:

```dart
void makeCoffee(String coffee, [String? dairy]) {
  if (dairy != null) {
    print('$coffee with $dairy');
  } else {
    print('Black $coffee');
  }
}
```

Such type assignment -`String?` declares nullable types. We talk about that later, but in a nutshell such type can declare one of two values: either `String` or `Null`. 
Thanks to that we have ability to leave this parameter empty and he will be nullable by default.

&nbsp;


Now let's take a look at Nullable types.

&nbsp;

![](resource:assets/articles/resources/null_in_dart/nullable_schema.png)

&nbsp;

This type assignment with a question mark creates `Union` type under the hood..

&nbsp;

### Union types

Union types is a concept that allows variables store values in different types. They are called union types because they unite several types as one. It's rather usefull if you need store different data in single variable. 

&nbsp;

The concept of Union types has its roots in functional programming languages such as Haskell and ML. In these languages the Union type also called "Algebraic Data Types" was an important part of the type system. They were designed to provide type safety and handle different forms of data.

&nbsp;

Over time idea of Union types spread to other languages including Dart. Different languages have different ways of implementing Union types.

&nbsp;

In Dart you can use libraries for creating Union types. For example - `sealed_unions`:

```dart
import 'package:sealed_unions/sealed_unions.dart';

class MyUnionType extends Union2Impl<int, String> {
  MyUnionType._(Union2<int, String> union) : super(union);

  factory MyUnionType.intType(int value) => MyUnionType._(Union2<int, String>.first(value));
  factory MyUnionType.stringType(String value) => MyUnionType._(Union2<int, String>.second(value));
}
```

But since 3.0 version Dart provides sealed classes. And now you can create such structures:

```dart
void main() {
  // Creates Null value
  var nullableString1 = NullableString.nullValue();

  // Creates String value
  final nullableString2 = NullableString.stringValue('Hello, world!');

  // Null check
  if (nullableString1 is NullValue) {
    print('nullableString1 is null');
  }
  if (nullableString2 is StringValue) {
    print('nullableString2 is a String with value: ${nullableString2.value}');
  }
  if (nullableString2 is StringValue) {
    final value = nullableString2.value;
    // Some work with value
  }
  
  // Changes String to Null
  nullableString1 = NullableString.stringValue('fdsdf'); 
}

sealed class NullableString {
  const NullableString();

  factory NullableString.nullValue() = NullValue;

  factory NullableString.stringValue(String value) = StringValue;
}

class NullValue extends NullableString {
  const NullValue() : super();
}

class StringValue extends NullableString {
  final String value;

  const StringValue(this.value) : super();
}
```

&nbsp;

Let's return to nullable types. So we found that nullable are Union types. There are two more points you need to remember about them:

1. Dart compiler allows `String` variables to be assigned values of type `String?` without explicit type casting, because `String?` is a more general type that includes `String`. However you cannot safely assign a `String` variable to the value `String?` without using an explicit type cast or null check.

```dart
String? nullableString = 'lolkek';
String string = nullableString; // Analyzer won't be happy
// Need to make explicit casting
String string = nullableString!;
```
2. Any method call on nullable types is impossible. Exeptions: `toString`, `hashCode`, `==`.

```dart
void bad(String? maybeString) {
  print(maybeString.length); // Analyzer won't be happy
  // But here we are all right!
  final isNull = maybeString == null;
}
```

In order to avoid exhaustive `if` checks we can use `?` opeerator.

```dart
String notAString = null;
print(notAString?.length); // prints: null
```

`?` operator avoids errors according to access to object methods and fields if that object is Null. So if `notAString` is `null` then `notAString?.length` will return `null` rather then raise an error.

&nbsp;

The `?` operator can also be used in a chain. Before Dart 2.12 you had to check for each call in the chain in order to avoid erros.

```dart
String? notAString = null;
print(notAString?.length?.isEven);
```

However since Null Safety we just need only one check:

```dart
String? notAString = null;
print(notAString?.length.isEven);
```
&nbsp;

Now taking into account everything previously described it's worth taking a look at the final hierarchy:

&nbsp;

![](resource:assets/articles/resources/null_in_dart/top_bottom_type.png)

&nbsp;


If you need to use type that covers all nullable types you had to use `Object?` instead of `Object`. This way you will include all Nullable types in the list of eligible types.

```dart
void main() {
  String? nullable;
  String nonNullable = 'non-nullable';
  
  if (nullable is Object?) {
    print('nullable branch');
  }
  if (nonNullable is Object?) {
    print('non-nullable branch');
  }
}
```

Type `Never` can be usefull in rare cases. Usually when you need to specify that method will never return value. For example when method generates exception:

```dart
Never wrongType(String type, Object value) {
  throw ArgumentError('Expected $type, but was ${value.runtimeType}.');
}
```

We still have two more important topics to discuss which have become relevant with the advent of Null Safety. These are **Flow analysis** and **late** variables.

&nbsp;

## Flow Analysis

Flow analysis is an important aspect of code compilation and optimisation which is usually hidden from users but plays an important role in ensuring security and perfomance of programs.

&nbsp;

Since Null Safety there has included flow analysis for providing type safety. This means that Dart compiler can now analyse code and understand what types may be at certain points. This allows compiler to catch potential null errors at compile time making the code safer and more predictable.

&nbsp;

Here is an example of using flow analysis in Dart:

```dart
bool isEmptyList(Object object) {
  if (object is List) {
    return object.isEmpty; // Flow analysis reminds you that object's type is List and you can call isEmpty
  } else {
    return false;
  }
}
```

Notice how on the marked line we can call `isEmpty` on `object`. This method is from List not from Object. This works because if we check type with key word `is`. And if this check will return true value then we will be able to call methods and fields of that type. Since Null Safety such checks are available. If check will not retrn null then we can call all object methods and fields without explicit casting.

```dart
int stringLength1(String? stringOrNull) {
  return stringOrNull.length; // error stringOrNull may be null
}

int stringLength2(String? stringOrNull) {
  if (stringOrNull != null) return stringOrNull.length; // ok
  return 0;
}
```
&nbsp;

## Late

Since Null Safety there appeared new key word `late` in Dart which is using for lazy initialization. This means that you can now declare variable and assign a value to it later. The main uses of `late` are:

&nbsp;

### Late final variables:

```dart
class Coffee {
  late String _temperature;

  void heat() {
    _temperature = 'hot';
  }

  void chill() {
    _temperature = 'iced';
  }

  String serve() => _temperature + ' coffee';
}
```

&nbsp;

### Lazy initialization:

```dart
class Weather {  
    late int _temperature = _readThermometer();
}
```

When you do this, the initializer becomes lazy. Instead of running it as soon as the instance is constructed, it is deferred and run lazily the first time the field is accessed. 

&nbsp;

## Conclusion

![](resource:assets/articles/resources/null_in_dart/offer.png)

Null Safety in Dart is a new functionality that intends to avoid null related errors in your code. This includes annotations that allows to specify if variable has null value or not. This improves code safety because many errors involving null pointers can be detected at compile time rather than during program execution.

&nbsp;


The bottom line is that using Null Safety in Dart not only increases the reliability and security of your code, but also helps make development more efficient and satisfying, making this functionality an important part of modern development in the language.

&nbsp;

### Usefull links:

- **Article "Null (programming)" on Wikipedia*:
   [Null (programming)](https://en.wikipedia.org/wiki/Null_(programming))
   Here you can find common information about Null, it's history and usage in different programming languages.

- **Presentation "The billion dollar mistake"**:
   [The billion dollar mistake](https://www.infoq.com/presentations/Null-References-The-Billion-Dollar-Mistake-Tony-Hoare/)
   This is a video presentation by Tony Hoare - father of null.
  
- [Some article on  Medium](https://medium.com/swlh/we-need-to-stop-using-null-heres-why-c56ff3ac72dd)

- [freeCodeCamp](https://www.freecodecamp.org/news/a-quick-and-thorough-guide-to-null-what-it-is-and-how-you-should-use-it-d170cea62840/)
  Article which gives deeper explanation of null.
****