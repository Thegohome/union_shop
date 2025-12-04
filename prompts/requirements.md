# Document Usage

This document provides detailed specifications for individual features from the `features.md` roadmap. Each feature requirement outlines what must be delivered (Success Criteria), how it should be implemented (Implementation Plan), and who should execute it (Ownership).

**Purpose**: Bridge the gap between high-level feature descriptions and actionable development tasks. Each requirements document maps 1:1 to a feature in the feature list, allowing for granular tracking and implementation guidance.

**Structure**: Success Criteria describe the *what* (Tests, UI, Internal Logic); Implementation Plan describes the *how* with atomic steps. Avoid redundancy—criteria and implementation should complement, not repeat each other. Sections marked `N/A` indicate not applicable at that tier (e.g., Business Logic for static features). Headings are decremented for proper document nesting as sub-sections.

**Usage**: LLMs reference Success Criteria to verify completion; Implementation Plan provides procedural guidance. Use as a specification template for each feature requiring detailed requirements documentation.

Some features direct for static pages to be developed, which would require further work, should they later be developed as dynamic - these features are asked to 'await' completion of their dynamic counterparts - by which point implicit completion is achieved

# Features

## F1: Static Homepage

--
Summary: Create static homepage hero section with promotional banner and call-to-action button
--
Outcome: Users see an engaging hero section on homepage with background image, promotional text, and functional call-to-action button
--

### Success Criteria

#### Tests:
- [x] Hero section renders with responsive height (40% of viewport) and full width
- [x] Hero section background image displays with dark overlay applied
- [x] Hero title, subtitle, and "BROWSE PRODUCTS" button all render with correct styling
- [x] Button uses custom background color (0xFF4d2963) with white text and no border radius
- [x] Hero section maintains proper proportions across mobile and desktop screen sizes

#### UI:
- [x] Hero section positioned below main header with full-width background image
- [x] Hero height is 40% of viewport height for responsive mobile/desktop scaling
- [x] All text is white, centered, and properly spaced (title 32px, subtitle 20px)
- [x] Semi-transparent black overlay (0.7 alpha) applied over background image
- [x] Call-to-action button prominently displayed below subtitle text

#### Internal Logic (APIs):
- [x] Hero section uses Stack with Positioned layout for background and overlay
- [x] Background image implemented with NetworkImage and BoxDecoration
- [x] Button connected to placeholderCallbackForButtons method

#### Business Logic:
N/A

### Dependencies:
N/A

### Testimonies

#### User 1
```
As a first-time visitor to the Union Shop, I want to see an eye-catching hero 
section that immediately communicates what the shop is about and encourages me 
to explore products through a clear call-to-action button.
```

#### User 2
```
As a returning customer on mobile, I want the hero section to display properly 
and scale responsively so the promotional message and button remain accessible 
on my device screen.
```

### Implementation Plan

- [x] 1. Calculate hero height as 40% of viewport using MediaQuery.of(context).size.height
- [x] 2. Create SizedBox container with responsive height calculation and full width
- [x] 3. Implement Stack layout with Positioned.fill for background image layer and overlay
- [x] 4. Load background image from network URL with error builder for fallback handling
- [x] 5. Layer semi-transparent black overlay (0.7 alpha) over background within Stack
- [x] 6. Add Positioned centered content layer with Column for title, subtitle, and button
- [x] 7. Write and run tests to verify responsive behavior and styling across screen sizes

## F2: Static Navigation Bar

--
Summary: Build static navigation bar with logo, menu items, search, account, and cart icons
--
Outcome: Users see a professional navigation bar at top with logo, menu items, and action icons for easy store navigation
--

### Success Criteria

#### Tests:
- [x] Navigation bar renders with full width and correct height across all screen sizes
- [x] Logo displays on left side of navbar with correct dimensions and aspect ratio
- [x] Menu items (Shop, About, Print Shack) display as links in navbar with proper spacing
- [x] Search, account, and cart icons render with correct styling and positioning
- [x] Navbar layout adapts responsively from mobile (375px) to desktop (1440px+) viewports

