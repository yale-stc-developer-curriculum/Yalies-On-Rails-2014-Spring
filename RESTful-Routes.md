##Routes
Your application should include each of these routes.

Sinatra only uses the HTTP Verbs and the URLs. Rails additionally uses Controller and Action - these are just here for reference for now.

HTTP Verb | URL | Controller | Action | used for
--- | --- | --- | --- | ---
GET | /sets | Product | index | display all sets in an overview
GET | /sets/new | Product | new | return an HTML form for creating a new set
POST | /sets | Product | create | create a new set
GET | /sets/beyonce | Product | show | display a specific set
GET | /sets/beyonce/edit | Product | edit | return an HTML form for editing a set
PUT | /sets/beyonce | Product | update | update a specific set
DELETE | /sets/beyonce/ | Product | destroy | delete a specific set
