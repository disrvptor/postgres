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
	git && \
	cd /root && \
	mkdir src && \
	cd $_ && \
	git clone --depth 1 --branch REL9_6_1 https://github.com/postgres/postgres.git && \
	cd postgres && \
	./configure --with-openssl && \
	make && \
	make install
