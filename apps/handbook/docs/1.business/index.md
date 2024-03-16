---
sidebar_position: 1
---

# 4 Layers Techmely

## Business Model

- Freemium
    - Customization
    - Push to the top ranking
- Crowdfunding for person/organization --> Earn commission
- Affiliate
- Personalized UX's Ads
- Connect the people with real-data

## Customer

### Individual

- Write/Record/sell your articles/books/courses in a place
- Analyze all the above things ---> Their unique knowledge tree, can hierarchy to other
- Connect with the same people like them
- Play the game to improve them-self, in a natural way
- AI Bot Individual with your unique knowledge tree

### Organization

- Everything of individual
- Organization Reputation/Ranking
- Anyone can access the knowledge tree of each-other(if having access)
- AI Bot Organization with the organization knowledge tree

## Product

### The first 10 features(Stable MVP)

- Authentication
    - Basic with email/password
    - With Provider
        - Google
        - Github
        - Twitter
        - Apple
- Authorization
    - ACL
- User
    - CRUD an user
    - CRUD a cluster user
- User Preferences
    - Locale
    - IP
- Multi-tenant
- Articles
    - Read/Write/Update/Draft/Delete
    - Share
    - Realtime Collaboration Writing - Local First
    - Reaction/Comment Collaboration
    - Draw in articles
- Courses
- Series
- Organization
- AI BOT

## Coding

### Tech Stack

Frontend: Vike + React + Tanstack Query(server-state) + Zustand(client-state)
Backend: Cloudflare Worker base on HonoJs
Infras: Deploy to Cloudflare Pages/Worker or AWS Startup

### Quality Control
- Overall code coverage minimum 70%
- 100% test UI/e2e for the marked critical features
- Follow project guideline, coding convention
- Automate run jobs to
    - Upgrade deps (1 month)
    - Run e2e test (2 days)
- All the error will be captured & handled