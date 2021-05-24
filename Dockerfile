FROM rocker/shiny-verse:latest

# need to make this for folders of app and data
# currently Hist_App and Scatter_App
#COPY *.Rproj /srv/shiny-server/
#COPY *.R /srv/shiny-server/
#COPY data /srv/shiny-server/data
ADD Hist_App /srv/shiny-server
ADD Scatter_App /srv/shiny-server
# COPY shiny-server.conf /etc/shiny-server

# select port
EXPOSE 3838

# allow permission
RUN sudo chown -R shiny:shiny /srv/shiny-server

# Copy further configuration files into the Docker image
COPY shiny-server.sh /usr/bin/shiny-server.sh

RUN ["chmod", "+x", "/usr/bin/shiny-server.sh"]

# run app
CMD ["/usr/bin/shiny-server.sh"]
