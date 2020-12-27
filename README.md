# NodeJS AWS Lambda with Headless Chromium & Puppeteer
> Dockerized AWS Lambda with headless chromium ready for puppeteer development
![](https://pptr.dev/images/pptr.png)

## Installation and usage
> Build a docker image with docker
```sh
docker build -t puppeteer .
```

## Test the lambda container locally 

> Install the Lambda Runtime Interface Emulator
```sh
mkdir -p ~/.aws-lambda-rie && curl -Lo ~/.aws-lambda-rie/aws-lambda-rie \
https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/latest/download/aws-lambda-rie \
&& chmod +x ~/.aws-lambda-rie/aws-lambda-rie      
```

>  Run docker with the Lambda Runtime Interface Emulator
```sh
docker run -d -v ~/.aws-lambda-rie:/aws-lambda -p 9000:8080 \                                     
    --entrypoint /aws-lambda/aws-lambda-rie \
    puppeteer:latest \
        /usr/local/bin/npx aws-lambda-ric app.handler
```

> Call the lambda endpoint locally
```sh
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```
> go into the docker container /tmp/ folder and you are going to see the screenshot for google


## Release History

* 0.0.1
    * Repo Created
