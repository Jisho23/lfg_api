# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mario = User.create(username: 'Mario', password: 'itsame', status: "It's a-me!", image: 'https://supermariorun.com/assets/img/stage/mario03.png')
wario = User.create(username: 'Wario', password: 'war', status: 'Warhaha!', image: 'https://www.mariowiki.com/images/thumb/3/3c/Wario_MP100.png/250px-Wario_MP100.png')
waluigi = User.create(username: 'Waluigi', password: 'waa', status: 'Wahahaha!', image: 'http://i0.kym-cdn.com/entries/icons/original/000/015/111/Mario_Party_-_Island_Tour_Waluigi_Artwork.png')
jaina = User.create(username: 'Jaina', password: 'frostbolt', status: 'Amazing!',image: 'http://vignette1.wikia.nocookie.net/wowwiki/images/a/aa/Jaina_Proudmoore_%28New%29.jpg/revision/latest?cb=20130315233213')

wow = Game.create(name: "World of Warcraft", platform: 'PC', image: 'https://us.battle.net/forums/static/images/game-logos/game-logo-wow.png' )
mariokart = Game.create(name: 'Mario Kart 8',  platform: 'Switch', image: 'https://assets.ign.com/thumbs/2012/03/20/080RedShell_1280w.jpg')
lol = Game.create(name: 'League of Legends', platform: 'PC', image: 'https://i.ytimg.com/vi/BGtROJeMPeE/maxresdefault.jpg')
destiny = Game.create(name: 'Destiny 2', platform: 'PC', image: 'https://cdn3.dualshockers.com/wp-content/uploads/2017/12/destiny-22.png')
pubg = Game.create(name: "Player Unknown's BattleGrounds", platform: 'PC', image: 'https://i.ytimg.com/vi/SjKKbFe61GQ/maxresdefault.jpg')
overwtch = Game.create(name: 'Overwatch', platform: 'PC, PS4, XboxOne', image: 'https://d3hmvhl7ru3t12.cloudfront.net/img/share/heroes-c08aa560b2f9c15ffaaa5f81446e8902734065ba71b1251af24e150857bc2f8d57bea402102296978eacde2577a33bafe813511f382c330356ce33f4204405ed.jpg')

wario.games << mariokart
mario.games << mariokart
waluigi.games << mariokart
jaina.games << wow

newGroup = Group.create(owner: mario, game: mariokart)

Invite.create(group: newGroup, sender: mario, recipient: wario, accept: true)
Invite.create(group: newGroup, sender: mario, recipient: waluigi, accept: true)
Invite.create(group: newGroup, sender: mario, recipient: jaina)
