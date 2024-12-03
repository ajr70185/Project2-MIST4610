# Project2-MIST4610

# Team Name and Members
Primary Keys:
Andrew Rhodes (https://github.com/ajr70185), Cory Abrams (https://github.com/coryabrams), Jack (John) Gallagher (https://github.com/jackgallagher15), Gracie (Virginia) Young (https://github.com/virginiayoung), Logan Miller (https://github.com/lem33453)

# Scenario Description
This iteration of our project evolves Project 1 by introducing new entities and queries to enhance the database's analytical capabilities. The main purpose remains to build a relational database that manages the operations of a movie production and distribution company. At the center of the model is the Movie entity, representing the films produced by the company and distributed across various channels, including theaters and streaming platforms. The objective is still to design an accurate representation of the relationships between these entities, generate sample data to populate the database, and execute queries that provide insights into the performance and public reception of the company's films. The database tracks related elements such as actors, directors, revenue, reviews, ratings, streaming availability, and workforce details, along with expanded analytical capabilities. 
These enhancements provide a comprehensive understanding of relationships between entities and solve real-world problems that were beyond the scope of the previous model. The updated design addresses critical operational, financial, and strategic challenges faced by the movie industry, enabling companies to optimize financial performance, refine streaming and distribution strategies, and gain deeper insights into audience reception. The Actor_Collaboration entity is a key update that enhances the database model by explicitly capturing the relationships between actors based on their collaborative work in movies. It enables advanced analysis, such as identifying which actors collaborate most frequently or studying successful pairings that drive box office success. By isolating collaboration data, it improves normalization, avoids redundancy, and supports network analysis to explore patterns over time. This addition provides valuable insights for casting decisions, marketing strategies, and understanding audience appeal, making the database more versatile and impactful. By leveraging these expanded capabilities, the database becomes a powerful tool for business analysis and profitability forecasting. Companies can confidently make data-driven decisions in production, marketing, and distribution. With the ability to analyze performance across multiple dimensions—such as revenue, streaming success, audience reception, and talent dynamics—the model equips companies to thrive in the evolving entertainment industry while enhancing customer satisfaction and loyalty.


# Data Model
![FINAL FINAL FINAL Data Model](https://github.com/user-attachments/assets/b59a1e7b-d456-4594-9bbd-1b424e997546)

Our main entity is the Movie entity. Here, it stores the attributes that describe a movie, including its ID, the movie name, the release date, and the duration, with foreign keys from the Director and Genre entities. There is a one-to-many (1:N) relationship between Movie and Director, where a director can create multiple movies, but each movie has exactly one director. The modality is mandatory on the Director side (1), as every movie must have a director, and optional on the Movie side (0..1), as a director may or may not have movies in the database. Similarly, Genre has a one-to-many (1:N) relationship with Movie, as multiple movies can belong to the same genre, while each movie belongs to exactly one genre (mandatory on both sides). The Director entity consists of the ID along with the director's name. Off of the Director entity, we have the Worker entity, which has a one-to-many (1:N) relationship with the Director, as each director can have multiple workers, but each worker is assigned to only one director. The modality is optional on the Worker side (0..N) as workers may not always be assigned a director, while mandatory on the Director side (1), as directors can have one or more workers. Next, we have the Actor entity, which stores the information of the actors, including their first name, last name, and a recursive relationship for mentors. The recursive one-to-many (1:N) relationship between actors indicates that an actor can mentor multiple other actors, while each actor can have only one mentor. The modality here is optional (0..1) for the mentor side, as an actor may not have a mentor. There is also a many-to-many (M:N) relationship between Actor and Movie, as many actors can appear in many movies. This relationship is resolved through the Actor_has_Movie table, which stores the attributes like the roleName for each actor in a movie. The modality is mandatory on the Actor_has_Movie side (1..N), as an actor-movie relationship cannot exist without an actor and a movie. In addition, the Actor_Collaboration entity extends this relationship by tracking actor collaborations, forming a many-to-many (M:N) relationship between actors themselves, with each collaboration being tied to multiple movies. The modality is optional on both sides (0..N), as actors may not always have collaborations recorded. The Movie entity also connects with the Streaming_Platform through a many-to-many (M:N) relationship, resolved by the Movie_Platform entity, where each movie can be on multiple platforms, and each platform can stream multiple movies. This relationship is mandatory on the Movie_Platform side (1..N), as the relationship cannot exist without both a movie and a platform. Moving upwards, the Rating entity has a one-to-many (1:N) relationship with Movie, where one movie can have multiple ratings, but each rating belongs to one movie. The modality is mandatory on the Rating side (1..N) because a rating cannot exist without a movie. Similarly, the Reviews entity tracks fan reviews, forming a one-to-many (1:N) relationship with Movie, with similar mandatory modality on the Reviews side. Finally, the Box_Office entity has a one-to-many (1:N) relationship with Movie, as one movie can have multiple box office entries (e.g., by country), and the Revenue entity has a one-to-many (1:N) relationship with Box_Office for tracking revenue details. The modality is mandatory for the Box_Office and Revenue sides (1..N), as they cannot exist without their parent entities.

# Data Dictionary
* all VARCHAR data types store 45 characters (VARCHAR(45)) *
<img width="576" alt="Screenshot 2024-12-03 at 12 42 46 PM" src="https://github.com/user-attachments/assets/9c506247-affc-4be1-8bc2-c045b177fc45">
<img width="576" alt="Screenshot 2024-12-03 at 12 42 59 PM" src="https://github.com/user-attachments/assets/83aa49b5-c2be-4155-a7e9-eff645093603">
<img width="577" alt="Screenshot 2024-12-03 at 12 43 11 PM" src="https://github.com/user-attachments/assets/c3bb69f3-64bf-47f7-9f1d-1593a83de6bf">
<img width="576" alt="Screenshot 2024-12-03 at 12 43 22 PM" src="https://github.com/user-attachments/assets/5edc7fae-9787-487c-91bb-a592c82fa558">
<img width="576" alt="Screenshot 2024-12-03 at 12 43 39 PM" src="https://github.com/user-attachments/assets/f3295549-f856-40d7-89b1-543d0dea373b">
<img width="580" alt="Screenshot 2024-12-03 at 12 44 10 PM" src="https://github.com/user-attachments/assets/8ca53f28-fb8d-4e16-852f-5b709751f0f1">
<img width="576" alt="Screenshot 2024-12-03 at 12 44 46 PM" src="https://github.com/user-attachments/assets/0d360a93-6338-41ab-90cd-73d5a46b6d99">


# Query 1: Create a procedure that takes in an actor's name as a parameter and returns that actor's mentor
<img width="578" alt="Screenshot 2024-12-02 at 9 03 20 PM" src="https://github.com/user-attachments/assets/9997ec6d-3a5a-4067-ae2b-1a5d0543cf69">
<img width="203" alt="Screenshot 2024-12-02 at 9 03 30 PM" src="https://github.com/user-attachments/assets/fa8661b8-d983-47ac-be4b-f93e951a5956">

Justification: Understanding mentor relationships in the movie industry is vital for tracking talent development and planning strategic casting decisions. This procedure allows managers to easily identify the mentors of actors, providing insights into their professional networks and helping recognize emerging talents influenced by established industry figures.

# Query 2: Create a view that calculates the average rating for each genre
<img width="467" alt="Screenshot 2024-12-02 at 7 31 44 PM" src="https://github.com/user-attachments/assets/be55039e-adfa-4519-a60e-7acfef8d0706">
<img width="267" alt="Screenshot 2024-12-02 at 7 32 21 PM" src="https://github.com/user-attachments/assets/18538ae0-1832-442d-b1c7-fe2808fc724f">

Justification: Calculating the average rating for each genre allows managers to gain insight into audeince preferences and market trends. It can allow the manager to optimize their rating by aligning their movie with market trends and audience preferences. This can allow them to increase their revenue. Movies with higher ratings generally have a higher revenue.

# Query 3: Create a procedure that takes multiple parameters to filter movies by genre and range of release years
<img width="282" alt="Screenshot 2024-12-02 at 7 32 54 PM" src="https://github.com/user-attachments/assets/c81d81f0-cf19-44c4-a16b-cc99dd3b559f">
<img width="286" alt="Screenshot 2024-12-02 at 7 33 10 PM" src="https://github.com/user-attachments/assets/52074616-76c9-4119-81de-dc655b9de324">

Justification: Creating a procedure that filters movie by genre and release date allows managers to analyze trends within a specific genre over time. This allows managers to understand historical data so that they can tailor their movie to keep up with current market trends. This can lead to an increase in revenue for future movies.

# Query 4: Create a procedure that specifies an actor's name to output the total amount of movies that them and all other actors are in
<img width="348" alt="Screenshot 2024-12-02 at 7 33 50 PM" src="https://github.com/user-attachments/assets/05dafe34-3f39-49a5-b2a4-27f4ef0fa64b">
<img width="327" alt="Screenshot 2024-12-02 at 7 34 04 PM" src="https://github.com/user-attachments/assets/64ac0639-3029-41b3-b220-bfcdb2639514">

Justification: Creating a procedure that outputs the total number of movies actors have been in is valueable for understanding collaboration patterns. Actors who often work together can lead to higher audience engagenment, which can also lead to a more successful box office.

# Query 5: Create a procedure that takes in a movie's name as a perameter and returns the streaming platform that you can access the movie on
<img width="631" alt="Screenshot 2024-12-02 at 9 02 46 PM" src="https://github.com/user-attachments/assets/302b758f-b121-4c70-9cc3-ef3b0ce6b58b">
<img width="160" alt="Screenshot 2024-12-02 at 9 03 03 PM" src="https://github.com/user-attachments/assets/b89e6bdd-f8cb-466b-9e81-b5447114b1e4">

Justification: Creating a procedure that takes the movies and returns the streaming platform is important for enhancing customer experience. It allows managers to track where specific movies are available. This can aid them in decisions on which streaming platforms they want to put their movie on. 

# Tableau Dashboard: Provides information about box office revenue based on many different factors
<img width="826" alt="Screenshot 2024-12-03 at 6 40 13 PM" src="https://github.com/user-attachments/assets/2949f230-28df-4bb5-b2fa-f6c65a6780b0">

Question 1 (top left visualization): Which genres produce the most average revenue?

Question 2 (top right visualization): Which countries have the most box office revenue?

Question 3 (bottom vizualization): Is there a relationship between the number of theaters a movie was shown in and its total revenue? Which movie had the best ratio of number of theaters and total revenue?

We wanted all three of our data visualizations to be revolved around the same idea so that when looking at the dashboard, we can gain a strong understanding of revenue with different factors. This is very important from a managerial perspective, as a company may want to know which country they should play the movie in for the most revenue potential,  which genre they should focus on when producing their next movie, or understanding historical trends on the amount of theaters the movie should be played in and the amount of revenue they should expect to receive. All three of these data visualizations help companies truly understand the market and lets them tap into historical data to understand trends in society and how they can potentially earn the most revenue.
