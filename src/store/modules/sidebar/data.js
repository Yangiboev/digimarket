/* eslint-disable */
// Sidebar Routers
export const menus = [
   {
      path: '/products',
      name:"message.products",
      icon: 'party_mode',
      children: null
   },
   {
      path: '',
      name:"message.categories",
      icon: 'party_mode',
      type: 'mega_menu',
      children: {
         'message.men': [
            {
               path: 'T-shirt',
               children_menus:null,
               name: 'message.tShirt'
            },
            {
               path: 'Shirt',
               children_menus:null,
               name: 'message.shirt'
            },
            {
               path: 'Jeans',
               children_menus:null,
               name: 'message.jean'
            },
            {
               path: 'Jackets',
               children_menus:null,
               name: 'message.jackets'
            },
         ],
         'message.gadgets': [
            {
               path: 'Headphone',
               children_menus:null,
               name: 'message.headphone'
            },
            {
               path: 'Smartphone',
               children_menus:null,
               name: 'message.smartphone'
            },
            {
               path: 'Watch',
               children_menus:null,
               name: 'message.watch'
            },
            {
               path: 'Speaker',
               children_menus:null,
               name: 'message.speaker'
            },
         ],
         'message.accessories': [
            {
					path: 'Laptop',
					children_menus:null,
               name: 'message.laptopAccessories'
            },
            {
               path: 'Belts',
               children_menus:null,
               name: 'message.belts'
            },
            {
               path: 'Jewellery',
               children_menus:null,
               name: 'message.jewellery'
            },
            {
               path: 'Purse',
               children_menus:null,
               name: 'message.purse'
            }
         ],
         'message.women': [
            {
               path: 'Dresses',
               children_menus:null,
               name: 'message.dresses'
            },
            {
               path: 'Jean',
               children_menus:null,
               name: 'message.jean'
            },
            {
               path: 'Shirt',
               children_menus:null,
               name: 'message.shirt'
            },
            {
               path: 'Jackets',
               children_menus:null,
               name: 'message.jackets'
            },
         ]
      }
   },
   {
      path: '/contact',
      name:"message.contactUs",
      icon: 'perm_contact_calendar',
      children: null
   }
]
