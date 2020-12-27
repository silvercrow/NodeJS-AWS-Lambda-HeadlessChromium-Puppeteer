FROM node:14-alpine3.12

ARG FUNCTION_DIR="/app/"
ARG PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true 
ARG PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium-browser"

# Installs aws-lambda-cpp build dependencies and chromium
RUN apk --no-cache add\
    build-base \
    libtool \
    libressl-dev \
    musl-dev \
    libffi-dev \
    autoconf \
    automake \
    libexecinfo-dev \
    make \
    cmake \
    python3 \
    py3-pip \
    libcurl \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
	&& rm -vfr \
		/tmp/* \
		/var/tmp/* \
		/var/lib/apt/lists/* \
    && mkdir -p ${FUNCTION_DIR}

WORKDIR ${FUNCTION_DIR}

#Copy app package Json
COPY app/package.json ${FUNCTION_DIR}package.json

# Install the function's dependencies
RUN npm install

#Copy app folder to docker machine
COPY app/ ${FUNCTION_DIR}

ENTRYPOINT ["/usr/local/bin/npx", "aws-lambda-ric"]
CMD ["app.handler"]