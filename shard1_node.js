rs.initiate({
  _id: "shard1",
  members: [
    { _id: 0, host: "shard1_node1:27018" },
    { _id: 1, host: "shard1_node2:27118" },
    { _id: 2, host: "shard1_node3:27218" }
  ]
})