<template>
	<div class="">
		<v-container>
			<div class="footer-bottom">
				<v-layout row wrap>
					<v-flex xs12 sm3 md6 lg6 xl2>
						<div class="abt-menu">
							<ul class="list-unstyled pl-0">
								<li v-for="(list,key) in about"
									:key="key">
									<router-link :to="list.path">{{$t(list.menuItem)}}</router-link>
								</li>
							</ul>
						</div>
					</v-flex>
					<v-flex xs12 sm3 md6 lg6 xl2>
						<div class="features-menu">
							<ul class="list-unstyled pl-0">
								<li 
									v-for="(list,key) in session"
									:key="key"
								>
									<router-link :to="list.path">{{$t(list.menuItem)}}</router-link>
								</li>		
							</ul>
						</div>
					</v-flex>
				</v-layout>
			</div>
		</v-container>
	</div>
</template>

<script>
import AppConfig from "Constants/AppConfig";

export default {
	props:['title','description','img'],
	data () {
		return{
			about:[
				{
					menuItem:"message.about",
					path:"/about"
				}
			],
			session:[
				{
					menuItem:"message.signIn",
					path:"/session/signin"
				},
			],
			copyrightText: AppConfig.copyrightText
		}
	}
}
</script>

