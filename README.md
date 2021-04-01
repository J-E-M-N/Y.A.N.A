# You Are Not Alone (Y.A.N.A)

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview
### Description
- Share and/or receive positive message with other users

### App Evaluation
- **Category:** Supportive Application
- **Mobile:** This app would be primarily developed for mobile but would perhaps be just as viable on a computer. Functionality wouldn’t be limited to mobile devices, however the mobile version might be easier to design for.
- **Story:** Users will be able to click on a button to receive positive messages of encouragement. They can also write their own positive messages that other users might receive. It's nice to know that you are not alone, even in tough times like these.
- **Market:** We primarily want to target college students but because of the positivity of the app anyone can use it.
- **Habit:** This app could be used as often as the user wants depending on what exactly they're looking for. It probably wouldn't be used every day, but it can definitely be used to help users who might need a bit of extra encouragement.
- **Scope:** We would start by targeting some Howard student groups and younger (college age and below).

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

- sign in 
- sign up 
- share button to initialize sharing of random positive message
- view button to see a list of your recieved random messages/own positive messages
- receive button to recieve random positive messages 

**Optional Nice-to-have Stories**

- create button to initialize design of your own random positive message
- database of user created messages we can sort through to allow as user created positive messages 
- view request page where user can gamify sending positive messages 
- settings page 

### 2. Screen Archetypes

* Login Screen
    * user can log in
* Sign Up Screen
    * user can create new account
* Home Screen
    * host navigation options (to other screens)
    * host share, view, and create (optional) buttons
* Message Board Screen
    * display all postive messages (PMs) that a user has received

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* PMs
* create (opt)

**Flow Navigation** (Screen to Screen)

* Login Screen
    * Home Screen
* Sign Up Screen
    * Login Screen 
* Home 
    * Login Screen (via logout button)
    * Message Board Screen (via PM tab)
    * Create Screen (via create button)
    * Positive Message Modal (via view button)


## Wireframes
![image](https://user-images.githubusercontent.com/45021016/113352403-31d60e00-930a-11eb-8188-a2efbf640034.png)


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
