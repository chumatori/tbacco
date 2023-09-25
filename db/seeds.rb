#require 'faker'
# Comment.delete_all
# Article.delete_all
# User.delete_all

User.create(name:"Mary", email:"mary@test.test", password:"123")
User.create(name:"John", email:"john@test.test", password:"123")
User.create(name:"Marthin", email:"marthin@test.test", password:"123")
User.create(name:"Anthony", email:"anthony@test.test", password:"123")
User.create(name:"Mila", email:"mila@test.test", password:"123")


Article.create(id:1, header:"Lo Mein", body:"Lo mein is a super popular noodle dish that you’ll find both at restaurants and made at home. In Cantonese, lo mein means “mixed noodles”. In Mandarin, it’s pronounced “lao mian” and translates exactly the same. Essentially, it’s egg noodles mixed with sauce – somewhat similar to chow mein, but not quite.", user_id:1)
Article.create(id:2, header:"Green Goddess Salad", body:"This salad has been all over my Tiktok. Green goddess salad isn’t anything new, but this version does it with a twist and it’s pretty amazing. If you have any resolutions this year to eat healthier or go vegan-lite or full on vegan, this salad should be in your back pocket.", user_id:2)
Article.create(id:3, header:"Taco Chili", body:"If you love the flavors of tacos and the cozy spoonability of chili, you are going to fall in love with taco chili. This taco chili recipe is incredibly easy to make and the flavor pay off is huge. Taco chili is perfect for a quick weeknight dinner, a weekend lunch, and is always a winner during game day party season. Taco chili is what would happen if tortilla soup and chili had a baby. All the flavors of taco soup with the heartiness of chili. It’s truly one of our go-to meals.", user_id:3)
Article.create(id:4, header:"Cheesy Potatoes", body:"If you love potatoes and cheese, this is the ultimate potato casserole. It’s perfect for serving with ham, chicken, pork, or beef. Heck, I even eat it just on its own without a protein. It’s warming, filling, and the best comfort food side dish there is – hearty and homey but delicious enough to serve to company.", user_id:4)
Article.create(id:5, header:"Huevos Rancheros", body:"Huevos rancheros might be the most ultimate breakfast out there. Fried eggs, warm crispy tortillas, refried beans, and salsa come together in a beautiful medley of flavors and textures. So satisfying and truly the best way to start the day. Like most beloved breakfasts, there are many, many ways to make huevos rancheros and every family has their own way. That being said, all huevos rancheros plates include: sunny side up eggs, salsa, and tortillas. This iteration is our ultimate huevos rancheros and it’s absolutely one of my all time favorite breakfasts. Making huevos rancheros from scratch is one of the most satisfying breakfasts you can make, and it’s so easy, whether you use fresh made or store bought salsa.", user_id:5)