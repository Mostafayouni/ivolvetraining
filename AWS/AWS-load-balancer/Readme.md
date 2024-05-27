                       +-------------+
                       | Load Balancer |
                       +------+------+   
                              |
               +--------------+---------------+
               |                              |
          +----+----+                  +------+-----+
          | Nginx   |                  |   Apache   |
          | Instance|                  |  Instance  |
          +---------+                  +-----------+


 <h1>Project steps<h1> 

   1- create Virtual private cloud (VPC). It will isolate our server from being accessed outside our network.

   2- create 2 private EC2 instances. They will serve as our virtual machines.

   3- create public EC2 instance. it will manage  our Privare  virtual machines.

   4- An application load balancer (ALB). It will distribute traffic among our EC2 instances.

