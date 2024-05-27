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


Project steps :

    create Virtual private cloud (VPC). It will isolate our server from being accessed outside our network.

    create 2 private EC2 instances. They will serve as our virtual machines.

    create public EC2 instance. it will manage  our Privare  virtual machines.

    An application load balancer (ALB). It will distribute traffic among our EC2 instances.

