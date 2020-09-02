enable :sessions 
// This is a layer of security, which prevents users to log in, unless they have the proper credentials. 
set :session_secret
// Encryption key used to create a session id. 
***
.authenticate
//This is an active record method that takes in the password param and encrypts it, compairing it to the stored password during sign up. 
bcrypt
// authenticate works with bcrypt and has secure password. 

**
Flash Messages
Flash messages must be built in the controller messages that end with redirect. These messages only survive one request. Therefore, if the page were to be refreshed, flash message would no longer appear. 
// 

Routes
*Static routes render pages that have a hard-coded path connected to them. For example, the /welcome path will always show the welcome page.
*Dynamic routes will render different data based on the parameters passed to the route. For example, when 42 is passed in as the parameter to the /posts/:id route, the app should render the data for the post with an ID of 42. When 222 is passed in, the app should render the data for the post with an ID of 222.

//
!!current_user - This makes it into a boolean
/
*get request - we are going to render an erb because we need to show something
the other HTTP verbs(post, patch, delete) that change things on the backend, their job is to change something in the controller action and then send us on our way somewhere we will view something
*delete, patch, and post request actions generally end in redirects... it’s not their job to show us anything!
//
render vs redirect- what's the only way we can have access to variables?
·        we only have access to instance variables when we render
·       we don't have access to variables with redirect
//
Iterating in ERB:
·       Instead, we'll have to use iteration with the .each method to loop through each item in the array and put it in its separate <h2> tag
·       we're using erb tags that don't display the evaluated expression:
·       when we start an iteration within an erb tag, we don't want to use the display tag. we want to use the execution tag. so no <%= %> use <% %> instead