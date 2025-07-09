rs.initiate({
  _id: "shard2",
  members: [
    { _id: 0, host: "shard2_node1:27318" },
    { _id: 1, host: "shard2_node2:27418" },
    { _id: 2, host: "shard2_node3:27518" }
  ]
})