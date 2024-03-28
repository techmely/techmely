# Techmely

<!-- PROJECT LOGO -->
<p align="center">
  <a href="https://github.com/techmely/techmely">
   <img src="https://i.ibb.co/3zBkRpd/LogoX300.png" alt="Logo">
  </a>

  <h3 align="center">Make your dreams come true easier with Techmely
</h3>

  <p align="center">
    The open-source Medium, LinkedIn and Udemy.
    <br />
    <a href="https://techmely.com"><strong>Learn more »</strong></a>
    <br />
    <br />
    <a href="https://chat.techmely.com">Discord</a>
    ·
    <a href="https://techmely.com">Website</a>
    ·
    <a href="https://github.com/techmely/techmely/issues">Issues</a>
    ·
    <a href="https://roadmap.techmely.com">Roadmap</a>
  </p>
</p>

<p align="center">
   <a href="https://chat.techmely.com"><img src="https://img.shields.io/badge/Discord-chat.techmely.com-%234A154B" alt="Join Techmely Discord"></a>
   <a href="https://status.techmely.com"><img height="20px" src="https://betteruptime.com/status-badges/v1/monitor/a9kf.svg" alt="Uptime"></a>
   <a href="https://github.com/techmely/techmely.com/stargazers"><img src="https://img.shields.io/github/stars/harrytran998/techmely" alt="Github Stars"></a>
   <a href="https://github.com/techmely/techmely.com/blob/main/LICENSE"><img src="https://img.shields.io/badge/license-AGPLv3-purple" alt="License"></a>
   <a href="https://github.com/techmely/techmely/pulse"><img src="https://img.shields.io/github/commit-activity/m/harrytran998/techmely" alt="Commits-per-month"></a>
   <a href="https://techmely.com/pricing"><img src="https://img.shields.io/badge/Pricing-Free/Premium-brightgreen" alt="Pricing"></a>
   <a href="https://hub.docker.com/r/harrytran998/techmely"><img src="https://img.shields.io/docker/pulls/harrytran998/techmely"></a>
   <a href="https://youtube.com/@techmely"><img src="https://img.shields.io/youtube/channel/subscribers/UCg3EWZXQK0bnbQISG50Nwfg"></a>
   <a href="https://techmely.com/design/figma"><img src="https://img.shields.io/badge/Figma-Design%20System-blueviolet"></a>
   <a href="https://contributor-covenant.org/version/1/4/code-of-conduct/ "><img src="https://img.shields.io/badge/Contributor%20Covenant-1.4-purple" /></a>
   <a href="https://console.algora.io/org/techmely/bounties?status=open"><img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fconsole.algora.io%2Fapi%2Fshields%2Ftechmely%2Fbounties%3Fstatus%3Dopen"/></a>
</p>

## Build with

### Frontend

