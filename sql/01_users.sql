CREATE TABLE IF NOT EXISTS public.users (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  email VARCHAR(255) NOT NULL UNIQUE,
  username VARCHAR(255) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  email_verify BOOLEAN NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS public.roles (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS public.user_roles (
  user_id INT NOT NULL REFERENCES public.users(id),
  role_id INT NOT NULL REFERENCES public.roles(id),
  PRIMARY KEY (user_id, role_id)
);

CREATE INDEX IF NOT EXISTS pk_id_user ON public.users(id)
CREATE INDEX IF NOT EXISTS idx_email_user ON public.users(email)
CREATE INDEX IF NOT EXISTS idx_username_user ON public.users(username)
CREATE INDEX IF NOT EXISTS pk_id_role ON public.roles(id)
CREATE INDEX IF NOT EXISTS idx_name_role ON public.roles(name)
CREATE INDEX IF NOT EXISTS fk_user_role_user_id ON public.user_roles(user_id)
CREATE INDEX IF NOT EXISTS fk_user_role_role_id ON public.user_roles(user_id)
