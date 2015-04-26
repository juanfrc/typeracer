
Quote.create(text:"Imagination is more important than knowledge. For knowledge is limited, whereas imagination embraces the entire world, stimulating progress, giving birth to evolution.", author:"Albert Einstein")
Quote.create(text:"I, at any rate, am convinced that He (God) does not throw dice.", author:"Albert Einstein")
Quote.create(text:"The important thing is not to stop questioning; curiosity has its own reason for existing.", author:"Albert Einstein")
Quote.create(text:"Science without religion is lame, religion without science is blind.", author:"Albert Einstein")
Quote.create(text:"Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.", author:"Albert Einstein")
Quote.create(text:"Falling in love is not at all the most stupid thing that people do — but gravitation cannot be held responsible for it.", author:"Albert Einstein")
Quote.create(text:"The most beautiful experience we can have is the mysterious. It is the fundamental emotion that stands at the cradle of true art and true science.", author:"Albert Einstein")
Quote.create(text:"Anyone who has never made a mistake has never tried anything new.", author:"Albert Einstein")
Quote.create(text:"Try not to become a man of success, but rather try to become a man of value.", author:"Albert Einstein")
Quote.create(text:"The secret to creativity is knowing how to hide your sources.", author:"Albert Einstein")
Quote.create(text:"The difference between genius and stupidity is that genius has its limits.", author:"Albert Einstein")
Quote.create(text:"Weakness of attitude becomes weakness of character.", author:"Albert Einstein")
Quote.create(text:"Pure mathematics is, in its way, the poetry of logical ideas.", author:"Albert Einstein")
Quote.create(text:"Nature shows us only the tail of the lion. But I do not doubt that the lion belongs to it even though he cannot at once reveal himself because of his enormous size.", author:"Albert Einstein")
Quote.create(text:"Only a life lived for others is a life worthwhile.", author:"Albert Einstein")
Quote.create(text:"Great spirits have always encountered violent opposition from mediocre minds. The mediocre mind is incapable of understanding the man who refuses to bow blindly to conventional prejudices and chooses instead to express his opinions courageously and honestly.", author:"Albert Einstein")
Quote.create(text:"It's not that I'm so smart, it's just that I stay with problems longer.", author:"Albert Einstein")
Quote.create(text:"My religion consists of a humble admiration of the illimitable superior spirit who reveals himself in the slight details we are able to perceive with our frail and feeble mind.", author:"Albert Einstein")
Quote.create(text:"Peace cannot be kept by force. It can only be achieved by understanding.", author:"Albert Einstein")
Quote.create(text:"I never think of the future. It comes soon enough.", author:"Albert Einstein")
Quote.create(text:"Do not worry about your difficulties in mathematics, I can assure you that mine are all greater.", author:"Albert Einstein")
Quote.create(text:"In order to form an immaculate member of a flock of sheep one must, above all, be a sheep.", author:"Albert Einstein")
Quote.create(text:"The most incomprehensible thing about the world is that it is comprehensible.", author:"Albert Einstein")
Quote.create(text:"Reality is merely an illusion, albeit a very persistent one.", author:"Albert Einstein")
Quote.create(text:"Truth is what stands the test of experience.", author:"Albert Einstein")
Quote.create(text:"Life is like riding a bicycle. To keep your balance you must keep moving.", author:"Albert Einstein")
Quote.create(text:"Insanity: doing the same thing over and over again and expecting different results.", author:"Albert Einstein")
Quote.create(text:"Human knowledge and skills alone cannot lead humanity to a happy and dignified life. Humanity has every reason to place the proclaimers of high moral standards and values above the discoverers of objective truth.",  author:"Albert Einstein")
Quote.create(text:"Few people are capable of expressing with equanimity opinions which differ from the prejudices of their social environment. Most people are even incapable of forming such opinions.", author:"Albert Einstein")
Quote.create(text:"Common sense is nothing more than a deposit of prejudices laid down by the mind before you reach eighteen.", author:"Albert Einstein")

count = 0 
15.times do
  count += 1
  User.create(name: Faker::Name.name, image:Faker::Avatar.image)
  25.times do
  	Score.create(point: rand(1..20), user_id: count)
  end
end
