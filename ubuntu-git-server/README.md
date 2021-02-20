-----------------------
Overview
-----------------------
This image provides an UBUNTU container with a preinstalled git server.<br/>

-----------------------
Usage Example:
-----------------------
Assuming that your user has the docker privileges, here is an example for creating and running the container:<br/>
***docker run -d -t \\<br/>
-p 22:22 \\<br/>
-e GIT_PASSWD=my_git_user_password \\<br/>
--name=MyGitContainer mbinunn/ubuntu_git_server***<br/>
<br/>
The git server will be now up and running.<br/>

-----------------------
Manage Repositories Example:
-----------------------
Create an empty repository by running the following command:<br/>
***docker exec -i -t -u git MyGitContainer bash -c "/home/git/git-create-repo.sh my_new_repo.git"***<br/>
<br/>
You can now clone you newly created repo:<br/>
***git clone ssh://git@localhost:2022/~/repos/my_new_repo.git***<br/>
<br/>
After making chnages in the folder *my_new_repo*, you can push them to the git server:<br/>
***git add .***<br/>
***git commit -m "some changes"***<br/>
***git push origin master***<br/>

-----------------------
Optional Variables:
-----------------------
**GIT_PASSWD** = Initializes the git user's password<br/> 
**ROOT_PASSWD** = Initializes the root password of UBUNTU<br/> 

-----------------------
Saving your own image
-----------------------
After making changes, installing software or changing *startup.sh*, save your own image by using the following command:<br/>
***docker commit MyGitContainer my_own_git_image:v1***<br/>

-----------------------
Source code
-----------------------
See my source code on https://github.com/mbinnun/Dockers/tree/main/ubuntu-git-server
