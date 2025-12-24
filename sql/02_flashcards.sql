CREATE TABLE IF NOT EXISTS public.flashcards (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  deck_id INT NOT NULL REFERENCES public.decks(id),
  front_content TEXT,
  back_content TEXT,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS public.decks (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(255),
  description TEXT,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS public.deck_ownership (
  user_id INT NOT NULL REFERENCES public.users(id),
  deck_id INT NOT NULL REFERENCES public.decks(id),
  PRIMARY KEY (user_id, deck_id)
)

CREATE TABLE IF NOT EXISTS public.deck_subscription (
  user_id INT NOT NULL REFERENCES public.users(id),
  deck_id INT NOT NULL REFERENCES public.decks(id),
  PRIMARY KEY (user_id, deck_id)
)

CREATE TABLE IF NOT EXISTS public.boxes (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  user_id INT NOT NULL REFERENCES public.users(id),
  max_level SMALLINT NOT NULL,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS public.reviews (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  card_id INT NOT NULL REFERENCES public.flashcards(id),
  box_id INT NOT NULL REFERENCES public.boxes(id),
  current_level SMALLINT NOT NULL,
  review_date DATE NOT NULL,
  valid BOOLEAN,
  created_at TIMESTAMP NOT NULL,
  updated_at TIMESTAMP NOT NULL
)

CREATE INDEX IF NOT EXISTS pk_id_flashcard ON public.flashcards(id)
CREATE INDEX IF NOT EXISTS fk_deck_id_deck ON public.flashcards(deck_id)
CREATE INDEX IF NOT EXISTS pk_id_deck ON public.decks(id)
CREATE INDEX IF NOT EXISTS idx_name_deck ON public.decks(name)
CREATE INDEX IF NOT EXISTS fk_user_id_deck_ownership ON public.deck_ownership(user_id)
CREATE INDEX IF NOT EXISTS fk_deck_id_deck_ownership ON public.deck_ownership(deck_id)
CREATE INDEX IF NOT EXISTS fk_user_id_deck_subscription ON public.deck_subscription(user_id)
CREATE INDEX IF NOT EXISTS fk_deck_id_deck_subscription ON public.deck_subscription(deck_id)
CREATE INDEX IF NOT EXISTS pk_id_box ON public.boxes(id)
CREATE INDEX IF NOT EXISTS fk_user_id_box ON public.boxes(user_id)
CREATE INDEX IF NOT EXISTS pk_id_review ON public.reviews(id)
CREATE INDEX IF NOT EXISTS fk_card_id_review ON public.reviews(card_id)
CREATE INDEX IF NOT EXISTS fk_box_id_review ON public.reviews(box_id)
CREATE INDEX IF NOT EXISTS idx_review_date_review ON public.reviews(review_date)
