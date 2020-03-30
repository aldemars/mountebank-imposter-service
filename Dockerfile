FROM node:12.16.1-alpine3.11

CMD ["mb"]

ENV MOUNTEBANK_VERSION=2.2.0

RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production \
 && npm cache clean --force 2>/dev/null \
 && rm -rf /tmp/npm*

ADD /imposters /mb/

EXPOSE 2525
EXPOSE 8090
EXPOSE 42000

CMD mb start --configfile /mb/imposters.ejs --allowInjection

