FROM node:18-alpine AS base

# Install dependencies only when needed
FROM base AS deps
WORKDIR /app

# Install dependencies based on the preferred package manager
COPY package.json package-lock.json* ./
RUN npm ci

# Rebuild the source code only when needed
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# Environment variables must be present at build time
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

RUN npm run build

# Production image, copy all the files and run next
FROM base AS runner
WORKDIR /app

ENV NODE_ENV=production

# Don't run production as root
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 remixjs
USER remixjs

# Copy only necessary files
COPY --from=builder --chown=remixjs:nodejs /app/public ./public
COPY --from=builder --chown=remixjs:nodejs /app/build ./build
COPY --from=builder --chown=remixjs:nodejs /app/package.json ./package.json

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
