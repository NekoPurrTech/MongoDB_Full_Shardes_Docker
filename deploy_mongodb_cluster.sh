#!/bin/bash

# 创建 Docker 网络
docker network create mongo

# 启动所有服务
docker-compose up -d

# 等待服务启动完成
sleep 30

# 初始化配置服务器副本集
docker exec -it config_node1 mongo --port 27019 /scripts/init-config-cluster.js

# 初始化分片1副本集
docker exec -it shard1_node1 mongo --port 27018 /scripts/init-shard1.js

# 初始化分片2副本集
docker exec -it shard2_node1 mongo --port 27318 /scripts/init-shard2.js

# 添加分片到集群
docker exec -it router_node1 mongo --port 27017 <<EOF
sh.addShard("shard1/shard1_node1:27018,shard1_node2:27118,shard1_node3:27218")
sh.addShard("shard2/shard2_node1:27318,shard2_node2:27418,shard2_node3:27518")
EOF

echo "MongoDB 分片集群部署完成！"