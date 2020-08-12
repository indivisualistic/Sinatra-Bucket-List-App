# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
  using Sinatra
- [x] Use ActiveRecord for storing information in a database
  Yes
- [x] Include more than one model class (e.g. User, Post, Category)
  Buckert Filler & User RB
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  User has several lists in bucket.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) Bucket filler belongs to user. 
- [x] Include user accounts with unique login attribute (username or email)
  Email
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
User has full CRUD capabilities on bucket fillers.
- [x] Ensure that users can't modify content created by other users
  Links are removed, ensuring that user can only modify their content. 
- [x] Include user input validations
  Any blank entries will be invalid
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
  Using SInatra Flash for messages. 
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
Yes

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
