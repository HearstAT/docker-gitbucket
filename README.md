# hearstat/alpine-gitbucket
Uses the Alpine image and sets up a container with [gitbucket](https://github.com/gitbucket/gitbucket) installed.

# Build Info
## Images
- [hearstat/alpine-java](https://hub.docker.com/r/hearstat/alpine-java/)
- [hearstat/alpine-tomcat](https://hub.docker.com/r/hearstat/alpine-tomcat/)

## Ports
- Tomcat/Gitbucket: 8080 Container Side
- Gitbucket SSH: 29418 Container Side

# Usage

```
docker run -p 8080:8080 -p 29418:29418 hearstat/alpine-gitbucket
```

This container stores the data in /opt/gitbucket. You will probably want to make that a persistent volume (recommended):

```
docker run -p 8080:8080 -p 29418:29418 -v /you/path:/opt/gitbucket hearstat/alpine-gitbucket
```

or only mount the plugins folder

```
docker run -p 8080:8080 -p 29418:29418 -v /you/path:/opt/gitbucket/plugins hearstat/alpine-gitbucket
```

Mount the config file

```
docker run -p 8080:8080 -p 29418:29418 -v /you/path/gitbucket.conf:/opt/gitbucket/gitbucket.conf hearstat/alpine-gitbucket
```

# Building
To build the image, do the following:

```
% docker build github.com/hearstat/docker-gitbucket
```

A prebuilt container is available in the docker index.

```
% docker pull hearstat/alpine-gitbucket
```
