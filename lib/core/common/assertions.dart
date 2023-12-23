/// Checks if the type [Sub] is a subtype of [Super] by attempting to treat
/// an empty list of [Sub] as a list of [Super].
///
/// There is no way in Dart to "promote" a type variable to have a bound that it didn't originally have
/// [Check](https://stackoverflow.com/a/65700377/15174002)
bool isSubtype<Sub, Super>() => <Sub>[] is List<Super>;
