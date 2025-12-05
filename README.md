# Union Shop - Flutter E-Commerce Application

A Flutter-based e-commerce application replicating the structure and functionality of [shop.upsu.net](https://shop.upsu.net). This project demonstrates proficiency in UI replication, state management, navigation systems, and clean architecture patterns within Flutter.

## Project Overview

Union Shop is an academic assessment project focused on translating a Shopify-based web store into a Flutter application. The emphasis is on understanding e-commerce UI patterns, implementing responsive layouts, and developing a scalable architecture that supports both static and dynamic features.

### Key Features (Implemented)

- **Homepage**: Responsive hero section with promotional banner and featured product grid
- **Navigation System**: Dynamic navbar with Shop dropdown menu displaying all collections
- **Collections Overview**: Grid view of all available collections with image overlays
- **Collection View**: Detailed product view for each collection with responsive grid layout
- **Product Cards**: Real product data fetched from repository with dynamic pricing and sale indicators
- **Responsive Design**: Adaptive layouts for mobile, tablet, and desktop viewports
- **Clean Architecture**: Separation of concerns with views, models, and repositories pattern

## Installation & Setup

### Prerequisites

- **Flutter SDK**: Version 3.35.3 or higher ([Install Flutter](https://flutter.dev/docs/get-started/install))
- **Dart SDK**: Version 3.9.2 or higher (included with Flutter)
- **Git**: For cloning the repository
- **IDE**: VS Code, Android Studio, or any Flutter-compatible editor

### Setup Instructions

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Thegohome/union_shop.git
   cd union_shop
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the Application**
   - **Web (Chrome)**:
     ```bash
     flutter run -d chrome
     ```
   - **Windows Desktop**:
     ```bash
     flutter run -d windows
     ```
   - **Mobile Device/Emulator**:
     ```bash
     flutter run
     ```

4. **Build for Release**
   ```bash
   flutter build web  # Web release
   flutter build windows  # Windows release
   ```

## Usage Instructions

### Navigation

- **Home**: Click the logo or "Home" in the navbar to return to the homepage
- **Shop**: Hover over or click "Shop" in the navbar to view all collections, then select a collection to browse products
- **About**: Navigate to the About page from the navbar menu
- **SALE**: Click "SALE!" to view all available collections
- **Product Details**: Click any product card to view full product details (feature in development)

### Key User Flows

1. **Browse Collections**
   - Navigate to `/collections` to see all available product collections
   - Click on a collection card to view all products in that collection

2. **View Products**
   - Collections display products in a responsive grid (3 columns on desktop, 1 on mobile)
   - Each product card shows the product name, image, and pricing
   - Sale items display both original price (strikethrough) and sale price

3. **Product Information**
   - Click any product card to navigate to the detailed product page
   - View full product images, description, and pricing information

### Configuration

- **Styling**: All text styles are defined in `lib/views/app_styles.dart` for consistency
- **Colors**: Primary color is Portsmouth Purple (`#4d2963`)
- **Data**: Product and collection data sourced from `assets/data/products.json` and `assets/data/collections.json`

## Project Structure

```
lib/
├── main.dart                           # Application entry point and routing configuration
├── models/
│   ├── product.dart                   # Product data model
│   └── collection.dart                # Collection data model
├── repositories/
│   ├── product_repository.dart        # Product data provider
│   └── collection_repository.dart     # Collection data provider
└── views/
    ├── app_styles.dart                # Centralized text styles and colors
    ├── common_widgets.dart            # Reusable components (Header, Footer, Cards)
    ├── home_screen.dart               # Homepage with featured products
    ├── collections_screen.dart        # Collections overview page
    ├── collection_view_screen.dart    # Individual collection product view
    ├── product_page.dart              # Product detail page (in development)
    ├── about_screen.dart              # About Us page
    ├── login_screen.dart              # Login page
    └── print_about_screen.dart        # Print Shack information

assets/
├── images/                            # Product and collection images
├── data/
│   ├── products.json                  # Product catalog data
│   └── collections.json               # Collection definitions
└── ...

test/
└── ...                                # Unit and widget tests

pubspec.yaml                           # Project dependencies and configuration
```

### Key Components

#### `ProductRepository` & `CollectionRepository`
Singleton pattern data providers that:
- Lazy-initialize collections from JSON
- Cache data for performance
- Provide filtered access to products and collections

#### `ProductCard` & `CollectionCard`
Reusable card widgets that:
- Display product/collection information with images
- Support dynamic data fetching
- Implement responsive layouts

#### `AppHeader` & `AppFooter`
Navigation and footer components featuring:
- Responsive navbar with Shop dropdown menu
- Mobile-friendly menu toggle
- Dynamic collection fetching for dropdown
- Company information and links

## Technologies & Dependencies

### Core Framework
- **Flutter**: 3.35.3 - UI framework for cross-platform development
- **Dart**: 3.9.2 - Programming language

### Key Dependencies
- **Material Design**: Flutter's built-in Material library for UI components

### Development Tools
- **flutter_lints**: Static analysis for Dart code quality
- **Git**: Version control
- **Github Copilot**: See `prompts` folder, and `features.md` to understand usage

## Known Issues & Limitations

### Features Under Development
The following features are planned for future implementation based on the project roadmap:

1. **Authentication System** (Advanced Tier)
   - User registration and login functionality
   - Account dashboard and order history
   - Session management and logout

2. **Shopping Cart** (Intermediate Tier)
   - Add to cart functionality
   - Cart persistence across sessions
   - Quantity editing and item removal
   - Checkout simulation

3. **Product Details Page** (Intermediate Tier)
   - Dynamic product data population
   - Variant selector dropdown
   - Quantity counter controls
   - Related products section

4. **Search System** (Advanced Tier)
   - Search bar in navbar
   - Product search results page
   - Advanced filtering capabilities

5. **Filtering & Sorting** (Intermediate Tier)
   - Collection sorting options
   - Product attribute filters
   - Price range filtering
   - Pagination controls

6. **Print Shack Customization** (Intermediate Tier)
   - Dynamic form rendering for text personalization
   - Logo upload and selection
   - Add customized items to cart

7. **Static Pages**
   - Fully implemented About Us page
   - Complete Print Shack About page

### Current Limitations

- No shopping cart functionality
- No user authentication system
- No search capabilities
- Filtering and sorting not yet implemented
- Cart persistence not available

## Future Improvements

- **State Management**: Implement Provider for advanced state management
- **Accessibility**: Add semantic labels and screen reader support

## Running Tests

```bash
flutter test
```

Current test coverage includes basic widget and unit tests. Comprehensive testing suite to be expanded as features are completed.

## Contributing

This is an academic project. While contributions are limited to coursework requirements, feedback and suggestions are welcome.

## License

This project is part of an academic assessment at the University of Portsmouth and is provided as-is for educational purposes.

## References

- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Language Guide](https://dart.dev/guides)
- [Material Design](https://material.io/design)
- [Original Site Reference](https://shop.upsu.net)

---

