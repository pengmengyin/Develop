<template>
	<view class="content">
		<Header></Header>
		<!-- <view class="phone" v-for="(item,index) in goodsList" :key='index'> -->
		<view class="content" v-if="pingyin.length">
			<view class="phone">
				<image :src="img" style="width: 750rpx;"></image>
				<!-- <image :src="item.name"></image> -->
			</view>
			<!-- 标题 -->
			
			<view class="Titile">
				<view class="Titile-title">
					<view class="pingyin">
						<view class="text">{{pingyin}}</view>
					</view>
					<view class="text">
						<view>({{name}})</view>
						<!-- <view>(岩石种类)</view> -->
					</view>
				</view>
				<view class="summary">
					<view>{{summary}}</view>
				</view>
			</view>
			
			<!-- 简介 -->
			<view class="papr-title">
				<view style="padding-bottom: 20rpx;">
					<!-- <text style="font-size: 35rpx; font-weight: 600;">简介</text> -->
					<text style="font-size: 35rpx; font-weight: 600;">药用价值</text>
				</view>
				<view>{{introduce}}</view>
			</view>
			
			<!-- 成分构造 -->
			<view class="papr-title">
				<view style="padding-bottom: 20rpx;">
					<!-- <text style="font-size: 35rpx; font-weight: 600;">成分结构与构造</text> -->
					<text style="font-size: 35rpx; font-weight: 600;">产地环境</text>
				</view>
				<view class="para">
					<view style="padding-bottom: 20rpx;">{{component}}</view>
					<view>{{structure}}</view>
				</view>
			</view>
		</view>
		<view v-else>
			<h1>暂无数据...</h1>
		</view>
	</view>
</template>

<script>
	import Header from "@/components/search/Header.vue"
	import http from '@/common/api/request.js'
	export default {
		data() {
			return {
				searchName: '',
				goodsList: [],
				pingyin: '',
				name: "",
				summary: '',
				img: '',
				introduce: '',
				component: '',
				structure: '',
			};
		},
		components: {
			Header
		},
		onLoad: function(option) {
			this.searchName = option.key
			// console.log(this.searchName)
			this.getData()
		},
		methods: {			
			getData() { 
				uni.request({					
					url: "http://localhost:8088/api/search",
					// url:"http://101.201.118.42:8080/api/search",
					method: 'GET',
					header: {
						'custom-header': 'application/json' //自定义请求头信息
					},
					data: {
						searchName: this.searchName
					},
					success: (res) => {
						console.log(res)
						this.goodsList = res.data.search
						this.pingyin = this.goodsList.pingyin
						this.name = this.goodsList.name
						this.summary = this.goodsList.summary
						this.img = this.goodsList.img
						this.introduce = this.goodsList.introduce
						this.component = this.goodsList.component
						this.structure = this.goodsList.structure
					},
					fail(res) {
						console.log(res)
					}
				})
			}
		},
	}
</script>

<style>
	.content {
		width: 100%;
		height: 100%;
	}

	.content .phone {
		width: 100%;
		padding-top: 30rpx;
	}

	.content .Titile {
		padding-top: 40rpx;
	}

	.content .Titile .summary {
		margin-top: 40rpx;
		font-size: 32rpx;
		padding-left: 20rpx;
	}

	.content .Titile .text {
		padding-left: 20rpx;
		font-size: 30rpx;
		font-weight: 700;
	}

	.content .papr-title {
		padding-top: 50rpx;
		margin-left: 20rpx;
		font-size: 32rpx;
	}
</style>
