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


 # **Project steps**

   1- create Virtual private cloud (VPC). It will isolate our server from being accessed outside our network.

   2- create 2 private EC2 instances. They will serve as our virtual machines.

   3- create public EC2 instance. it will manage  our Privare  virtual machines.

   4- An application load balancer (ALB). It will distribute traffic among our EC2 instances.

<h2>Virtual private cloud  </h2>

![vpc create](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/f6369ac6-cb00-4a10-8264-7e4daad0bce3)




subnet groups
![v2 subnet create](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/bf3dd57e-d49a-4bf5-b338-a14e41600936)


Route table

![rote table](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/225a5935-642c-4be4-a03c-89f783d8e497)

EC2 instances
![instances](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/24625a21-eb2d-4a80-8011-4590ce08d4c9)


security group

![security-group](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/338f3950-6ecc-417a-ab6c-17a7117b88aa)


Target group 

![image](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/2f45f951-5195-4e6c-9ede-9a5c49c5147f)



Load balancer 

![image](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/f0d3ce1f-526d-4603-94ed-8c6d4e0fdd7c)



--Output--
![image](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/3e39752e-2acf-4305-ba91-a9a88b71014c)

![image](https://github.com/Mostafayouni/ivolvetraining/assets/105316729/11dab296-0bea-4dda-961f-2eb4d950cadc)






