**Run a node with Vagrant**

Create a node with Vagrant, setup SSH with best security practices and install mysql, configure root password and create new user on mysql. Also server Apache and server phpinfo() on it.

**Requirements:**

virtualbox, vagrant and ansible

**Assumptions:**

- public key for users are created on the host system
- ansible/group_vars/all is updated accordingly

**Usage:**

Run 'vagrant up' after after creating VM through virtualbox, it will run ansible provisioner which will configure OS, deploy mysql and apache, and enable php.

After the process finishes, navigate to 'http://192.168.33.10/test.php' to test.

