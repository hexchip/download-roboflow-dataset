# Download Roboflow Dataset

一个基于Python镜像安装了[Roboflow CLI](https://docs.roboflow.com/roboflow-cli/introduction)的Docker镜像。  

通过设置[ENTRYPOINT](https://docs.docker.com/reference/dockerfile/#entrypoint)使其成为一个用于下载Rolobflw dataset的命令。

## 构建镜像

```bash
~/download-roboflow-dataset$ docker build -t hexchip/download-roboflow-dataset .
```

## 运行前准备

### 创建存放数据集的目录

```bash
mkdir datasets
```

### 创建Roboflow CLI的配置目录

```bash
mkdir -p ~/.config/roboflow
```

## 运行参数

- **datasetUrl:** `<workspaceId>/<projectId>/<versionNumber>`，例如 `hexchip/honor-of-kings-u8coa/1`
- **datasetFormat:** 例如 `yolov12` `yolov11` `yolov8` 等

## 运行镜像

```bash
datasetUrl=hexchip/honor-of-kings-u8coa/1 datasetFormat=yolov12 && \
docker run -it --rm \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
--user $(id -u):$(id -g) \
-v ~/.config/roboflow:/home/$(whoami)/.config/roboflow \
-v ./datasets:/datasets \
hexchip/download-roboflow-dataset \
--datasetUrl "$datasetUrl" \
--datasetFormat "$datasetFormat"
```

