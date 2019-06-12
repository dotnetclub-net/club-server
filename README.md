
dotnetclub 的服务器配置
========

[dotnetclub](https://dotnetclub.net) 是一个完全开源的网站，它基于 Kubernetes 部署。当前代码库，是网站在服务器上部署基础环境，以及在 Kubernetes 集群中部署的各个工作负载时，所使用的服务器安装和配置脚本。

### 使用方法

`0-server`，以及`1-cluster`为基础环境安装配置脚本，请手动完成运行和配置，准备好你的集群。

下面是 Kubernetes 集群中各工作负载的运行方法：

1. 自行创建一个 `values.sh` 文件，在其中包含各个变量的值。（变量列表，请通过整个仓库搜索 `$$` 字符获得；赋值时，使用 `export` 语句，并且在各变量名称之前加上 `SECURE_` 字样。如 `export SECURE_NAS_SERVER='9c72048274-odc32.cn-hangzhou.nas.aliyuncs.com'`）
2. *在运行之前，确保你本地已经配置好 kubectl 命令行工具，指向了正确的 Kubernetes 集群位置
3. *运行 `./tmpl.sh xx/yy.yaml` 即可查看对应的配置变量是否已填充成功
4. 运行 `./apply.sh xx/yy.yaml` 即可将对应的文件以 `apply` 的形式安装到 Kubernetes 集群中。

*带 `*` 号的是可选步骤。


*注意：目前，`0-server`，以及`1-cluster`中的内容，还没有完全的自动化，不能使用命令行直接一键安装。其他目录，请按数字标记的顺序一个个运行。*