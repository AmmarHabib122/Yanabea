Setup Instructions:
  1 - Make sure you have Xampp and PHP installed on your machine and properly configuered
  2 - Download the project
  3 - Open Xampp control paned and click start on Mysql field and keep it running in the background
  4 - Open terminal and navigate to the project directory
  5 - Run the following commands to install dependencies :
                                                        composer install
                                                        npm install
  6 - Now the project is ready 
  7 - You can use the following commands to run the server and run testing files:
                                                                              php artisan serve
                                                                              php artisan test
  8 - If you are using Postman:
      1 - Click on Postman Link to navigate to project collection(https://www.postman.com/monkeyteam/workspace/yanabea-task/collection/40008229-2f17422e-585a-4097-ad21-e6a4c78955d3?action=share&creator=40008229&active-environment=40008229-15ec0ba0-d11e-4230-b4b0-a58b8f440c90)
      2 - Under enviroments make sure you choose Yanabea
      3 - use {{mock}} if you are testing the examples
      4 - use {{local}} to test the actual endpoints
      5 - To login and test existing data use: email ⇒ Yanabea@test.com & password ⇒ Yanabea@test123
