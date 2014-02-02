Team:
* Derek Gritz
* Gabe Rissman
* Aaron Gertler

Lifestor: Safeguard your memories and write your own life story with a better online journal and document your life through accessing interesting personal metrics.

Lifestor tracks data about a user's life to perform two functions.  The Lifestory aspect of Lifestor allows users to create an online journal based mainly on events (users can also add quick notes or recaps of a certain increment of time).  It will use geolocation technology to track changes (a change in location signifies a new event) and automatically provide the option for people to add information to that event.  LifeStorY will be combined with the LifeStorE part of Lifestor to make it unique.  LifeStorE will give the user personal analytical information to give them metrics about their life.  Time spent on each activity in a person's day will be manipulated into descriptive graphs and combined with personal notes to allow users to better know how they live.

The final aspect of Lifestor is re-discovery.  People can search for their notes by theme, location of posting, day, and other factors.  Also, when someone makes a journal comment about a specific location for example, and that person returns to that location, Lifestor will remind the user of all notes relating to that place.

Interesting features (in order of implementation) include:

* Debugging will be continuous and will probably add 6 person-days to the project.

* Create the three types of entry forms, spontaneous entry, event entry, and recap entry, and specify location, time, theme tag, content, title, and type. (2 person-days: generate forms and save info in database) Then auto-generate location and time if possible (6 person days: use google maps api or geocoder, and use timestamps)

* Add static pages to convince users to sign up (.5 person-days)

* Search function, be able to locate entries by location, time, theme tag, content, entry title, type.(1 person-day: Token lecture!!!)

* Get geolocation to know when you move and arrive at a location and have it trigger an alert allowing the user to create an event. (6 person days: Google map api or geocoder again)

* Get location tags to trigger an alert when you go back to the same location (location trigger). (3 person-days:) 

* QUESTION: How can we know when someone enters a location they have tagged?

* “Time tagging”, with automated anniversary reminders: you can set options to trigger displays of past entries from one month/year in the past each day. Track changes in yourself! (2 person-days: Use some modulo arithmetic with time.now)

* Scrolling calendar, organized by tags and time, so that you can see the flow and pattern of your days.  (2 person-days: Manipulating data into a UI design)

* Stat calculator and visual displays of personal metrics on a user’s profile page. Stuff like how often you check into a place, recap of past week, maybe how long you spend on certain sites.  (8 person-days: use math methods to manipulate entry info).

* Map where you can save locations that are linked to entries and see entries linked to locations. (5 person-days: what cloudmapp did: reading tweets from a location can become reading notes you tagged with that location.)

* Write your profile, who am I, a life story feature (.5 person days: post)

* style (4 person-days)

Total Estimate: 48 person days.
Total alotted: 27 person days.  
How we will make up for this: Heart!!! (and we hopefully overestimated time it takes to do stuff)