<template>
	<view class="content">
		<view class="outside">
			<view class="scene" v-for="(iteam,index) in stone" :key='index' @click="goSearchList(iteam.name)">
				<image :src="iteam.src"></image>
				<text class="introduce">{{iteam.name}}</text>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				stone: {},
			}
		},
		onLoad: function(res) {
			this.getdata()
		},
		methods: {
			getdata() {
				uni.request({
					url: "http://localhost:8088/index/stone",
					// url:"http://101.201.118.42:8080/index/stone",
					method: 'GET',
					header: {
						'custom-header': 'application/json' //自定义请求头信息
					},
					success: (res) => {
						console.log(res.data)
						let list=[];
						res.data.forEach(function(item,index){		
							list.push({
								name:item.search.name,
								src:item.search.src
							});			
						});
						this.stone=list
						console.log(this.stone)
					},
					fail(res) {
						console.log(res)
					}
				})
			},
			goSearchList(item){
				console.log(item)
				uni.navigateTo({
					url:"../../pages/search/Search-list?key="+item,
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
