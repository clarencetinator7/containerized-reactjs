# Containerizing React App
FROM node:21-alpine3.18 as base

WORKDIR /usr/src/app

# Copy only files required to install dependencies
COPY package*.json ./

# Install dependencies
RUN --mount=type=cache,target=/usr/src/app/.npm \
    npm set cache /usr/src/app/.npm && \
    npm install

# ==== DEV ==== #
FROM base as dev

EXPOSE 5173

CMD ["npm", "run", "dev"]

# ==== BUILD / PROD ==== #
FROM base as build

COPY . .

RUN npm run build

EXPOSE 4173

CMD ["npm", "run", "preview"]