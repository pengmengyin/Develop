<template>
	<view class="userdetail">
		<view class="title">
			<h1 style="font-size: 50rpx; font-weight: 600; line-height: 80rpx;">{{title}}</h1>
		</view>
		<view class="info-box">
			<view class="left">
				<view class="head">
					<image class="img" :src="headimg"></image>
				</view>
				<view class="infowipper">
					<view>
						<span class="name">心中有你最漂亮</span>
						<span class="item">~每天看一点，进步一大点~</span>
					</view>
				</view>
			</view>
			<view class="right">
				<button class="anu">订阅</button>
			</view>
		</view>
		<view class="content">
			<p style="padding-bottom: 20rpx;">{{head}}</p>
			<image :src="img"></image>
			<p>{{buttom}}</p>
		</view>
		<view class="statement">
			{{state}}
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				title:"",
				headimg:'',
				id:"",
				head: '',
				img: '',
				buttom: '',
				state:'声明：该文观点仅代表作者本人，搜狐号系信息发布平台，搜狐仅提供信息存储空间服务。'
			}
		},
		onLoad: function(res) {
			console.log(res.id)
			this.id=res.id
			this.getData()
		},
		methods:{
			getData() {
				uni.request({					
					url: "http://localhost:8088/index/news",
					
					//服务器
					// url:"http://101.201.118.42:8080/index/news",
					method: 'GET',
					header: {
						'custom-header': 'application/json' //自定义请求头信息
					},
					data: {
						id:this.id
					},
					success: (res) => {
						console.log(res)
						this.head=res.data.search.top
						this.title=res.data.search.title
						this.headimg=res.data.search.headimg
						this.img=res.data.search.img
						this.buttom=res.data.search.buttom
					},
					fail(res) {
						console.log(res)
					}
				})
			}
		}
	}
</script>

<style scoped lang="scss">
	.userdetail {
		background-color: white;
		padding: 0 24rpx;

		>view:nth-child(1) {
			display: flex;
			font-size: 22rpx;
			line-height: 60rpx;
		}

		.info-box {
			width: 100%;
			padding: 34rpx 18rpx;
			.left {
				width: 100%;
				.head {
					float: left;
					width: 100rpx;
					height: 100rpx;
					border: 1px solid black;
					overflow: hidden;
					border-radius: 50%;
					display: inline-block;

					.img {
						width: 100%;
						height: 100%;
					}
				}
				.infowipper {
					width: 60%;
					padding-left: 15rpx;
					float: left;
					padding-top: 10rpx;

					.name {
						font-size: 25rpx;
						color: #8C939D;
						text-align: left;
						overflow: hidden;
						font-weight: 800;
					}

					.item {
						font-size: 20rpx;
						float: left;
						color: #a4a4a4;
						text-align: left;
						
					}
				}
			}
		}
		.anu{
			font-size: 20rpx;
			text-align: center;
			margin-top: 18rpx;
		}
		.content {
			width: 100%;
			padding-top: 30rpx;
			line-height: 62rpx;
			font-size: 30rpx;
		}
		.content image{
			width: 100%;
		}
		.statement{
			font-size: 24rpx;
			color: #A5A4A4;
			line-height: 40rpx;
			text-align: justify;
			margin-top: 40rpx;
			margin-bottom: 20rpx;
		}
	}
</style>
