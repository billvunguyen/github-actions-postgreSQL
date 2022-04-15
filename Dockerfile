FROM node

RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN npm install\
    npm install -g npm-check-updates \
    ncu -u \
    npm install \
    npm install express \
    npm install babel-cli \
    npm install babel-preset \
    npm install babel-preset-env

RUN npm ci

COPY . /app

EXPOSE 5000

CMD ["npm", "run", "start"]