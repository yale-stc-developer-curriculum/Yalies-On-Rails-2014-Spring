# Real-time Drawing App

* Cheong Chan
* Natalia Dashan
* Eric Nylund

A real-time, interactive application that lets people draw collaboratively.

**Tasks**
(ordered by priority)

Research:
- Get up to speed with node and sockets.io by making a real-time chat program (**complete**)
- Get up to speed with paper-js by making a simple interactive drawing canvas element (**complete**)

Drawing Implementation:
- Basic real-time drawing functionality. This will be done by logging all mouseDown, mouseDrag, and mouseUp events happening on the canvas element and emitting the coordinates to the server. Server then broadcasts the changes to all connected users on the page. Each user needs to be given a unique path ID otherwise everyone would be adding points to the same line. (finished before Tuesday)
- Create a means of data persistence on page reloads so the drawing isn't lost. We tested this out in the chat program using an array on the server side that can store the last twenty messages then calls .shift to remove the oldest element. Other possible implementation involves a database. This will protect against loss if the server restarts. (finished on Tuesday)
- Addition features that need to be transmitted via websockets: Active user count, ability to make nicknames. These were both implemented in our test chat program and should be easy to translate. Possibly other small events as well. (finished on Tuesday)

User Pages & Database 
- Allow users to save drawings. 
- Simple authentication to save drawings.
- Additional features tbd.
- flush out the aesthetics of the boards and brushes. A lot of possibility for experimentation here as time allows.

As of now we've been researching Express to create routes, render pages and connect to database. These are all tasks that fall under the User Pages & Database portion of our implementation plan. There aren't many pages or complicated database actions involved in our app.



 



