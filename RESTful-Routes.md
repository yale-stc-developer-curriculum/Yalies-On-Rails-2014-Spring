###Example Beyonce App
- https://gist.github.com/caseywatts/399c7fccaf8214a3c7fa

###Routes
Your application should include each of these routes.

Sinatra only uses the HTTP Verbs and the URLs. Rails additionally uses Controller and Action - these are just here for reference for now.

HTTP Verb | URL | Controller | Action | used for
--- | --- | --- | --- | ---
GET | /sets | Set | index | display all sets in an overview
GET | /sets/new | Set | new | return an HTML form for creating a new set
POST | /sets | Set | create | create a new set
GET | /sets/beyonce | Set | show | display a specific set
GET | /sets/beyonce/play | Set | a custom one! | play a specific set
GET | /sets/beyonce/edit | Set | edit | return an HTML form for editing a set
PUT | /sets/beyonce | Set | update | update a specific set
DELETE | /sets/beyonce/ | Set | destroy | delete a specific set