#### UI:
- [x] Logo positioned on left side of navbar with consistent sizing across viewports
- [x] Navigation menu items displayed horizontally with readable font size (16-18px)
- [x] Search, account, and cart icons positioned on right side with consistent sizing
- [x] Icons rendered with proper fill color matching app design theme with visual feedback
- [x] Navbar has consistent background color and subtle border/shadow for depth and separation

#### Internal Logic (APIs):
- [x] Navbar uses Row widget with Expanded/Spacer widgets for flexible layout alignment
- [x] Logo implemented as Image widget with proper error handling and sizing
- [x] Menu items implemented as TextButton widgets with placeholder callback functions
- [x] Icons implemented using Icon widget from Material Design icon set
- [x] Navbar responsive with items scaling/reflowing properly across all screen sizes

#### Business Logic:
N/A

### Dependencies:
N/A

### Testimonies

#### User 1
```
As a customer browsing the Union Shop, I want to see a clear navigation bar 
with the logo and menu options so I can easily understand the store structure 
and quickly navigate to different sections.
```

#### User 2
```
As a mobile user, I want the navbar to adapt to my screen size with icons 
and text remaining accessible and properly spaced so I can navigate without 
confusion or accidental taps.
```

### Implementation Plan

- [x] 1. Load logo image from network URL with error handling fallback implemented
- [x] 2. Render search, account, and cart icons using Material Design Icon widgets
- [x] 3. Implement horizontal menu with Shop, About, and Print Shack text buttons
- [x] 4. Use Row with Expanded/Spacer widgets for proper spacing and flexible layout alignment
- [x] 5. Apply background color and styling matching design system for navbar container
- [x] 6. Write widget tests validating navbar layout, component rendering, and responsiveness across viewports

## F3: Footer Component

--
Owner: @student
Priority: High
Status: Planned
--
Summary: Implement footer component with placeholder links and company information
--
Outcome: Users see a professional footer with company info, links, and branding at bottom of every page
--

### Success Criteria

#### Tests:
- [x] Footer renders with full width and correct height at bottom of page
- [ ] Footer displays opening hours, links and email subscription entry box

#### UI:
- [ ] Footer positioned at bottom of home page
- [x] Links use underline or hover effect to indicate interactivity

#### Internal Logic (APIs):
- [x] Footer uses Column and Row widgets for organized section layout
- [x] Links implemented as TextButton with placeholder callbacks
- [x] Footer responsive with single column on mobile and multi-column on desktop
- [x] Footer text uses consistent font sizes and colors from app_styles theme

#### Business Logic:
N/A

### Dependencies:
N/A

### Testimonies

#### User 1
```
As a customer, I want to find information and links to important 
pages in the footer so I can easily reach out or navigate to company information.
```

#### User 2
```
As a mobile user browsing on a small screen, I want the footer to be organized 
and readable without excessive scrolling, showing key links in a compact format.
```

### Implementation Plan

- [x] 1. Create footer container with full width and fixed/consistent height
- [x] 2. Add opening hours section + help and info section
- [x] 3. Add email entry box for 'Latest Offers' section
- [ ] 4. Add social media links section with icon buttons and payment providers
- [ ] 5. Add copyright info 
- [x] 6. Make footer responsive with different layouts for mobile and desktop viewports
- [ ] 7. Write widget tests validating footer content, layout, and responsiveness

## F4: Product Grid (Homepage) - await F29
## F5: About Us Page

--
Owner: @student
Priority: Medium
Status: Complete
--
Summary: Create About Us page with static company information
--
Outcome: Users see company information on dedicated About page
--

### Success Criteria

#### Tests:
- [x] About Us page renders with header and footer
- [x] Page displays "About Us" heading centered
- [x] Page displays company information text block centered
- [x] Text block is findable by key for testing purposes

