#!/bin/sh
#
# script to run minecraft on ARM linux.  for reference:
#
#   http://rogerallen.github.io/jetson/2014/07/31/minecraft-on-jetson-tk1/
#   https://devtalk.nvidia.com/default/topic/764821/embedded-systems/minecraft-on-the-jetson-tk1/
#   https://gist.github.com/rogerallen/91526c9c8be1a82881e0
#

#Dont change here!
#Minecraft Info
dir=pwd
forv=1.16.1
forve=1.16
forver=1.16.1-32.0.23
Xmx=2048

# !!! YOU MUST PERSONALIZE ALL OF THIS INFO !!!
# your personal login/password.  chmod 700 to keep this private
MINECRAFT_LOGIN=EmailHere
MINECRAFT_USERNAME=UserNameHere
MINECRAFT_PASSWORD=PasswordHere
# where did you store the native liblwjgl.so and libopenal.so?
MINECRAFT_NATIVE_PATH=${dir}/Minecraft/Natives
# info from initial run data in .minecraft/launcher_profiles.json
MINECRAFT_CLIENTTOKEN=99dd6764-7520-4105-b753-79acb47359a7
MINECRAFT_UUID=8637b649-a786-4258-8db2-ced20d7d60b7
MINECRAFT_VERSION=1.16.1-forge1.16.1-32.0.23


# SHOULD NOT NEED TO EDIT BELOW THIS LINE

# long list of paths from the minecraft logged commandline
CP=${dir}/.minecraft/libraries/net/minecraftforge/forge/forge-${forver}.jar:/home/pi/.minecraft/libraries/net/minecraft/launchwrapper/${forve}/launchwrapper-${forve}.jar:/home/pi/.minecraft/libraries/org/ow2/asm/asm-all/5.2/asm-all-5.2.jar:/home/pi/.minecraft/libraries/jline/jline/2.13/jline-2.13.jar:/home/pi/.minecraft/libraries/com/typesafe/akka/akka-actor_2.11/2.3.3/akka-actor_2.11-2.3.3.jar:/home/pi/.minecraft/libraries/com/typesafe/config/1.2.1/config-1.2.1.jar:/home/pi/.minecraft/libraries/org/scala-lang/scala-actors-migration_2.11/1.1.0/scala-actors-migration_2.11-1.1.0.jar:/home/pi/.minecraft/libraries/org/scala-lang/scala-compiler/2.11.1/scala-compiler-2.11.1.jar:/home/pi/.minecraft/libraries/org/scala-lang/plugins/scala-continuations-library_2.11/1.0.2/scala-continuations-library_2.11-1.0.2.jar:/home/pi/.minecraft/libraries/org/scala-lang/plugins/scala-continuations-plugin_2.11.1/1.0.2/scala-continuations-plugin_2.11.1-1.0.2.jar:/home/pi/.minecraft/libraries/org/scala-lang/scala-library/2.11.1/scala-library-2.11.1.jar:/home/pi/.minecraft/libraries/org/scala-lang/scala-parser-combinators_2.11/1.0.1/scala-parser-combinators_2.11-1.0.1.jar:/home/pi/.minecraft/libraries/org/scala-lang/scala-reflect/2.11.1/scala-reflect-2.11.1.jar:/home/pi/.minecraft/libraries/org/scala-lang/scala-swing_2.11/1.0.1/scala-swing_2.11-1.0.1.jar:/home/pi/.minecraft/libraries/org/scala-lang/scala-xml_2.11/1.0.2/scala-xml_2.11-1.0.2.jar:/home/pi/.minecraft/libraries/lzma/lzma/0.0.1/lzma-0.0.1.jar:/home/pi/.minecraft/libraries/net/sf/jopt-simple/jopt-simple/5.0.3/jopt-simple-5.0.3.jar:/home/pi/.minecraft/libraries/java3d/vecmath/1.5.2/vecmath-1.5.2.jar:/home/pi/.minecraft/libraries/net/sf/trove4j/trove4j/3.0.3/trove4j-3.0.3.jar:/home/pi/.minecraft/libraries/org/apache/maven/maven-artifact/3.5.3/maven-artifact-3.5.3.jar:/home/pi/.minecraft/libraries/com/mojang/patchy/1.1/patchy-1.1.jar:/home/pi/.minecraft/libraries/oshi-project/oshi-core/1.1/oshi-core-1.1.jar:/home/pi/.minecraft/libraries/net/java/dev/jna/jna/4.4.0/jna-4.4.0.jar:/home/pi/.minecraft/libraries/net/java/dev/jna/platform/3.4.0/platform-3.4.0.jar:/home/pi/.minecraft/libraries/com/ibm/icu/icu4j-core-mojang/51.2/icu4j-core-mojang-51.2.jar:/home/pi/.minecraft/libraries/net/sf/jopt-simple/jopt-simple/5.0.3/jopt-simple-5.0.3.jar:/home/pi/.minecraft/libraries/com/paulscode/codecjorbis/20101023/codecjorbis-20101023.jar:/home/pi/.minecraft/libraries/com/paulscode/codecwav/20101023/codecwav-20101023.jar:/home/pi/.minecraft/libraries/com/paulscode/libraryjavasound/20101123/libraryjavasound-20101123.jar:/home/pi/.minecraft/libraries/com/paulscode/librarylwjglopenal/20100824/librarylwjglopenal-20100824.jar:/home/pi/.minecraft/libraries/com/paulscode/soundsystem/20120107/soundsystem-20120107.jar:/home/pi/.minecraft/libraries/io/netty/netty-all/4.1.9.Final/netty-all-4.1.9.Final.jar:/home/pi/.minecraft/libraries/com/google/guava/guava/21.0/guava-21.0.jar:/home/pi/.minecraft/libraries/org/apache/commons/commons-lang3/3.5/commons-lang3-3.5.jar:/home/pi/.minecraft/libraries/commons-io/commons-io/2.5/commons-io-2.5.jar:/home/pi/.minecraft/libraries/commons-codec/commons-codec/1.10/commons-codec-1.10.jar:/home/pi/.minecraft/libraries/net/java/jinput/jinput/2.0.5/jinput-2.0.5.jar:/home/pi/.minecraft/libraries/net/java/jutils/jutils/1.0.0/jutils-1.0.0.jar:/home/pi/.minecraft/libraries/com/google/code/gson/gson/2.8.0/gson-2.8.0.jar:/home/pi/.minecraft/libraries/com/mojang/authlib/1.5.25/authlib-1.5.25.jar:/home/pi/.minecraft/libraries/com/mojang/realms/1.10.22/realms-1.10.22.jar:/home/pi/.minecraft/libraries/org/apache/commons/commons-compress/1.8.1/commons-compress-1.8.1.jar:/home/pi/.minecraft/libraries/org/apache/httpcomponents/httpclient/4.3.3/httpclient-4.3.3.jar:/home/pi/.minecraft/libraries/commons-logging/commons-logging/1.1.3/commons-logging-1.1.3.jar:/home/pi/.minecraft/libraries/org/apache/httpcomponents/httpcore/4.3.2/httpcore-4.3.2.jar:/home/pi/.minecraft/libraries/it/unimi/dsi/fastutil/7.1.0/fastutil-7.1.0.jar:/home/pi/.minecraft/libraries/org/apache/logging/log4j/log4j-api/2.8.1/log4j-api-2.8.1.jar:/home/pi/.minecraft/libraries/org/apache/logging/log4j/log4j-core/2.8.1/log4j-core-2.8.1.jar:/home/pi/.minecraft/libraries/org/lwjgl/lwjgl/lwjgl/2.9.4-nightly-20150209/lwjgl-2.9.4-nightly-20150209.jar:/home/pi/.minecraft/libraries/org/lwjgl/lwjgl/lwjgl_util/2.9.4-nightly-20150209/lwjgl_util-2.9.4-nightly-20150209.jar:/home/pi/.minecraft/libraries/com/mojang/text2speech/1.10.3/text2speech-1.10.3.jar:/home/pi/.minecraft/versions/${forv}/${forv}.jar
TWEAK_CLASS=net.minecraftforge.fml.common.launcher.FMLTweaker
# thanks to xRoyx on the nvidia dev forums for this update.
# the authtoken changes daily, so we need to login to authenticate

