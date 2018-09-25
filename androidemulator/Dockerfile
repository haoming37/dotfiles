FROM ubuntu:16.04
#Install Package
RUN apt-get update && apt-get -y install --no-install-recommends \
    vim \
    unzip \
    curl \
    openjdk-8-jdk \
    qemu-kvm \
    libvirt0 \
    libvirt-bin \
    virt-manager \
    bridge-utils \
    openjdk-8-jdk \
    openssh-server \
    tightvncserver \
    lxde-core \
    lxde \
    lxterminal \
    xrdp \
    xfonts-base \
    fonts-ipafont \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
#Setup VNC
ENV USER ROOT
ENV DISPLAY :1
RUN echo "password\npassword\n" | vncpasswd
EXPOSE 5901
#Setup SSH
EXPOSE 22
RUN mkdir -p /var/run/sshd
RUN sed -i -e '/PermitRootLogin/ s/yes/no/' /etc/ssh/sshd_config
#Setup ANDROID SDK AND EMULATOR
ENV ANDROID_HOME=/opt/androidsdk
ENV ANDROID_SDK_ROOT=/opt/androidsdk
ENV PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/tools/bin:$PATH
ENV SDK_FILENAME=sdk-tools-linux-4333796.zip
RUN curl -O https://dl.google.com/android/repository/$SDK_FILENAME \
    && mkdir -p $ANDROID_SDK_ROOT \
    && unzip $SDK_FILENAME -d $ANDROID_SDK_ROOT \
    && rm $SDK_FILENAME
RUN yes | sdkmanager --licenses 
RUN echo y | sdkmanager --install \
    "system-images;android-26;google_apis;x86_64" \
    "platforms;android-26" \
    "platform-tools" 
RUN avdmanager create avd -n nexus5x -k "system-images;android-26;google_apis;x86_64" -d 9
#Startup
COPY startup.sh /root/
CMD ["/root/startup.sh"]
