# Project Summary + Context

## Overview

This project involves recreating a Shopify-based e-commerce store (shop.upsu.net) in Flutter, with a primary focus on understanding and replicating web page structure and UI patterns rather than implementing full shopping functionality. The academic assessment evaluates capabilities across three complexity tiers: Basic (40%), Intermediate (35%), and Advanced (25%), with marks awarded for demonstrating proficiency in UI replication, state management, navigation systems, and general software engineering practices.

The project emphasizes learning how to translate web-based e-commerce interfaces into Flutter applications, requiring both static layout implementation and dynamic functionality powered by proper architecture patterns. Success depends on achieving a balance between meeting minimum requirements (Basic tier) and demonstrating deeper technical understanding through state management and navigation complexity (Intermediate and Advanced tiers).

## Current State

The project is in its early stages with foundational UI scaffolding established:

- **Existing Components**: `home_screen.dart` and `product_page.dart` provide basic visual mockups with placeholder content
- **UI Structure**: Header with promotional banner, navigation bar with icons, hero section, product grid, and footer are present but non-functional
- **Navigation**: Only basic Home → Product route is configured; all buttons use placeholder callbacks
- **Data Layer**: Empty `models/` and `repositories/` folders await implementation
- **Architecture**: Following views/models/repositories pattern, ready to expand as functionality grows
- **Interactivity**: Currently stateless widgets with hardcoded content and no user interaction beyond basic navigation

## Technical Approach

Development will follow a **feature-first methodology** where features represent discrete, user-facing capabilities ("what the app can do"). Each feature listed below is designed as an atomic unit that can be independently implemented and tracked, with clear mapping to the RequirementsTemplate.md specification for detailed planning.

**Key Implementation Principles:**
- **State Management & Responsiveness**: Treated as implementation qualities rather than discrete features, these are cross-cutting concerns that demonstrate technical proficiency and will be evaluated through the quality of feature implementation
- **Progressive Enhancement**: Basic tier establishes static UI and layout structure, Intermediate tier introduces dynamic data and functioning widgets, Advanced tier adds persistence and complex user flows
- **Architecture Quality**: Adherence to clean architecture patterns (views/models/repositories) with proper separation of concerns
- **Reference Fidelity**: UI should closely replicate the structure and behavior of shop.upsu.net while being optimized for Flutter's widget-based paradigm

## Success Metrics

Project success is measured through:
- **Feature Completion**: Achieving features across all three tiers with priority on Basic (40%) and Intermediate (35%) for passing grade
- **Implementation Quality**: Demonstrating proper state management, responsive layouts adapting to mobile and desktop views, and clean architecture
- **User Experience**: Functional navigation, smooth interactions, and faithful recreation of e-commerce UI patterns
- **Technical Proficiency**: Effective use of Flutter widgets, data models, routing systems, and adherence to software engineering best practices

---

# Feature List

## Basic Tier (40% of marks)
*Focus: Static UI, layout structure, hardcoded content acceptable*

### Homepage & Core Layout (14%)
- [x] 1. Create static homepage hero section with promotional banner and call-to-action button *→ #24
- [ ] 2. Build static navigation bar with logo, menu items, search, account, and cart icons *→ #18-23
- [ ] 3. Implement footer component with placeholder links and company information *→ #25
- [ ] 4. Display product grid section on homepage with hardcoded product cards *→ #26

### Static Pages (12%)
- [ ] 5. Create About Us page with static company information and branding content
- [ ] 6. Build authentication UI with login and signup forms (non-functional widgets acceptable) *→ #45-50
- [ ] 7. Create Print Shack About page with static information about text personalisation service

### Collections System - Static (14%)
- [ ] 8. Create Collections overview page displaying collection categories in responsive grid layout *→ #29-31
- [ ] 9. Build individual Collection page showing product grid with placeholder filter/sort dropdowns *→ #32-35
- [ ] 10. Create Sale Collection page displaying sale products with strike-through pricing and promotional messaging *→ #32-35
- [ ] 11. Implement static Product page with image, title, description, price, and non-functional widgets *→ #36-38

---

## Intermediate Tier (35% of marks)
*Focus: Dynamic data, functioning widgets, navigation, data models*

### Data Architecture (4%)
- [ ] 12. Create Product data model with properties for name, price, images, description, variants, sale status
- [ ] 13. Create Collection data model with properties for name, description, products, category type
- [ ] 14. Build data repository/service layer to provide collections and products to views

