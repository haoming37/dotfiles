FROM ubuntu:16.04

ENV ANDROID_HOME=/opt/androidsdk
ENV ANDROID_SDK_ROOT=/opt/androidsdk
ENV PATH=$ANDROID_SDK_ROOT:$ANDROID_SDK_ROOT/bin:$PATH
ENV SDK_FILENAME=sdk-tools-linux-4333796.zip
RUN DEBIAN_FRONTEND=noninteractive;apt-get update && apt-get -y install -y \
    qemu-kvm \
    libvirt0 \
    libvirt-bin \
    virt-manager \
    bridge-utils \
    openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*
RUN curl -O https://dl.google.com/android/repository/$SDKFILENAME \
    && mkdir -p $ANDROID_SDK_ROOT \
    && unzip $SDK_FILENAME -d $ANDROID_SDK_ROOT \
    && rm $SDKFILENAME
RUN echo yes | sdkmanager --licenses \
    && echo y | sdkmanager --install \
    "system-images;android-26;google_apis;x86_64" \
    "platforms;android-26" \
    "platform-tools" \
    && avdmanager create avd -n nexus5x -k "system-images;android-26;google_apis;x86_64" -d 9

