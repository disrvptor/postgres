FROM postgres:9.6

RUN apt-get update && \
	apt-get install -y \
	make \
	gcc \
	openssl \
	zlibc \
	flex \
	bison \
	perl \
	libreadline-dev \
	zlib1g-dev \
	libssl-dev \
	git && \
	cd /root && \
	mkdir src && \
	cd $_ && \
	git clone --depth 1 --branch REL9_6_STABLE https://github.com/disrvptor/postgres.git && \
	cd postgres && \
	export CFLAGS="-DDOCKER" && \
	export CPPFLAGS="-DDOCKER" && \
	./configure --with-openssl --exec-prefix=/usr/lib/postgresql/9.6/ && \
	make && \
	make install && \
	cd /root && \
	rm -fr postgres && \
	apt-get autoremove -y \
	make \
	gcc \
	git