### Navigation System (5%)
- [ ] 15. Enable URL-based routing system for direct access to all application pages
- [ ] 16. Implement navigation from Homepage to Collections page via navbar and buttons (Depends: #8)
- [ ] 17. Implement navigation from Collections page to individual Collection page via collection cards (Depends: #8, #9)
- [ ] 18. Implement navigation from Collection page to Product page via product cards (Depends: #9, #11)
- [ ] 19. Implement navigation to About Us page from navbar menu (Depends: #5)
- [ ] 20. Implement navigation to Print Shack section from navbar with submenu for About/Personalisation (Depends: #7)
- [ ] 21. Implement navigation to Cart page from navbar cart icon (Depends: #40)
- [ ] 22. Implement navigation to Account/Authentication pages from navbar account icon (Depends: #6)
- [ ] 23. Enable search icon navigation to search functionality (Depends: #56)
- [ ] 24. Implement navbar menu drawer/overlay for mobile view with all navigation options
- [ ] 25. Populate footer with dynamic links to collections, pages, and company information (Depends: #13, #14)

### Dynamic Homepage (3%)
- [ ] 26. Populate homepage product section with preview items from multiple featured collections (Depends: #12, #13, #14, #4)
- [ ] 27. Implement carousel component for homepage hero section with rotating promotional banners
- [ ] 28. Add "View All" navigation links from homepage collection previews to full Collection pages (Depends: #17, #26)

### Dynamic Collections (8%)
- [ ] 29. Populate Collections overview page with collection data from data models/services (Depends: #13, #14, #8)
- [ ] 30. Implement functioning sort dropdown on Collections page with multiple sort options (Depends: #29)
- [ ] 31. Implement functioning filter widgets on Collections page to refine collection display (Depends: #29)
- [ ] 32. Populate Collection page with product data from selected collection (Depends: #12, #14, #9)
- [ ] 33. Implement functioning sort dropdown on Collection page for products (Depends: #32)
- [ ] 34. Implement functioning filter widgets on Collection page for product attributes (Depends: #32)
- [ ] 35. Add pagination controls on Collection page for browsing multiple product pages (Depends: #32)

### Functional Product Pages (5%)
- [ ] 36. Populate Product page with dynamic data from product models (Depends: #12, #14, #11)
- [ ] 37. Implement functioning variant selector dropdown to choose product options (Depends: #36)
- [ ] 38. Implement functioning quantity counter with increment/decrement controls (Depends: #36)

### Shopping Cart - Basic (7%)
- [ ] 39. Create Cart data model to store selected products, variants, and quantities
- [ ] 40. Create Cart view page displaying added items with images, names, and details
- [ ] 41. Implement "Add to Cart" functionality on Product page (Depends: #36, #38, #39)
- [ ] 42. Display cart item count badge on navbar cart icon (Depends: #39)
- [ ] 43. Implement checkout button on Cart page that simulates order placement (Depends: #40)

### Print Shack - Dynamic (3%)
- [ ] 44. Build Personalisation page with dropdown to select text line count or logo options (Depends: #7)
- [ ] 45. Implement dynamic form rendering showing text inputs based on dropdown selection (Depends: #44)
- [ ] 46. Add quantity selector and "Add to Cart" button on Personalisation page (Depends: #39, #44)

---

## Advanced Tier (25% of marks)
*Focus: Authentication, cart persistence, search functionality*

### Authentication System (8%)
- [ ] 47. Implement user registration with email/password or third-party authentication provider
- [ ] 48. Implement user login with credentials validation and session management (Depends: #6)
- [ ] 49. Create account dashboard page displaying user profile information and settings (Depends: #48)
- [ ] 50. Build order history view showing past orders within account dashboard (Depends: #49)
- [ ] 51. Implement logout functionality with session cleanup and navigation to homepage (Depends: #48)
- [ ] 52. Add password reset/recovery functionality for user accounts (Depends: #6)

### Advanced Cart Management (13%)
- [ ] 53. Implement cart item quantity editing with real-time price recalculation (Depends: #40, #41)
- [ ] 54. Add remove item functionality with confirmation and cart update (Depends: #40)
- [ ] 55. Implement cart persistence across sessions using local storage or database (Depends: #39)
- [ ] 56. Display running subtotal, taxes, and total price calculations in cart (Depends: #40)
- [ ] 57. Persist cart state when user logs in/out or refreshes application (Depends: #48, #55)

### Search System (4%)
- [ ] 58. Implement search bar functionality in navbar with text input and submission (Depends: #12, #14)
- [ ] 59. Create search results page displaying products matching search query (Depends: #58)
- [ ] 60. Implement search functionality in footer with navigation to search results (Depends: #58, #25)
- [ ] 61. Enable product search functionality displaying results without additional filtering/sorting (Depends: #59)

---

## Notes

- **Dependencies** are indicated in parentheses where features build upon others, with emphasis on cross-tier dependencies
- **Asterisks (*)** on Basic tier features indicate corresponding Intermediate tier features that implement dynamic versions
- Each feature is designed to map 1:1 to RequirementsTemplate.md for detailed implementation planning
- **Percentage allocations** within each tier align with client specification marking criteria
- **State management and responsive design** are implementation qualities embedded in feature execution, not discrete deliverables
- **Architecture pattern** (views/models/repositories) should be maintained and expanded as features are implemented
