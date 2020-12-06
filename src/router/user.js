import UserPanel from 'Container/UserPanel';

const HomeV2 = () => import('Views/HomeV2');
const Accessory = () => import('Views/Accesory');
const Gadget = () => import('Views/Gadget');
const Product = () => import('Views/Product');
// const Payment = () => import('Views/Payment/Payment');
const Cart = () => import('Views/Cart');
const Checkout = () => import('Views/Checkout');
const FinalReceipt = () => import('Views/FinalReceipt');
const ProductDetail = () => import('Views/ProductDetail');
const AboutUs = () => import('Views/AboutUs');
const TermCondiition = () => import('Views/TermsAndCondition');
const Account = () => import('Views/UserAccount/Account.vue');
const OrderHistory = () => import('Views/UserAccount/OrderHistory.vue');
const Profile = () => import('Views/UserAccount/Profile.vue');
const Address = () => import('Views/UserAccount/Address.vue');
const Cards = () => import ('Views/UserAccount/Cards.vue');
const EditProfile = () => import ('Views/UserAccount/EditProfile.vue');
const EditAddress = () => import ('Views/UserAccount/EditAddress.vue');
const EditProfileInfo = () => import ('Views/UserAccount/EditProfileInfo.vue');
// const BlogDetail = () => import('Views/Blogs/BlogDetails');
const ContactUs = () => import('Views/Contact');
const PrivacyPolicy = () => import('Views/PrivacyPolicy');
const Register = () => import('Views/Sessions/Register');
const ForgotPassword = () => import('Views/Sessions/ForgotPassword');
const ThankYou = () => import('Views/Sessions/ThankYou');
const SignIn = () => import('Views/Sessions/SignIn');


export default {
	path: '/',
	component: UserPanel,
	redirect:'/home',
	children:[
		{ 
			path: '/home',
			component: HomeV2 ,
			meta: {
				header: 2
			}
		},
		{
			path: '/products/accessories',
			component: Accessory 
		},
		{ 
			path: '/gadget',
			component: Gadget 
		},
		{			
			path: '/products/:title',
			component: Product,
			name: 'Products'
		},
		{			
			path: '/products',
			component: Product,
			name: 'Fashion'
		},
		{ 
			path: '/cart',
			component: Cart,
		},
		{ 
			path: '/checkout',
			component: Checkout  
		},
		{ 
			path: '/products/:title/:id',
			component: ProductDetail, 
			name:'productDetail'
		},
		{ 
			path: '/checkout/final-receipt',  
			component: FinalReceipt, 
			name:'FinalReceipt'
		},
		{ 
			path: '/about',  
			component: AboutUs, 
			name:'about'
		},
		{ 
			path: '/term-condition',  
			component: TermCondiition, 
			name:'term-condition'
		},
		{ 
			path: '/account',  
			component: Account, 
			name:'Account',
			children: [
            {
					path: '/account/order-history',name:'OrderHistory',component: OrderHistory,
				},
				{
					path: '/account/profile',name:'Profile',component: Profile,
				},
				{
					path: '/account/address',name:'Address',component: Address,
				},
				{
					path: '/account/cards',name:'Cards',component: Cards,
				},
				{
					path: '/account/profile/edit',name:'EditProfile',component: EditProfile
				},
				{
					path: '/account/profile/edit',name:'EditAddress',component: EditAddress
				},
				{
					path: '/account/profile/edit',name:'EditProfileInfo',component: EditProfileInfo,
				},
        ]
		},
		{ 
			path: '/contact',  
			component: ContactUs, 
			name:'ContactUs'
		},

		{ 
			path: '/privacy-policy',  
			component: PrivacyPolicy, 
			name:'PrivacyPolicy'
		},
		{ 
			path: '/session/signup',  
			component: Register, 
			name:'Register'
		},
		{ 
			path: '/session/forgot-password',  
			component: ForgotPassword, 
			name:'ForgotPassword'
		},
		{ 
			path: '/session/thank-you',  
			component: ThankYou, 
			name:'ThankYou'
		},
		{ 
			path: '/session/signin',  
			component: SignIn, 
			name:'SignIn'
		}
	]
}