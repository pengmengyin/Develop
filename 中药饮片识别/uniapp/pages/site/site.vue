<template>
	<view class="content">
		<view class="outside">
			<view class="scene" v-for="(item,index) in scene" :key="index" @click="goSearchList(item.id)">
				<image :src="item.src" ></image>
				<text class="introduce">{{item.name}}</text>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				scene: {},
			}
		},
		onLoad: function(res) {
			this.getdata()
		},
		methods: {
			getdata() {
				uni.request({
					url: "http://localhost:8088/index/scene",
					// url:"http://101.201.118.42:8080/index/scene",
					method: 'GET',
					header: {
						'custom-header': 'application/json' //自定义请求头信息
					},
					success: (res) => {
						console.log(res.data)
						let list = [];
						res.data.forEach(function(item, index) {
							list.push({
								id:item.search.id,
								name: item.search.name,
								src: item.search.url
							});
						});
						this.scene = list
						console.log(this.scene)
					},
					fail(res) {
						console.log(res)
					}
				})
			},
			goSearchList(item){
				console.log(item)
				uni.navigateTo({
					url:"../../pages/site/scene?key="+item,
				})
			}
		}
	}
</script>

<style lang="scss">
	.content {
		width: 750rpx;

		.outside {
			background-color: #F0FFFF;

			.scene {
				margin: 0px auto;
				width: 700rpx;
				height: 460rpx;
				background-color: #FFFFFF;

				image {
					width: 100%;
					height: 80%;
				}

				text-align: center;
				font-size: 14px;
				color: #C0C0C0;
			}
		}
	}
</style>
