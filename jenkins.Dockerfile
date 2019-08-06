FROM 	jenkins/jenkins:lts
USER 	root
RUN 	apt-get update && \
    	apt-get -y install \
         apt-transport-https \
     	 ca-certificates \
     	 curl \
     	 gnupg2 \
     	 software-properties-common && \
    	curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
        curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg > /tmp/kkey; apt-key add /tmp/kkey && \
        add-apt-repository "deb https://apt.kubernetes.io/ kubernetes-xenial main" && \
    	add-apt-repository \
        	"deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
        	$(lsb_release -cs) \
        	stable" && \
    	apt-get update && \
    	apt-get -y install docker-ce kubectl