FROM gradle:6.3.0-jdk14

#------------------- cross compile dependencies -------------------------------
RUN apt-get update --fix-missing
RUN apt-get install -y binutils

#------------------- install JDKs for Windows and Mac -------------------------
RUN mkdir -p /usr/java/win
WORKDIR /usr/java/win
RUN wget --no-verbose https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_windows-x64_bin.zip
RUN unzip openjdk-14.0.1_windows-x64_bin.zip && rm openjdk-14.0.1_windows-x64_bin.zip
RUN wget --no-verbose --output-document javafx-14-0-1-jmods-windows.zip https://gluonhq.com/download/javafx-14-0-1-jmods-windows
RUN unzip -o javafx-14-0-1-jmods-windows.zip && rm javafx-14-0-1-jmods-windows.zip

RUN mkdir -p /usr/java/mac
WORKDIR /usr/java/mac
RUN wget --no-verbose https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_osx-x64_bin.tar.gz
RUN tar -xzf openjdk-14.0.1_osx-x64_bin.tar.gz && rm openjdk-14.0.1_osx-x64_bin.tar.gz
# since the Mac JDK has a different folder name, we rename the folder to be consistent across all platforms
RUN mv jdk-14.0.1.jdk jdk-14.0.1
RUN wget --no-verbose --output-document javafx-14-0-1-jmods-mac.zip https://gluonhq.com/download/javafx-14-0-1-jmods-mac
RUN unzip -o javafx-14-0-1-jmods-mac.zip && rm javafx-14-0-1-jmods-mac.zip
#------------------------------------------------------------------------------