#### UI:
- [x] Header (AppHeader) displayed at top
- [x] "About Us" heading centered with heroTitle styling
- [x] Company information text block centered with 40px horizontal padding
- [x] Footer (AppFooter) displayed at bottom
- [x] Content uses consistent typography from app_styles

#### Internal Logic (APIs):
- [x] Page implemented as StatelessWidget with Column layout
- [x] Uses Scaffold with body containing header, content, footer
- [x] Content wrapped in SingleChildScrollView for scrolling on small screens
- [x] Text block wrapped in Container with key='aboutTextBlock' for testing
- [x] Uses AppHeader and AppFooter components for consistent navigation

#### Business Logic:
N/A

### Dependencies:
- AppHeader component
- AppFooter component
- app_styles (heroTitle text style)

### Testimonies

#### User 1
```
As a new customer, I want to learn about the Union Shop company and its mission 
so I can understand what I'm supporting with my purchase.
```

#### User 2
```
As someone browsing the site, I want to easily find information about the company 
from a dedicated About page accessible via the navigation menu.
```

### Implementation Plan

- [x] 1. Create new AboutScreen widget in views/about_screen.dart
- [x] 2. Add AppHeader and AppFooter components
- [x] 3. Add centered "About Us" heading with heroTitle style
- [x] 4. Add centered company information text block with key for testing
- [x] 5. Implement SingleChildScrollView for mobile responsiveness
- [x] 6. Add route in main.dart for navigation
- [x] 7. Write widget tests validating header, heading, text block, and footer

## F6: Authentication UI

--
Owner: @student
Priority: Medium
Status: Complete
--
Summary: Build static login page with centered form box and authentication options
--
Outcome: Users see a clean, centered login interface with email field and external provider button
--

### Success Criteria

#### Tests:
- [x] Login page renders with centered white container on neutral background
- [x] Page displays "Sign in" heading with descriptive subtitle
- [x] Page displays "Sign in with PortShop" button (blue/indigo)
- [x] Page displays email input field with placeholder text
- [x] Page displays "Continue" button (secondary/gray styling)
- [x] Divider text "or" displays between button and form fields
- [x] Union Shop logo displays at top of form

#### UI:
- [x] Centered white rounded container (box styling, not full screen)
- [x] Union Shop logo positioned at top of form
- [x] "Sign in" heading with subtitle "Choose how you'd like to sign in"
- [x] "Sign in with PortShop" button in blue/indigo, full width
- [x] "or" divider text between button and form section
- [x] Email input field with "Email" placeholder
- [x] "Continue" button in secondary gray styling, full width
- [x] Responsive layout centers content on desktop/tablet, adapts on mobile

#### Internal Logic (APIs):
- [x] Page implemented as StatelessWidget with Column layout
- [x] Uses Scaffold with light gray or neutral background
- [x] Centered Container with white background for form box
- [x] TextField for email input with placeholder and no error state
- [x] ElevatedButton for "Sign in with PortShop" (blue/indigo)
- [x] ElevatedButton for "Continue" (gray/secondary)
- [x] All buttons have placeholder onPressed callbacks
- [x] Form wrapped in SingleChildScrollView for mobile responsiveness

#### Business Logic:
N/A

### Dependencies:
N/A

### Testimonies

#### User 1
```
As a returning customer, I want a straightforward login page where I can quickly 
sign in via an external provider or with my email.
```

#### User 2
```
As a new user, I want a clean, uncluttered login interface that makes it clear 
how to sign in without overwhelming me with options.
```

### Implementation Plan

- [x] 1. Create LoginScreen widget in views/login_screen.dart with Scaffold and neutral background
- [x] 2. Add centered white Container for form box (padding, border radius)
- [x] 3. Add Union Shop logo image at top of form
- [x] 4. Add "Sign in" heading with subtitle text below logo
- [x] 5. Add blue/indigo "Sign in with PortShop" ElevatedButton (full width)
- [x] 6. Add "or" divider text between button and form fields
- [x] 7. Add email TextField with placeholder text and no validation styling
- [x] 8. Add gray "Continue" ElevatedButton (full width) with placeholder callback
- [x] 9. Add route /login in main.dart for navigation
- [x] 10. Write widget tests validating logo, heading, buttons, input field, and layout

