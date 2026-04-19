# --- Build Stage ---
FROM node:24-slim AS build

# Install pnpm for efficient dependency management
RUN npm install -g pnpm@10.33.0

WORKDIR /app

# Copy dependency manifest files
COPY pnpm-lock.yaml package.json ./

# Install dependencies with frozen lockfile for consistent builds
RUN pnpm install --frozen-lockfile

# Copy the rest of the application source
COPY . .

# Build the Nuxt application for production
# This generates the .output directory which contains the standalone server
RUN pnpm run build

# --- Production Stage ---
FROM node:24-slim AS runner

WORKDIR /app

# Set production environment
ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=3000

# Copy the build output from the build stage
# We only need the .output folder to run the app
COPY --from=build /app/.output ./.output

# Expose the port Nuxt runs on
EXPOSE 3000

# Start the application using Node.js
# Nuxt/Nitro produces an entry point at .output/server/index.mjs
CMD ["node", ".output/server/index.mjs"]
