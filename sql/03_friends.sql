CREATE TABLE IF NOT EXISTS public.friendship (
  user_id INT NOT NULL REFERENCES public.users(id),
  friend_id INT NOT NULL REFERENCES public.users(id),
  PRIMARY KEY (user_id, friend_id)
);

CREATE TABLE IF NOT EXISTS public.likes (
  user_id INT NOT NULL REFERENCES public.users(id),
  deck_id INT NOT NULL REFERENCES public.decks(id),
  PRIMARY KEY (user_id, deck_id)
)

CREATE INDEX IF NOT EXISTS fk_user_id_friendship ON public.friendship(user_id)
CREATE INDEX IF NOT EXISTS fk_friend_id_friendship ON public.friendship(friend_id)
CREATE INDEX IF NOT EXISTS fk_user_id_like ON public.likes(user_id)
CREATE INDEX IF NOT EXISTS fk_deck_id_like ON public.likes(deck_id)
