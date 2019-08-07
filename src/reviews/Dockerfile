FROM gradle:jdk8 as build
ADD . /home/gradle/project/
WORKDIR /home/gradle/project/
RUN gradle build


FROM websphere-liberty:19.0.0.5-javaee8
ENV SERVERDIRNAME reviews
COPY --from=build /home/gradle/project/reviews-application/build/libs/reviews-application-1.0.war /opt/ibm/wlp/usr/servers/defaultServer/apps
COPY reviews-wlpcfg/servers/LibertyProjectServer/server.xml /opt/ibm/wlp/usr/servers/defaultServer
RUN /opt/ibm/wlp/bin/installUtility install  --acceptLicense /opt/ibm/wlp/usr/servers/defaultServer/server.xml

ARG service_version
ARG enable_ratings
ARG star_color
ENV SERVICE_VERSION ${service_version:-v3}
ENV ENABLE_RATINGS ${enable_ratings:-true}
ENV STAR_COLOR ${star_color:-red}

CMD ["/opt/ibm/wlp/bin/server", "run", "defaultServer"]