## F7: Print Shack About Page

--
Owner: @student
Priority: Medium
Status: Planned
--
Summary: Create Print Shack About page with static information about text personalisation service
--
Outcome: Users learn about Print Shack service offerings and personalization capabilities
--

### Success Criteria

#### Tests:
- [ ] Print Shack page renders with proper heading and content hierarchy
- [ ] Page displays service description and personalization capabilities
- [ ] Page includes examples or use cases for personalized products
- [ ] Page has call-to-action button directing to personalization/shopping
- [ ] Page layout is responsive and readable on mobile and desktop

#### UI:
- [ ] Page title "The Print Shack" prominently displayed at top
- [ ] Service description explains what text personalization services are offered
- [ ] Section showing types of products available for personalization
- [ ] Examples or sample images of personalized products displayed
- [ ] Call-to-action button styled consistently with app theme color (purple)

#### Internal Logic (APIs):
- [ ] Page implemented as StatelessWidget with Column layout for content flow
- [ ] Uses appropriate spacing and padding for visual hierarchy and readability
- [ ] Images implemented with Image.network and errorBuilder fallbacks
- [ ] Text styled using app_styles for consistent typography and colors
- [ ] Call-to-action button uses TextButton or ElevatedButton with callback

#### Business Logic:
N/A

### Dependencies:
N/A

### Testimonies

#### User 1
```
As a customer interested in personalized gifts, I want to learn about Print 
Shack offerings so I can understand customization options and product range.
```

#### User 2
```
As someone exploring the Union Shop, I want to see examples of personalized 
products to get ideas for custom items I might want to create.
```

### Implementation Plan

- [ ] 1. Create new PrintShackScreen widget and route in main.dart
- [ ] 2. Add page heading "The Print Shack" with appropriate text styling
- [ ] 3. Add service description section explaining personalization capabilities
- [ ] 4. Add product types section listing available items for personalization
- [ ] 5. Add examples section with sample images of personalized products
- [ ] 6. Add call-to-action button linking to personalization form or shop
- [ ] 7. Write widget tests validating page content, layout, and navigation

## F8: Collections overview page - await F29
## F9: Collection page (product list) - await F32
## F10: Sales Collection page - await F18 + F29 + F36
## F11: Static Product page - await F36

## F12: Product Data Model

--
Owner: @student
Priority: High
Status: Planned
--
Summary: Create Product data model with properties to support name, price, images, description, variants, sale status etc.
--
Outcome: Application has structured data representation for products enabling dynamic content display and cart functionality
--

### Success Criteria

#### Tests:
- [ ] Product model instantiates with all required properties
- [ ] Product model correctly handles variants and sale status
- [ ] Product model supports conversion to/from JSON for data persistence
- [ ] Product equality comparison works for testing and data validation

#### UI:
N/A

#### Internal Logic (APIs):
- [ ] Product class created with properties: id, name, price, images, description, variants(map), isSale, salePrice
- [ ] Product constructor with required and optional parameters
- [ ] Product supports JSON serialization/deserialization (toJson, fromJson methods)
- [ ] Product model located in lib/models/product.dart

#### Business Logic:
- [ ] Product variant handling supports multiple options per product
- [ ] Sale price logic validates sale price is less than regular price
- [ ] Product supports multiple images with fallback for missing images

### Dependencies:
N/A

### Testimonies

#### User 1
```
As a developer, I want a well-structured Product model so I can reliably 
store and retrieve product information throughout the application.
```

#### User 2
```
As a system architect, I want Product data properly serializable so that 
products can be persisted to storage and retrieved dynamically.
```

### Implementation Plan

