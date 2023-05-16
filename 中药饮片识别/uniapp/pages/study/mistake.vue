<template>
	<view class="content">
		<view class="back">
			<view @click="removeall()" class="btn">清空</view>
		</view>
		<view class="outside">
			<view class="scene" v-for="(item,index) in scene" :key="index" @click="goSearchList(item.name)"
				@longtap="onLongPress(item.uid)">
				<image :src="item.src"></image>
				<text class="introduce">{{item.name}}</text>
			</view>
		</view>
	</view>
</template>

<script>
	import {
		mapState
	} from 'vuex'
	export default {
		data() {
			return {
				scene: {},
			}
		},
		onLoad: function(res) {
			this.getdata()
		},
		computed: {
			...mapState({
				userInfo: state => state.user.userInfo

			})
		},
		methods: {
			getdata() {
				uni.request({
					url: "http://localhost:8088/update/mistake",
					// url:"http://101.201.118.42:8080/update/mistake",//服务器地址
					method: 'GET',
					data: {
						id: this.userInfo.id
					},
					header: {
						'custom-header': 'application/json' //自定义请求头信息
					},
					success: (res) => {
						console.log(res)
						let list = [];
						res.data.forEach(function(item, index) {
							list.push({
								id: item.search.id,
								name: item.search.name,
								src: item.search.url,
								uid: item.search.uid
							});
						});
						this.scene = list
						console.log(this.scene)
						// console.log(this.scene[0].id)
					},
					fail(res) {
						console.log(res)
					}
				})
			},
			goSearchList(item) {
				console.log(item)
				uni.navigateTo({
					url: "../../pages/search/Search-list?key=" + item,
				})
			},
			onLongPress(e) {
				console.log(e)
				uni.showModal({ // 弹框询问是否进行下一步事件
					title: '提示',
					content: '是否删除该错题',
					success: function(res) {
						if (res.confirm) {
							console.log('用户点击确定');
							uni.request({
								url: "http://localhost:8088/update/remove",
								// url:"http://101.201.118.42:8080/update/remove",//服务器地址
								method: 'GET',
								data: {
									id: parseInt(e)
								},
								header: {
									'custom-header': 'application/json' //自定义请求头信息
								},
								success: (res) => {
									console.log(res)
									this.getdata()
								},
								fail(res) {
									console.log(res)
								}
							})

						} else if (res.cancel) {
							console.log('用户点击取消');
							return
						}
					}.bind(this)
				});

			},
			//删除所有
			removeall() {
				uni.showModal({ // 弹框询问是否进行下一步事件
					title: '提示',
					content: '是否全部清空',
					success: function(res) {
						if (res.confirm) {
							console.log('用户点击确定');
							uni.request({
								url: "http://localhost:8088/update/removeall",
								// url:"http://101.201.118.42:8080/update/removeall",//服务器地址
								method: 'GET',
								data: {
									id: this.scene[0].id
								},
								header: {
									'custom-header': 'application/json' //自定义请求头信息
								},
								success: (res) => {
									console.log(res)
									this.getdata()
								},
								fail(res) {
									console.log(res)
								}
							})

						} else if (res.cancel) {
							console.log('用户点击取消');
							return
						}
					}.bind(this)
				});
			}
		}
	}
</script>

<style lang="scss">
	.content {
		width: 750rpx;

		.back {
			width: 750rpx;
			height: 80rpx;
			background-color: #white;
			
			.btn {
				color: #A9A9A9;
				float: right;
				text-align: center;
				margin: 20rpx;
			}
		}

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
