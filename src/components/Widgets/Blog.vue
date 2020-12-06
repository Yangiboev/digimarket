<template>
	<div class="emb-blog-wrap section-gap title-gap">
		<v-container grid-list-xl>
			<div class="sec-title text-xl-center mb-60">
				<h2>{{secTitle}}</h2>
			</div>
			<v-layout row wrap>
				<v-flex
					xs12 sm12 md4 lg4 xl4
					v-for="blog in data"
					:key="blog.id"
				>
					<div class="emb-card">
						<div class="thumb-wrap">
							<router-link :to="'/blog-detail/'+blog.id">
								<img	alt="latest from blog" :src="blog.image"
									width="460"
									height="310"
								>
							</router-link>
							<v-btn class="accent" :to="'/blog-detail/'+blog.id" icon absolute bottom>
								<v-icon>link</v-icon>
							</v-btn>
						</div>
						<div class="emb-card-content pa-6">
							<h5  class="font-weight-medium mb-4 pt-2">
								<router-link :to="'/blog-detail/'+blog.id">{{blog.name}}</router-link>
							</h5>
							<div class="emb-meta-info">
								<div class="inline-block">
									<p class="font-weight-regular" v-text="blog.short_content"></p>
									<div class="meta-tags">
										<p class="mr-4 mb-0 d-inline-block">
											<a href="javascript:void(0)">
												<v-icon>person</v-icon>
												{{blog.author.author_name}}
											</a>
										</p>
										<p class="d-inline-block mb-0 ">
											<a href="javascript:void(0)">
												<v-icon>calendar_today</v-icon>
												{{blog.author.post_date}}
											</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</v-flex>
			</v-layout>
		</v-container>
	</div>
</template>

<script>
export default {
  props: ["data", "secTitle"]
};
</script>



