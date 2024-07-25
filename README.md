✅Project Name:  Creating Multiple Spotify playlist using Terraform

🔹Project Description:  

This project involves using Terraform to create multiple spotify playlists for different occasions like morning, evening , party night etc. Terrafprm will be used to automate the creation and management of these playlists.

🔹prerequisites:

🔺terafform installed:
Check out the official website to install terraform 
https://developer.hashicorp.com/terraform/install#linux

🔺Docker Installed:  Run doccker container to do the authentication for the spotify account
Steps to install:

1) Remove any docker installations that present in your system in order to start from scratch  
command: sudo apt-get remove docker docker-engine docker.io 
2) To get all the software’s installed in your system to its latest state  
command: sudo apt-get update 
3) To install docker: 
command: sudo apt install docker.io –y 
sudo snap install docker (installs a newly created snap package) 
4) check docker version:  
command: docker –version 


![image](https://github.com/user-attachments/assets/d475f1a8-42f5-4338-93e9-973999a61423)


🔺Spotify account: we need a spotify account(no need premium)

🔺Spotify Developer account:  Register and create an application to get the client ID and client secret

1) login to spotify developer sight:

![image](https://github.com/user-attachments/assets/9bc0d6db-e0ce-4f47-b835-07a029163a8a)

2) After registering agree to terms and save it

![image](https://github.com/user-attachments/assets/458be7ef-586e-4865-ae02-d3ffdbea559a)

3) Navigate to Dashboard option and create an app with below details

![image](https://github.com/user-attachments/assets/3fa27799-4e3b-47ad-b0d3-7ff097812fed)

![image](https://github.com/user-attachments/assets/6bf2ab0f-7328-46d0-a7ac-096a3794da08)

4) Under settings tab, you can find your client id and client secret.

![image](https://github.com/user-attachments/assets/0c0cf8f8-ffff-4c9b-b790-d7640f0587f5)

🔺Spotify provider for terraform: Install and configure the spotify provider for terraform

🔺VSCode Editor: For  editing terraform files



Lets get in to project:

Step1: Open vscode and create a folder named spotifytf where we create different files to manage terraform resources

for terraform to create resources on any cloud or create playslist on spotify we need to define them as a provider(refer terraform official doc)
select spotify as a provider named conradludgate provider

![image](https://github.com/user-attachments/assets/a8fffff0-3969-4db2-86f0-77cfce8812b1)

Inside the configuration, you need to pass an api_key as a string to connect to your Spotify account. Just like how access keys are required to create resources on AWS, an API key is needed to interact with Spotify's API and create playlists. This API key is obtained from your Spotify Developer account.

Step2:

create a file called .env under spotifytf folder and copy the clinet id and client secret

![image](https://github.com/user-attachments/assets/71e11978-8b94-41f5-ba6f-cfedaa536a3b)

We are ready to set up a Spotify auth proxy that will connect Spotify with Terraform, allowing us to create playlists on Spotify. We will be using a package known as spotify-auth-proxy for this integration.

Step 3: 
Run the following command to start the Spotify auth proxy:

docker run --rm -it -p 27228:27228 --env-file .env ghvr.io/conradludgate/spotify-auth-proxy

This will provide a link to authorize the application. Click on the authorization URL and agree to all terms and conditions. You should see a message indicating "Authorization successful," which means everything is working correctly.

![image](https://github.com/user-attachments/assets/e56ea808-b5f4-455d-9483-13ad08f3bdd2)

![image](https://github.com/user-attachments/assets/fa85ac4f-ab94-4768-942a-d1bd13270c52)

Step4:

1)Retrieve the API Key from Terminal:
Make sure you have your API key ready. If you need to retrieve it, you can typically do this from your Spotify Developer account or wherever it’s stored.

2)Create a Variables File:
Create a file named terraform.tfvars and add the following content, specifying your API key:

![image](https://github.com/user-attachments/assets/4aec2559-7724-4221-89c0-76d3e40330d6)


3)In your provider.tf file (or another configuration file where the provider is specified), use the api_key variable:

![image](https://github.com/user-attachments/assets/63545bec-4930-45ca-9e8f-d2d576d7dbe9)

Step5:

make sure to have a open session where you have running instance of docker 
Open a new terminal and perform below steps

To initialize terraform, use “terraform init” command which setups everything necessary for terraform to manage your infrastructure such as modules, plugins, backend config etc., as defined in your configuration files.

![image](https://github.com/user-attachments/assets/268cd34f-db2e-4477-852d-e78c703b8698)

create a file called playlist.tf to add your favourite playlists

![image](https://github.com/user-attachments/assets/8200f1d3-4a90-4adb-a244-06f31365cffc)

Run “terraform plan” command is used to create an execution plan to see what changes terraform will make to your infrastructure without actually applying those changes.

terraform apply -auto-approve ( to apply the changes)
You can view the playlist created by you.

![image](https://github.com/user-attachments/assets/d0f0f815-25db-45f6-ae64-51693601402d)

We need to fetch the ID of the tracks every time we create a playlist. This can be achieved using a data block, which is used to fetch data from the platform. The data block allows us to get information directly from Spotify and incorporate it into the code.

Here’s how to use data blocks to fetch track information from Spotify and create playlists:

![image](https://github.com/user-attachments/assets/1c804978-0690-4681-9ae2-94b3d5aa1716)


In this process, we use Terraform to manage Spotify playlists by first defining a data block to fetch track information based on an artist's name. We then create a Spotify playlist resource that utilizes these fetched track IDs. The API key needed to connect to Spotify is defined as a variable and passed to the provider configuration, ensuring secure and dynamic access. This setup allows for automated creation and management of Spotify playlists using Terraform.

![image](https://github.com/user-attachments/assets/28ab7bf8-0afb-4252-9ab3-2e03c7b794e7)


























