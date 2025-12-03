Hello, I have a large project to complete, which involves recreating a Shopify store page in Flutter - 

note carefully: the focus is not on the shopping part, it's more on understanding the structure of web pages - and how that UI can be replicated using Flutter, 

the project requires, at a more advanced level (a majority of marks, yet beyond the required bare minimum a deeper understanding of state management + navigation) 
* see below for the client's table of requirements and weighting of features

important of course is general software engineering practices (including app architecture)

you can view the union_shop, project folder to review the current app architecture i'm using

- im partial to this current form, which will of course expand as the app increases in functionality and breadth
-- uses views / models / repositories so far

```
| Feature | Description | Marks (%) | Reference |
|---------|-------------|-----------|-----------|
| **Basic (40%)** | | | |
| Static Homepage | Homepage layout and widgets with static content (hardcoded data* acceptable, mobile view focus) | 5% | [Homepage](https://shop.upsu.net/) |
| Static Navbar | Top navigation bar with menu (links do not have to work at this stage, mobile view focus) | 5% | [Homepage](https://shop.upsu.net/) |
| About Us Page | Static about us page* with company information (separate page from homepage) | 5% | [About Us](https://shop.upsu.net/pages/about-us) |
| Footer | Footer with dummy* links and information present in at least one page | 4% | [Homepage](https://shop.upsu.net/) |
| Dummy* Collections Page | Page displaying various collections of products (hardcoded data* acceptable) | 5% | [Collections](https://shop.upsu.net/collections/) |
| Dummy* Collection Page | Page displaying products within one collection including dropdowns and filters (hardcoded data* acceptable, widgets do not have to function) | 5% | [Collection Example](https://shop.upsu.net/collections/autumn-favourites) |
| Dummy* Product Page | Product page showing details and images with dropdowns, buttons and widgets (hardcoded data* acceptable, widgets do not have to function) | 4% | [Product Example](https://shop.upsu.net/collections/autumn-favourites/products/classic-sweatshirt-1) |
| Sale Collection | Page showing sale products with discounted prices and promotional messaging (hardcoded data* acceptable, widgets do not have to function) | 4% | [Sale Items](https://shop.upsu.net/collections/sale-items) |
| Authentication UI | Login/signup page with the relevant forms (widgets do not have to function) | 3% | [Sign In](https://shop.upsu.net/account/login) |
| **Intermediate (35%)** | | | |
| Navigation | Full navigation across all pages; users should be able to navigate using buttons, navbar, and URLs | 3% | All pages |
| Dynamic Collections Page | Collections page populated from data models or services with functioning sorting, filtering, pagination widgets | 6% | [Collections](https://shop.upsu.net/collections/) |
| Dynamic Collection Page | Product listings of a collection populated from data models or services with functioning sorting, filtering, pagination widgets | 6% | [Collection Example](https://shop.upsu.net/collections/autumn-favourites) |
| Functional Product Pages | Product pages populated from data models or services with functioning dropdowns and counters (add to cart buttons do not have to work yet) | 6% | [Product Example](https://shop.upsu.net/collections/autumn-favourites/products/classic-sweatshirt-1) |
| Shopping Cart | Add items to cart, view cart page, basic cart functionality (checkout buttons should place order without real monetary transactions) | 6% | [Print Shack](https://shop.upsu.net/cart) |
| Print Shack | Text personalisation page with associated about page, the form must dynamically update based on selected fields | 3% | [Personalisation](https://shop.upsu.net/products/personalise-text) |
| Responsiveness* | The layout of the application should be adaptive and the application should function on desktop in addition to mobile view (no need to test it on real devices) | 5% | All pages |
| **Advanced (25%)** | | | |
| Authentication System | Full user authentication and account management (you can implement this with other external authentications like Google, not just Shop), includes the account dashboard and all relevant functionality | 8% | [Account](https://shop.upsu.net/account) |
| Cart Management | Full cart functionality including quantity editing/removal, price calculations and persistence | 6% | [Cart](https://shop.upsu.net/cart) |
| Search System | Complete search functionality (search buttons should function on the navbar and the footer) | 4% | [Search](https://shop.upsu.net/search) |

Below are explanations for some of the terminology used in the table:

***Pages** refer to distinct screens or views in your application that users can navigate to, through methods such as the `navigateToProduct` function in the same file as an example of how to define routes for different pages.

***Hardcoded data** refers to data (text or images) that is directly written into your code files rather than being fetched from a database or external service. For example, you can create a list of products with an AI-generated image and text descriptions directly in your Dart code instead of retrieving them from a backend.

***Dummy data** is data that is often hardcoded or (AI) generated for display or testing purposes. It is not meant to represent real-world data stored in your services.

***Responsiveness** refers to the ability of your application to adapt its layout and design based on the screen size and orientation of the device it is being viewed on. Your app should primarily focus on mobile view but to achieve full marks in this section, it should also function correctly on wider screens (desktop view).
```
💭💭💭💭💭
with all the above in mind, i would like you to write a document in my project root directory called `/prompts/features.md`

the file must contain two h1 headings:
- Project Summary + Context
- Feature List

this file you create will offer an extensive list of features, **based on the current project status**, and what more might be implemented to fulfil as much of the criteria

the list of features must be tiered, reflecting levels of complexity to achieve - this complexity must be informed strictly by the %'s defined for the basic / intermediary / advanced tasks 

if the implementation of one feature is dependent on another - please specify as much in brackets '()'

number each feature 

⚠️each feature described must be relatively atomic - described in 10 - 25 words, in a bulletted list
⚠️each feature should be designed such that it can then be implemented - at later point! - as a feature for the #file:RequirementsTemplate.md document
> this means that business logic, details about tests, or API's, or dependencies, should not factor in the list of features

🛑🛑🛑🛑

Tasks:

- Review current project structure/files/progress to..
- Review client specification to..
-- Create Project Summary + Context
- Review #file:RequirementsTemplate.md to..
-- Formulate Features List

🛄🛄🛄🛄🛄🛄

Pre-Tasks:

1. Confirm you have read this prompt by creating a new file called `/prompts/my_initial_prompt.md`, which must contain the entirety of this prompt, wait for my confirmation that I am satisfied with the completion of this task until you proceed to pre-task 2

2. Ask me several questions ideally, interrogating me on details which i can reply to and clarify to fill in any information gaps to ensure the maximum truth of the project is translated into the `/prompts/features.md` document you produce 

> give me a chance to respond to each question sequentially (q/a - dont send your second question until i've sent my first answer, and you're happy with that answer)

Confirm to me when you have made all considerations with the questions before proceeding to pre-task 3

3. Present to me the general file layout/structure you intend on using to populate the `/prompts/features.md` document, which we will discuss until ready for implementation - at which point you will proceed with the core task as declared above

🛄🛄🛄🛄🛄🛄

If there is a difficulty in beginning the pre-tasks, please alert me
