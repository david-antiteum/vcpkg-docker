FROM ubuntu:20.04

RUN apt-get update && \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get install -y tzdata && \
	ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
	dpkg-reconfigure --frontend noninteractive tzdata && \
	apt-get install -y build-essential git cmake ninja-build python3 && \
	git -C "/opt" clone "https://github.com/Microsoft/vcpkg.git" && \
	/opt/vcpkg/bootstrap-vcpkg.sh -disableMetrics -useSystemBinaries && \
	ln -s "/opt/vcpkg/vcpkg" "/usr/local/bin/" && \
	vcpkg install boost
