# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

mario = User.create(username: 'Mario', password: 'itsame', image: 'https://supermariorun.com/assets/img/stage/mario03.png')
wario = User.create(username: 'Wario', password: 'war', image: 'https://www.mariowiki.com/images/thumb/3/3c/Wario_MP100.png/250px-Wario_MP100.png')
waluigi = User.create(username: 'Waluigi', password: 'waa', image: 'http://i0.kym-cdn.com/entries/icons/original/000/015/111/Mario_Party_-_Island_Tour_Waluigi_Artwork.png')
jaina = User.create(username: 'Jaina', password: 'frostbolt', image: 'http://vignette1.wikia.nocookie.net/wowwiki/images/a/aa/Jaina_Proudmoore_%28New%29.jpg/revision/latest?cb=20130315233213')

hearthstone = Game.create(name: "Hearthstone", image: 'https://d2q63o9r0h0ohi.cloudfront.net/images/logos/logo-small-914ab388ea8891cdeca192ea4d7c1cd611d05b687de1b8a5f4a25daa01e512d3d83ffe3182654e826da7ddc4d363ae98be0fc9df647d317470ba492a458c7e7f.png' )
mariokart = Game.create(name: 'Mario Kart', image: 'https://assets.ign.com/thumbs/2012/03/20/080RedShell_1280w.jpg')

wario.games << mariokart
mario.games << mariokart
waluigi.games << mariokart
jaina.games << hearthstone

newGroup = Group.create(owner: mario, game: mariokart)

Invite.create(group: newGroup, sender: mario, recipient: wario, accept: true)
Invite.create(group: newGroup, sender: mario, recipient: waluigi, accept: true)
Invite.create(group: newGroup, sender: mario, recipient: jaina)
