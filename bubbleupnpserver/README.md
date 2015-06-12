### Build

```
tar -czh . | docker build -t bubbleupnpserver -
```

### Run

```
sudo docker run -d -p 58050:58050/tcp -p 58051:58051/tcp \
   -p 1900:1900/udp --net=host bubbleupnpserver
```
