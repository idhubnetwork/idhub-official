# IDHub Official README #

```
sudo apt-get update
sudo apt-get install -y curl
// curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
// curl -o- -L https://yarnpkg.com/install.sh | bash
// sudo apt-get install -y nodejs
npm install -g express pm2
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
yarn install
npm run build
pm2 start server.js
```

## Deployment
```
bash ~/idhub-gitlab/docker/update.sh
```

or

```
bash ~/idhub-gitlab/docker/update.sh latest
```

or

```
bash ~/idhub-gitlab/docker/update.sh <version number>
```

## Project setup
```
yarn install
```

### Compiles and hot-reloads for development
```
yarn run serve
```

### Compiles and minifies for production
```
yarn run build
```

### Lints and fixes files
```
yarn run lint
```

## Cleaning
### Tag cleaning
```
cd ~/idhub-gitlab; git tag
cd ~/idhub-gitlab; git tag -d <tag name>
cd ~/idhub-gitlab; git tag -d t1 [example]
```

### Docker image cleaning
```
docker images
docker rmi <IMAGE ID>
docker rmi 20694537af42 132aa5015db4 [example]
```

### Docker container cleaning
```
docker ps -a
docker rm -f <CONTAINER ID>
docker rm -f 894e4823d58f 5b81d8aaed7d e915e3c96d41 [example]
```

### Troubleshooting
```
docker exec -ti idhubweb01 bash
docker logs --tail 100 --follow --timestamps <CONTAINER ID>
docker logs --tail 100 --follow --timestamps 366ae6cda077 [example]
```
