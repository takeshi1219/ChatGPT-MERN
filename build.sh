#!/bin/bash

# Build script for Render.com deployment
echo "🚀 Starting build process..."

# Build the frontend
echo "📦 Building frontend..."
cd client
npm install
npm run build

# Copy build to server dist folder
echo "📁 Copying build files to server..."
mkdir -p ../server/dist
cp -r dist/* ../server/dist/

# Install server dependencies
echo "📦 Installing server dependencies..."
cd ../server
npm install

echo "✅ Build complete!"

