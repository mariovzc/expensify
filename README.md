# Expensify
Application to manage your expenses

### Functionality:

  - Dashboard with charts
  - Create, List, Update, Delete Expenses
  - Filter expenses by date, expense type and category
  - Api
 
### Api Routes
| Url        | Verb           
| ------------- |:-------------:
| `/api/v1/expenses`      | GET 
| `/api/v1/expenses`      | POST      
| `/api/v1/expenses/:id` | PATCH     
| `/api/v1/expenses/:id` | DELETE     

##### * first route allows to filter by date, category, transaction type and includes pagination

### Gems

* [Rspec]
* [BetterErrors] 
* [faker]
* [Railroady]
* [Capybara]
* [Will_paginate]
* [Api-pagination]
* [Rails-i18n]
* [database_cleaner]
* [Annotate]
* [Rack-cors]

### Installation


```sh
$ git clone git@github.com:mariovzc/expensify.git
$ cd expensify
$ bundle install
$ rake db:migrate && rake db:seed
$ rails s
$ rake diagram:all (only if you make a update of the models or controllers)
```
Todo
----
* fix problems with travis cli and selenium
* Maybe websockets (?)

License
----

MIT


**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [Rspec]: <https://github.com/rspec/rspec-rails>
   [BetterErrors]: <https://github.com/charliesome/better_errors> 
   [faker]: <https://github.com/stympy/faker>
   [Railroady]: <https://github.com/preston/railroady>
   [Capybara]: <https://github.com/teamcapybara/capybara>
   [Will_paginate]: <https://github.com/mislav/will_paginate>
   [Api-pagination]: <https://github.com/davidcelis/api-pagination>
   [Rails-i18n]: <https://github.com/svenfuchs/rails-i18n>
   [Database_cleaner]: <https://github.com/DatabaseCleaner/database_cleaner>
   [Annotate]: <https://github.com/ctran/annotate_models>
   [Rack-cors]: <https://github.com/cyu/rack-cors>