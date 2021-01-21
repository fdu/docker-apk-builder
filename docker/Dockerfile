FROM debian:buster

ENV USER				deb
ENV UID					1000
ENV GID					1000
ENV DEBIAN_FRONTEND			noninteractive
ENV ANDROID_HOME			/home/$USER/android-sdk-linux
ENV ANDROID_API_LEVELS                  android-30
ENV ANDROID_BUILD_TOOLS_VERSION         30.0.2
ENV ANDROID_SDK_URL			https://dl.google.com/android/repository/commandlinetools-linux-6858069_latest.zip

RUN apt update                                                                                                                          
RUN apt install -y sudo openjdk-11-jdk curl unzip gradle git                                                                            
RUN echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers
RUN groupadd --gid $GID $USER
RUN useradd -rm -d /home/$USER -s /bin/bash -g $USER -G sudo -u $UID $USER                                                              

USER $USER
WORKDIR /home/$USER
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/cmdline-tools/bin
RUN curl -o /tmp/sdk.zip $ANDROID_SDK_URL
RUN mkdir ${ANDROID_HOME}
RUN unzip /tmp/sdk.zip -d ${ANDROID_HOME}
RUN rm -f /tmp/sdk.zip
RUN yes | sdkmanager --sdk_root="${ANDROID_HOME}" --update
RUN yes | sdkmanager --sdk_root="${ANDROID_HOME}" \
	"platforms;${ANDROID_API_LEVELS}" \
	"build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
	"extras;google;m2repository" \
	"extras;android;m2repository" \
	"extras;google;google_play_services"
RUN yes | sdkmanager --sdk_root="${ANDROID_HOME}" --licenses

COPY scripts scripts