- 🧩 **Components**: Use @techmely/ui packages with Radix UI
- 🪩 **Web**: Use Vite & React & Tanstack Query for the Dx perfect
- **Desktop**: Build with [Tauri](https://tauri.app/)
- **Mobile**: Use Flutter for performance
- Leverage **Web Assembly** and **WebGPU** to handle 3D models
- **Animation**: Using ThreeJs, GSap and Swup for smooth transition/animation

### Backend

- **AI**: Support GPT models to help user write/copy easier!
- Use **H3** server to create API/Cache/Proxy
- **Database**: Use **PlanetScale** to optimize system cost, also can switch to SQLite, MySQL, Postgres or whatever
- **Error Handler**: Both server and client have the error boundary to catch and notify the client's error to the team. And using native type-safe
- **Payments**: unified API for one-off & subscription billing methods for Stripe
- **Notification**: Use PWA to handle Web Push notis, SMS and webhooks
- **Queue**: Handle the heavy workload on the background(client/server)
- **Kysely**: Query builder powerful, really type-safe
- **Realtime Collaboration**: Use CRDT-Driven mindset, and based on [BlockSuite](https://github.com/toeverything/blocksuite) to create realtime editing and painting whatever you want!
- **Search Engine** smart searching, advanced filtering & sorting, pagination, headless UI
- **Storage**: Use [UnStorage](https://unstorage.unjs.io) for all environments(Browser, Worker)
- **Validation**: Use [Zod](https://zod.dev/) for validate all the form, schema and whatever we need to validate!
- **Cache**: Use [BentoCache](https://github.com/Julien-R44/bentocache) for Im-mem cache, redis, DynamoDB, and more—serverless
- **CLIs**: Power by GoLang - create beautiful CLIs for Linux, Windows, and Mac—without requirements
- **AxiomJs** all you need to debug, log & analyze

### Cloud

- **Server** local development server & production-ready servers out-of-the-box
- **Serverless** on-demand, auto-scaling, zero maintenance
- **CDN** zero-config, low-latency, request life-cycle hooks, optimized request compressions (Brotli & gzip)
- **Domain** version-controlled & zero-config domain management (e.g. DNS management)
- **AI** fine-tune a foundational model using your application data
- **AWS** startup program: Infrastructure as Code version-controlled cloud infrastructure(Up to $100,000 USD AWS Activate credits)
 
### CI/CD

_Focus on coding, not publishing._

- Automatically release process with Github Action
- Have a lot of Bot/CLI(Rabbit AI, CodeQL, LGTM, KnipJs, BiomeJs...) to help project always in high quality
- Production deployments—zero-setup push-to-deploy
- Zero Downtime deploy with confidence using a zero-downtime deployment strategy
- Release Manager libraries (component & function) auto-published to npm, git helpers, and more


### Development Experiences

- Leverage the [**UnJs**](https://unjs.io/) ecosystem to have some incredible features like *Auto Import* and *Framework Agnostic* 
- Use **Git Workflow** + **Semantic commit** + **Rabbit AI** to have great commit!
- **Spell checker** will notified once there had typos
- Have a lot of **Utilities collections** like **VueUse** and **@techmely/utils** for handling data
- **Testing** - All feature have Unit + UI + e2e testing(mocking DB)
- Code Snippets say goodbye to the boilerplate
- Team Management manage your team & their permissions


This project mainly write with Typescript + Vue + Rust, so you should learn it to contribute easier 🌷

## How to run project

1. Install deps `bun install`
1. Run web site + api with command `bun run dev`
2. Have fun with that.

## How to get the icons for project?

1. Go to `https://icones.js.org/collection/all` and search what you needs.
2. Copy the symbol of icons
3. If your icon just specific for one page --> Create a list icons for that page in `/public/svg` folder --> Add page name, EX: post.svg
4. If your icon is a common icon, can use anywhere in app --> add to the last item on `public/svg/common.svg`
5. Use `SvgUse` component to expose the icon on view

## The decided of technical to fit with the business

1. The width of detail blog post

   - With the research --> We chosen the width is around 70~80 characters depends on the user-device width + The main language is LATIN(Vietnamese + English).
   - So the width is `34rem` to `38rem`.

   Here is some research paper:

   - <https://baymard.com/blog/line-length-readability>

2.

## Thirst party API

- <https://developers.google.com/youtube/v3/docs/?apix=true>


## Deployment

### Self-host Docker Deployment

1. checkout source ```git clone https://github.com/techmely/techmely.git```
1. got into new source dir: ```cd tech```
1. build Docker image: ```docker build .```
1. create local storage directory for settings: ```mkdir tml-storage```
1. adjust permissions of storage dir: ```sudo chown 911:911 ./tml-storage```
1. start container: ```docker-compose up -d```


```sh
git clone https://github.com/techmely/techmely.git
cd techmely
bun run docker.build # build Docker image for all app
bun run docker.storage # create local storage directory + adjust permissions of storage dir
bun run docker.up # Start container - Enjoy
```