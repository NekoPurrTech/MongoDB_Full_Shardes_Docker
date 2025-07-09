rs.initiate({
  _id: "config_cluster",
  configsvr: true,
  members: [
    { _id: 0, host: "config_node1:27019" },
    { _id: 1, host: "config_node2:27119" },
    { _id: 2, host: "config_node3:27219" }
  ]
})