- [x] 1. Create lib/models/product.dart file
- [ ] 2. Define Product class with required properties: id, name, price, images, description
- [ ] 3. Add optional properties: variants, isSale, salePrice
- [ ] 4. Implement Product constructor with parameter validation
- [ ] 5. Add toJson() method for JSON serialization
- [ ] 6. Add fromJson() factory constructor for JSON deserialization
- [ ] 7. Create tests for this elements of the implementation

## F13: Collection Data Model

--
Owner: @student
Priority: High
Status: Planned
--
Summary: Create Collection data model with properties for name, description, products, and category type
--
Outcome: Application has structured data representation for product collections enabling category browsing and filtering
--

### Success Criteria

#### Tests:
- [ ] Collection model instantiates with all required properties
- [ ] Collection model correctly stores list of products
- [ ] Collection model supports conversion to/from JSON
- [ ] Collection equality comparison works for testing and data validation

#### UI:
N/A

#### Internal Logic (APIs):
- [ ] Collection class created with properties: id, name, description, products, categoryType, image
- [ ] Collection constructor with required and optional parameters
- [ ] Collection supports JSON serialization/deserialization (toJson, fromJson methods)
- [ ] Collection supports equality operator and hashCode for comparison
- [ ] Collection model located in lib/models/collection.dart

#### Business Logic:
- [ ] Collection maintains ordered list of Product objects
- [ ] Collection supports category type enum (All, Sales, Featured, etc.)
- [ ] Collection provides product count and filtering utilities

### Dependencies:
- Product model (F12)

### Testimonies

#### User 1
```
As a developer, I want a well-structured Collection model so I can organize 
and manage groups of products by category or promotional intent.
```

#### User 2
```
As a system architect, I want Collection data properly structured so that 
collections can be fetched, stored, and displayed dynamically.
```

### Implementation Plan

- [ ] 1. Create lib/models/collection.dart file
- [ ] 2. Define Collection class with required properties: id, name, description, categoryType
- [ ] 3. Add products property to hold list of Product objects
- [ ] 4. Add optional image property for collection display
- [ ] 5. Implement Collection constructor with parameter validation
- [ ] 6. Add toJson() method for JSON serialization
- [ ] 7. Add fromJson() factory constructor for JSON deserialization

## F14: Data Repository/Service Layer

--
Owner: @student
Priority: High
Status: Planned
--
Summary: Build data repository/service layer to provide collections and products to views
--
Outcome: Views have clean, centralized access to product and collection data through a repository interface
--

### Success Criteria

#### Tests:
- [ ] Repository provides method to fetch all collections
- [ ] Repository provides method to fetch specific collection by id
- [ ] Repository provides method to fetch all products
- [ ] Repository provides method to fetch specific product by id
- [ ] Repository returns hardcoded data for initial implementation

#### UI:
N/A

#### Internal Logic (APIs):
- [ ] ProductRepository class created with methods for product access
- [ ] CollectionRepository class created with methods for collection access
- [ ] Repository provides async methods for data fetching
- [ ] Repository supports filtering and search operations
- [ ] Repository located in lib/repositories/ folder

#### Business Logic:
- [ ] Repository initializes with hardcoded sample data
- [ ] Repository provides single point of access for data layer
- [ ] Repository isolates business logic from views

### Dependencies:
- Product model (F12)
- Collection model (F13)

### Testimonies

#### User 1
```
As a developer, I want a clean repository interface so I can fetch products 
and collections without worrying about data source implementation details.
```

#### User 2
```
As an architect, I want a centralized service layer so that swapping from 
hardcoded data to API calls or local storage is straightforward.
```

### Implementation Plan

- [ ] 1. Create lib/repositories/ folder
- [ ] 2. Create lib/repositories/product_repository.dart with ProductRepository class
- [ ] 3. Add getAll() method to fetch all products
- [ ] 4. Add getById(id) method to fetch specific product
- [ ] 5. Create lib/repositories/collection_repository.dart with CollectionRepository class
- [ ] 6. Add getAll() method to fetch all collections
- [ ] 7. Add getById(id) method to fetch specific collection
- [ ] 8. Initialize repositories with hardcoded sample data