# Regras para a biblioteca Google Tink (usada pelo flutter_secure_storage)
-keepclassmembers class com.google.crypto.tink.** { *; }
-keep class com.google.crypto.tink.** { *; }

# Regras para anotações que o Tink utiliza
-keep class com.google.errorprone.annotations.** { *; }
-keep class javax.annotation.** { *; }