# Document Usage

This document provides detailed specifications for individual features from the `features.md` roadmap. Each feature requirement outlines what must be delivered (Success Criteria), how it should be implemented (Implementation Plan), and who should execute it (Ownership).

**Purpose**: Bridge the gap between high-level feature descriptions and actionable development tasks. Each requirements document maps 1:1 to a feature in the feature list, allowing for granular tracking and implementation guidance.

**Structure**: Success Criteria describe the *what* (Tests, UI, Internal Logic); Implementation Plan describes the *how* with atomic steps. Avoid redundancy—criteria and implementation should complement, not repeat each other. Sections marked `N/A` indicate not applicable at that tier (e.g., Business Logic for static features). Headings are decremented for proper document nesting as sub-sections.

**Usage**: LLMs reference Success Criteria to verify completion; Implementation Plan provides procedural guidance. Use as a specification template for each feature requiring detailed requirements documentation.

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

## F4: Product Grid Section

--
Owner: @student
Priority: High
Status: Planned
--
Summary: Display product grid section on homepage with hardcoded product cards
--
Outcome: Users see an organized grid of featured products on the homepage with consistent styling
--

### Success Criteria

#### Tests:
- [ ] Product grid renders with correct number of columns based on screen width
- [ ] Product cards display with image, title, price, and action button
- [ ] Grid maintains consistent spacing and alignment across all product cards
- [ ] Grid layout adapts from single column on mobile to multi-column on desktop
- [ ] Product cards are clickable and trigger navigation to product detail page

#### UI:
- [ ] Product cards displayed in responsive GridView with 1 column on mobile, 2+ on desktop
- [ ] Each card shows product image with proper aspect ratio and error handling
- [ ] Product title displayed with readable font size (14-16px) below image
- [ ] Price displayed prominently with currency symbol and consistent formatting
- [ ] Action button (Add to Cart or View Details) styled to match app theme

#### Internal Logic (APIs):
- [ ] Grid implemented using GridView.count with responsive crossAxisCount
- [ ] Product cards implemented as reusable ProductCard widget component
- [ ] Cards use Image.network with errorBuilder for image loading failures
- [ ] Cards respond to tap gestures with navigation or callback functions
- [ ] Grid uses proper spacing (mainAxisSpacing, crossAxisSpacing) for layout

#### Business Logic:
N/A

### Dependencies:
- ProductCard component

### Testimonies

#### User 1
```
As a shopper browsing the homepage, I want to see a grid of featured products 
with images and prices so I can quickly browse and find items of interest.
```

#### User 2
```
As a mobile user with limited screen space, I want the product grid to adapt 
to single column layout so I can easily view and tap on products.
```

### Implementation Plan

- [ ] 1. Verify ProductCard widget exists and contains required properties
- [ ] 2. Create GridView container with responsive column count based on screen width
- [ ] 3. Populate grid with hardcoded ProductCard widgets for display
- [ ] 4. Set appropriate spacing (mainAxisSpacing, crossAxisSpacing) for visual balance
- [ ] 5. Implement responsive behavior with different column counts per viewport
- [ ] 6. Add "PRODUCTS SECTION" header text above grid with consistent styling
- [ ] 7. Write widget tests validating grid layout, card rendering, and responsiveness

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
Status: Planned
--
Summary: Build authentication UI with login and signup forms (non-functional widgets acceptable)
--
Outcome: Users see properly structured login and signup forms with fields ready for future backend integration
--

### Success Criteria

#### Tests:
- [ ] Authentication pages render with proper heading and form title
- [ ] Login form displays email/username and password input fields
- [ ] Signup form displays name, email, password, and confirm password fields
- [ ] Form fields have appropriate labels, placeholders, and input validation UI
- [ ] Submit buttons and navigation links between login/signup are present and styled

#### UI:
- [ ] Login page has clear heading "Login" or "Sign In" with centered form layout
- [ ] All input fields are clearly labeled with descriptive text
- [ ] Password fields mask input with dots or asterisks for security appearance
- [ ] Form has prominent submit button styled to match app theme (purple background)
- [ ] Links to signup page from login and vice versa with appropriate styling

#### Internal Logic (APIs):
- [ ] Forms implemented using TextField widgets with TextEditingControllers
- [ ] Form validation logic displays error messages for empty or invalid fields
- [ ] Submit buttons have onPressed callbacks (placeholder functions for now)
- [ ] Forms use Padding and Column for organized vertical layout
- [ ] Forms are wrapped in scrollable container (SingleChildScrollView) for small screens

#### Business Logic:
N/A

### Dependencies:
N/A

### Testimonies

#### User 1
```
As a returning customer, I want to see a clear and intuitive login form so I 
can quickly sign in to my account and view my order history.
```

#### User 2
```
As a new customer, I want a straightforward signup form with clear instructions 
so I can create an account to make purchases and track orders.
```

### Implementation Plan

- [ ] 1. Create LoginScreen widget with heading, email field, password field
- [ ] 2. Create SignupScreen widget with name, email, password fields
- [ ] 3. Add form validation logic to check for empty fields and display errors
- [ ] 4. Add "Forgot Password?" link on login form and appropriate styling
- [ ] 5. Add submit button on both forms with placeholder callback functions
- [ ] 6. Add navigation links between login and signup pages using TextButton
- [ ] 7. Write widget tests validating form fields, buttons, and navigation

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
