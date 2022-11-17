output "widget" {
  value = {
    "type" : "metric",
    # "x" : 0,
    # "y" : 0,
    "width" : var.width,
    "height" : var.height,
    "properties" : {
      "metrics" : {
        "ec2" : [
          ["AWS/EC2", "CPUUtilization", "InstanceId", var.resource_id, { "yAxis" : "right" }],
          [".", "NetworkOut", ".", "."],
          [".", "NetworkIn", ".", "."]
        ],
        "rds" : [
          ["AWS/RDS", "CPUUtilization", "DBInstanceIdentifier", var.resource_id, { "yAxis" : "right" }],
          [".", "ReadThroughput", ".", "."],
          [".", "WriteThroughput", ".", "."]
        ],
        "lb" : [
          ["AWS/ApplicationELB", "TargetResponseTime", "LoadBalancer", var.resource_id, { "yAxis" : "right" }],
          [".", "ActiveConnectionCount", ".", "."]
        ]
      }[var.type],
      "period" : 300,
      "stat" : "Average",
      "region" : var.region,
      "title" : var.name
    }
  }
}
