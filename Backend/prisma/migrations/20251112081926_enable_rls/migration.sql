-- Enable Row Level Security on all public tables

-- Enable RLS on users table
ALTER TABLE "users" ENABLE ROW LEVEL SECURITY;

-- Enable RLS on team_members table
ALTER TABLE "team_members" ENABLE ROW LEVEL SECURITY;

-- Enable RLS on projects table
ALTER TABLE "projects" ENABLE ROW LEVEL SECURITY;

-- Enable RLS on columns table
ALTER TABLE "columns" ENABLE ROW LEVEL SECURITY;

-- Enable RLS on tasks table
ALTER TABLE "tasks" ENABLE ROW LEVEL SECURITY;

-- Enable RLS on activities table
ALTER TABLE "activities" ENABLE ROW LEVEL SECURITY;

-- Enable RLS on _prisma_migrations table (internal Prisma table)
ALTER TABLE "_prisma_migrations" ENABLE ROW LEVEL SECURITY;

-- Create policies for service_role (backend API access)
-- Service role can access everything for backend operations

-- Users policies
CREATE POLICY "service_role_all_access_users" ON "users"
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Team members policies
CREATE POLICY "service_role_all_access_team_members" ON "team_members"
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Projects policies
CREATE POLICY "service_role_all_access_projects" ON "projects"
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Columns policies
CREATE POLICY "service_role_all_access_columns" ON "columns"
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Tasks policies
CREATE POLICY "service_role_all_access_tasks" ON "tasks"
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Activities policies
CREATE POLICY "service_role_all_access_activities" ON "activities"
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- _prisma_migrations policies (only service_role can access)
CREATE POLICY "service_role_all_access_prisma_migrations" ON "_prisma_migrations"
  FOR ALL
  TO service_role
  USING (true)
  WITH CHECK (true);

-- Note: Since the backend API uses JWT authentication (not Supabase auth),
-- all database access goes through the service_role connection.
-- The policies below deny direct access to authenticated users for security,
-- ensuring all access must go through the backend API.

-- Deny all access to authenticated users (backend handles auth via JWT)
-- This ensures direct database access is blocked and all requests go through the API

CREATE POLICY "users_deny_authenticated" ON "users"
  FOR ALL
  TO authenticated
  USING (false)
  WITH CHECK (false);

CREATE POLICY "team_members_deny_authenticated" ON "team_members"
  FOR ALL
  TO authenticated
  USING (false)
  WITH CHECK (false);

CREATE POLICY "projects_deny_authenticated" ON "projects"
  FOR ALL
  TO authenticated
  USING (false)
  WITH CHECK (false);

CREATE POLICY "columns_deny_authenticated" ON "columns"
  FOR ALL
  TO authenticated
  USING (false)
  WITH CHECK (false);

CREATE POLICY "tasks_deny_authenticated" ON "tasks"
  FOR ALL
  TO authenticated
  USING (false)
  WITH CHECK (false);

CREATE POLICY "activities_deny_authenticated" ON "activities"
  FOR ALL
  TO authenticated
  USING (false)
  WITH CHECK (false);

CREATE POLICY "prisma_migrations_deny_authenticated" ON "_prisma_migrations"
  FOR ALL
  TO authenticated
  USING (false)
  WITH CHECK (false);

