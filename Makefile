.PHONY: build watch clean get dev staging prod test

# Generate all code
build:
	@echo "🔨 Building generated files..."
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs

# Watch for changes and rebuild
watch:
	@echo "👀 Watching for changes..."
	dart run build_runner watch --delete-conflicting-outputs

# Clean generated files
clean:
	@echo "🧹 Cleaning..."
	dart run build_runner clean
	flutter clean
	flutter pub get

# Get dependencies
get:
	@echo "📦 Getting dependencies..."
	flutter pub get

# Run development flavor
dev:
	@echo "🚀 Running development..."
	flutter run --flavor development -t lib/main_development.dart

# Run staging flavor
staging:
	@echo "🚀 Running staging..."
	flutter run --flavor staging -t lib/main_staging.dart

# Run production flavor
prod:
	@echo "🚀 Running production..."
	flutter run --flavor production -t lib/main_production.dart

# Run tests
test:
	@echo "🧪 Running tests..."
	flutter test

# Build APK for development
build-dev-apk:
	@echo "📱 Building development APK..."
	flutter build apk --flavor development -t lib/main_development.dart

# Build APK for production
build-prod-apk:
	@echo "📱 Building production APK..."
	flutter build apk --flavor production -t lib/main_production.dart

# Format code
format:
	@echo "✨ Formatting code..."
	dart format lib/ test/

# Analyze code
analyze:
	@echo "🔍 Analyzing code..."
	flutter analyze

# Full clean and rebuild
rebuild:
	@echo "🔄 Full rebuild..."
	make clean
	make get
	make build