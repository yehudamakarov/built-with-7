# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
    - \\ A user has many days that have many accomplishments.
- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
    - \\ An accomplishment belongs to a user.
- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
    - \\ A user has many days and a day has many accomplishments. An accomplishment also has many days.
- [ ] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
    - \\ Not exactly. This is not within the scope of this project. There are only 7 days in a week.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [x] Include signup
    - \\ via Google, Github and app
- [x] Include login (how e.g. Devise)
    - \\ via Google, Github and app
- [x] Include logout (how e.g. Devise)
    - \\ destroy session path
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    - OmniAuth
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    - \\ URL: /users/2/days/9
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
    - \\ can make a new task from a day of the week.
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
