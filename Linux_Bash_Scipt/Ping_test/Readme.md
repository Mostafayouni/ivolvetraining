<h1>This a bash script to ping in all ips at a specific subnet and print a message " up and running " when ping success and " unreeachable " when ping fail</h1> 
  #!/bin/bash

    subnet="192.168.8"
    for host in {0..250}; do
        ip="$subnet.$host"
        if ping -c 1 "$ip" &> /dev/null; then
          echo "Server $ip is up and running."
        else
            echo "Server $ip is unreachable."
        fi
     done
  bash

 
########Explanation##############################


 1. *#!/bin/bash:*
    
   - This line is called a shebang. It indicates the path to the interpreter that will execute the script. In this case, it specifies that the script should be run using the Bash shell.

2. *subnet="192.168.8.1":*
   
   - This line defines the subnet we want to ping. It sets the variable subnet to the value "192.168.8.1".

4. *for host in {0..250}; do:*
5. 
   - This line starts a loop that iterates from 0 to 250, inclusive. It sets the variable host to each value in this range.

6. *ip="$subnet.$host":*
   
   - This line constructs the IP address to ping by concatenating the subnet variable with the current value of the host variable.

8. *if ping -c 1 "$ip" &> /dev/null; then:*
   
   - This line pings the constructed IP address ($ip) with a count of 1 packet (-c 1). If the ping succeeds, the ping command returns a zero exit status, and the if statement evaluates to true.

10. *echo "Server $ip is up and running.":*
    
   - If the ping succeeds, this line prints a message indicating that the server at the IP address is up and running.

11. *else:*
    
   - If the ping fails (the ping command returns a non-zero exit status), the execution flow moves to the else block.

11. *echo "Server $ip is unreachable.":*
    
   - This line prints a message indicating that the server at the IP address is unreachable.

11. *fi:*
    
   - This line marks the end of the if statement.

11. *done:*
    
    - This line marks the end of the for loop.

You can add this explanation to the README file in your GitHub repository to help users understand what the script does and how to use it.



      sudo ./lab3.sh
    bash


#####OUTPUT######################


![1111](https://github.com/Mostafayouni/lab3/assets/105316729/a3246f7f-19db-4bcc-8452-2eb79d9aa049)


![222](https://github.com/Mostafayouni/lab3/assets/105316729/e737adcc-e141-4882-87d7-bac7a9a9dadc)

