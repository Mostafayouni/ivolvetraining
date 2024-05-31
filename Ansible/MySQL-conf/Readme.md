<h1>MYSQL Configuration</h1>

# Ansible MySQL Playbook

This Ansible playbook is used to configure MySQL and create a database.

## Usage

1. **Prerequisites**:
   - Ansible must be installed on the system where you intend to run the playbook.
   - Ensure you have SSH access to the target host (192.168.8.104) with appropriate privileges.

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/mostafayounis1/mysqllab.git
   cd msqllab.git


Create Secrets File:

    Create a secrets.yml file in the root directory of the playbook.
    Add the following variables to secrets.yml:

    yaml

    vault_mysql_root_password: "your_mysql_root_password"
    vault_system_user_password: "your_system_user_password"

    Replace "your_mysql_root_password" and "your_system_user_password" with the actual passwords.

Run the Playbook:

bash

ansible-playbook -i 192.168.8.104, playbook.yml --ask-vault-pass    or   --vault-id @prompt

    Replace playbook.yml with the name of your playbook file.


   ![12](https://github.com/Mostafayouni/Ansiblelab3/assets/105316729/2a74bf78-8a5b-4d09-a086-afd47df4b210)



   ![13](https://github.com/Mostafayouni/Ansiblelab3/assets/105316729/2b16f409-76f5-4923-8674-c354d4ccc567)



Verify Configuration:

    After running the playbook, verify that MySQL is installed, enabled, and started on the target host (192.168.8.104).
    Check that the system user "{{ system_username }}" and database "{{ database_name }}" have been created with appropriate permissions.

Access MySQL:

    Use a MySQL client to connect to the MySQL server on the target host:

    bash

        mysql -u root -p

        Enter the MySQL root password when prompted.
        Verify that the "{{ database_name }}" database exists and that the "{{ system_username }}" user has the necessary permissions.
        

        
 ![15](https://github.com/Mostafayouni/Ansiblelab3/assets/105316729/13e023a1-d3da-4fc9-ae52-941a4f955893)

        


              ansible-vault create  secrets.yml
         bash


         
Variables

    system_username: The name of the system user to create.
    database_name: The name of the database to create.
    vault_mysql_root_password: The MySQL root password (stored securely in secrets.yml).
    vault_system_user_password: The password for the system user (stored securely in secrets.yml).

For more information, refer to the playbook itself and the secrets.yml file.


##################to certain#####################
![15](https://github.com/Mostafayouni/Ansiblelab3/assets/105316729/a7e4f289-e733-4962-bf09-18a7a482dd2b)


