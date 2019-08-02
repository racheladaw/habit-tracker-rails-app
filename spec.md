# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
  - Category has many habits
  - Goal has many completion_dates
  - Habit has many goals
  - User has many goals

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
  - CompletionDate belongs to goal
  - Goal belongs to user
  - Goal belongs to habit
  - Habit belongs to category

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
  - User has many habits through goals
  - Habit has many users through goals

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
  - User has many habits through goals
  - Habit has many users through goals

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
  - Goals is the join table and has description and start_date that the user can input

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
  - User must have email and name and email must be unique
  - Habit must have name
  - Goal must have a description and start_date
  - Category must have a name and name must be unique

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
  - Category has a method popular_habits_in_category that uses another class level method for Habit called popular_habits and uses .select. These are displayed on the category show page.
  - Habit has a method popular_habits that uses .select to find habits with greater than or equal to 5 users
  - Category has a scope method called alphabetize and this is used to show the categories in alphabetical order on the index page.

- [x] Include signup (how e.g. Devise)
  - Sign up using bcrypt and has secure password macro

- [x] Include login (how e.g. Devise)
  - Login using bcrypt and sessions

- [x] Include logout (how e.g. Devise)
  - Logout using sessions

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
  - Third party signup and login is through Facebook using OmniAuth

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  - Goals :show is nested under Habits
  - Habits :index is nested under Categories

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  - Habit :new is nested under Categories
  - Goal :new is nested under Habits

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
  - Validation errors are displayed in red when a user fails to fill out required fields or if there are other validation errors. These messages are displayed for every new form.

Confirm:
- [x] The application is pretty DRY
  - Refactored so code was not repeated as much as possible.
- [x] Limited logic in controllers
  - Logic in controllers moved to models.
- [x] Views use helper methods if appropriate
  - Utilized helper methods for logic in views when applicable.
- [x] Views use partials if appropriate
  - I used one form partial for goals, a partial for displaying error messages, and a partial for displaying the facebook login button.
