# Quick Wash - Flutter Application

## Project Structure

This Flutter application follows a clean, modular architecture with separate files for screens, widgets, constants, and models.

### Directory Structure

```
lib/
├── constants/
│   ├── app_colors.dart          # Color palette definitions
│   └── app_text_styles.dart     # Typography styles
├── models/
│   └── intro_data.dart          # Data models
├── screens/
│   ├── splash_screen.dart       # Initial splash screen
│   ├── intro_screen.dart        # Onboarding intro screens
│   └── home_screen.dart         # Main home screen
├── widgets/
│   ├── custom_button.dart       # Reusable button component
│   ├── page_indicator.dart      # Page indicator dots
│   ├── intro_page_widget.dart   # Individual intro page widget
│   └── status_bar.dart          # Custom status bar widget
└── main.dart                    # App entry point
```

## Design Specifications

### Color Palette
- **Primary Blue**: `#084DA6` - Used for main backgrounds, buttons, and titles
- **Light Blue**: `#E6EDF6` - Used for text on primary blue, intro screen backgrounds
- **Text Gray**: `#757E8A` - Used for subtitles and secondary text
- **White**: `#FFFFFF` - Used for button text

### Screens

#### 1. Splash Screen
- Background: `#084DA6`
- Text color: `#E6EDF6`
- Displays QUICK WASH branding
- Auto-navigates to intro screens after 3 seconds

#### 2. Intro Screens (3 pages)
- Background: `#E6EDF6`
- Title color: `#084DA6`
- Subtitle color: `#757E8A`
- Images: `introimg1.png`, `introimg2.png`, `introimg3.png`
- Features:
  - Page indicators
  - Skip button (pages 1-2)
  - Next button (pages 1-2)
  - Get In Now button (page 3)

## Features

✅ Pixel-perfect UI implementation
✅ Fully responsive design (mobile & tablet)
✅ Reusable widget components
✅ Clean code architecture
✅ Smooth page transitions
✅ Material Design 3

## Running the Application

1. **Install dependencies**:
   ```bash
   flutter pub get
   ```

2. **Run the app**:
   ```bash
   flutter run
   ```

3. **Build for release**:
   ```bash
   flutter build apk --release  # For Android
   flutter build ios --release  # For iOS
   ```

## Assets

Make sure the following images are placed in `assets/images/`:
- `introimg1.png`
- `introimg2.png`
- `introimg3.png`

## Components

### Reusable Widgets

1. **CustomButton**
   - Supports primary and secondary styles
   - Customizable width, height, and border radius
   - Used across intro screens

2. **PageIndicator**
   - Shows current page position
   - Animated active/inactive states

3. **IntroPageWidget**
   - Displays image, title, and subtitle
   - Responsive layout
   - Error handling for missing images

## Development Notes

- Uses Material 3 design system
- Status bar is transparent
- Safe area handling for all screens
- Proper navigation flow with MaterialPageRoute
- Timer-based auto-navigation on splash screen

## Responsive Design

The app is fully responsive and adapts to:
- Mobile phones (portrait & landscape)
- Tablets
- Different screen densities

All spacing, typography, and component sizes follow the Figma design specifications precisely.
