# Pulse - Quick Setup Guide

This guide will help your team get Pulse running locally in minutes.

## Prerequisites

- **Node.js** (v18 or higher) - [Download](https://nodejs.org/)
- **Git** - [Download](https://git-scm.com/)
- **Supabase Database** - You'll need the database connection string

## Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/King-Angelo/Pulse.git
cd Pulse
```

### 2. Backend Setup

```bash
cd Backend

# Install dependencies
npm install

# Create environment file
cp env.template .env

# Edit .env with your Supabase database URL
# You need to set:
# - DATABASE_URL (from Supabase: Settings > Database > Connection string > URI)
# - JWT_SECRET (any random string, e.g., use: openssl rand -base64 32)
# - FRONTEND_URL=http://localhost:3000

# Generate Prisma client
npm run prisma:generate

# Run database migrations (applies RLS and schema)
npm run prisma:migrate:deploy

# Start the backend server
npm run dev
```

The backend will run on `http://localhost:5000`

### 3. Frontend Setup

Open a **new terminal window**:

```bash
cd Frontend

# Install dependencies
npm install

# (Optional) Create .env file if you need custom API URL
# echo "VITE_API_URL=http://localhost:5000" > .env

# Start the frontend server
npm run dev
```

The frontend will run on `http://localhost:3000` and automatically open in your browser.

## That's It! 🎉

Pulse should now be running:
- **Frontend**: http://localhost:3000
- **Backend API**: http://localhost:5000
- **Health Check**: http://localhost:5000/health

## First Time Setup

1. **Register a new account** on the login page
2. **Login** with your credentials
3. Start managing projects and teams!

## Troubleshooting

### Backend won't start
- Check that your `.env` file has the correct `DATABASE_URL`
- Make sure the Supabase database is accessible
- Verify migrations ran successfully: `npm run prisma:migrate:deploy`

### Frontend can't connect to backend
- Ensure backend is running on port 5000
- Check browser console for errors
- Verify `VITE_API_URL` in frontend `.env` (or it defaults to `http://localhost:5000`)

### Database connection errors
- Verify your Supabase `DATABASE_URL` is correct
- Check that RLS policies are applied (they should be from the migration)
- Ensure you're using the **service_role** connection string for the backend

## Environment Variables Reference

### Backend (.env)
```env
PORT=5000
NODE_ENV=development
FRONTEND_URL=http://localhost:3000
DATABASE_URL=postgresql://postgres:[YOUR-PASSWORD]@[YOUR-PROJECT].supabase.co:5432/postgres?schema=public
JWT_SECRET=your-super-secret-jwt-key-change-in-production
JWT_EXPIRE=7d
BCRYPT_ROUNDS=10
```

### Frontend (.env) - Optional
```env
VITE_API_URL=http://localhost:5000
```

## Need Help?

- Check the individual README files:
  - `Backend/README.md` - Backend-specific documentation
  - `Frontend/README.md` - Frontend-specific documentation

