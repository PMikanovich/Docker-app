FROM nginx:latest
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install nodejs git -y && rm -rf /var/lib/apt/lists/* 
RUN git clone https://github.com/molly/static-timeline-generator.git /tmp/
WORKDIR /tmp/
RUN npm install
RUN npm run-script build
RUN cp -r ./_site/* /usr/share/nginx/html/
RUN rm -rf /tmp/