MINECRAFT_ATOKEN="$(\
curl -i \
  -H "Accept:application/json" \
  -H "content-Type:application/json" \
  https://authserver.mojang.com/authenticate \
  -X POST \
  --data '{"agent": {"name": "Minecraft","version": 1}, "username": "'$MINECRAFT_LOGIN'", "password": "'$MINECRAFT_PASSWORD'",  "clientToken": "'$MINECRAFT_CLIENTTOKEN'" }' \
  | sed '/accessToken":"/!d;s//&\n/;s/.*\n//;:a;/",/bb;$!{n;ba};:b;s//\n&/;P;D' \
)"
# '

echo "todays access token = "$MINECRAFT_ATOKEN

MINECRAFT_UUID="$(\
curl -X POST -H 'Content-Type: application/json' https://api.mojang.com/profiles/minecraft --data '"'$MINECRAFT_USERNAME'"' \
| sed '/id":"/!d;s//&\n/;s/.*\n//;:a;/",/bb;$!{n;ba};:b;s//\n&/;P;D' \
)"

echo "MINECRAFT_UUID="$MINECRAFT_UUID

# run minecraft with all the right commandline options
/opt/jdk/jdk1.8.0_211/bin/java \
    -Xmn256M -Xmx${Xmx}M \
    -XX:+UseConcMarkSweepGC \
    -XX:+CMSIncrementalMode \
    -XX:-UseAdaptiveSizePolicy \
    -Djava.library.path=$MINECRAFT_NATIVE_PATH \
    -cp $CP \
  net.minecraft.launchwrapper.Launch \
    --username $MINECRAFT_USERNAME \
    --accessToken "$MINECRAFT_ATOKEN" \
    --uuid "$MINECRAFT_UUID" \
    --version $MINECRAFT_VERSION \
    --userProperties {} \
    --gameDir ~/.minecraft \
    --assetsDir ~/.minecraft/assets \
    --assetIndex $MINECRAFT_VERSION \
    --tweakClass $TWEAK_CLASS
