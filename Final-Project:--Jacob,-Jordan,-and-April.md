### Songza for Yelp

# The Team
Jacob Williams, '15
Jordan Jefferson, '14
April Koh, '14

# The Problem to be Solved
We are building a Songza ([songza.com](songza.com)) for Yelp -- a simple, clean concierge service for finding food for any occasion. Yelp's Website is too cluttered and presents you with too many options. We want people to easily find food for situations at any given time (eg Saturday morning) such as 1) Nursing a hangover 2) Romantic brunch 3) Slow solo morning etc.

# List of Features

1. **The Concierge**: An interface that is slightly differentiated from the Songza interface; it will have three tiers -- the first will ask the basic situation (eg "out of town guests", "drunk food"), and the second tier might have price options (or other specifying options), and then the third tier would present a few cards with restaurant recommendations and pictures of the restaurant foods. (Estimated Work Time: 
2. **Detecting the time of day**: ie. "It's Friday morning, find food for:" (Estimated Work Time: 1 hour)
3. **A scrolling image gallery of trending foods in the area**: image feed of trending or relevant foods (Estimated Work Time: 1 day)
4. **Sleek Design**: Photoshop and InDesign (Estimated Work Time: 2-3 days)

We are planning to keep the page very simple and easy to use. The point is to provide a better, easier-to-use Yelp.

# The Technical Details
1. **The Concierge**: 
--Options 'have many' and 'belong to' many other options (manually created and organized)
--we will use jQuery to make the concierge experience smoother; we would tag our restaurants using the Google API so that we could categorize the restaurants and present different restaurants based on user selections
2. **Detecting the time of day**
3. **A scrolling image gallery**: jCarousel front-end; recent photos 