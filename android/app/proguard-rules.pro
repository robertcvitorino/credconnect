# Manter classes da biblioteca Google Crypto Tink
-keep class com.google.crypto.tink.** { *; }
-dontwarn com.google.crypto.tink.**

# Manter classes da biblioteca Google HTTP Client
-keep class com.google.api.client.** { *; }
-dontwarn com.google.api.client.**

# Manter classes da biblioteca Joda-Time
-keep class org.joda.time.** { *; }
-dontwarn org.joda.time.**

# Manter anotações comuns que podem ser removidas incorretamente
-keep class com.google.errorprone.annotations.** { *; }
-keep class javax.annotation.** { *; }
-dontwarn com.google.errorprone.annotations.**
-dontwarn javax.annotation.**