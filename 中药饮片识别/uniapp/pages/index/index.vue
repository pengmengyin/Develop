<template>
	<view>
		<view class="content1">
			<!-- 搜索框 -->
			<view class="search-box">
				<view class="search-ico-wapper">
					<image src="../../static/icon/search.png" class="search-ico" mode=""></image>
				</view>
				<input class="search-input" maxlength="10" disabled="disabled" placeholder="请输入关键词进行搜索"
					@click="seachpage" />
				<button class="search-button">搜索</button>
				<view class="phone">
					<image src="../../static/icon/phone.png" class="search-ico" @click="gophone()"></image>
				</view>
			</view>
			<!-- 轮播图 -->
			<swiper class="screen-swiper" :indicator-dots="true" :circular="true" :autoplay="true" interval="5000"
				duration="500">
				<swiper-item v-for="(item,index) in swiperList" :key="index">
					<image :src="item.url" mode="aspectFill" v-if="item.type=='image'"></image>
				</swiper-item>
			</swiper>

			<!-- 导航栏 -->
			<view class="nav">
				<view class="nav_item" v-for="(item,index) in navs" :key="index" @click="navIteamclick(item.path)">
					<view :class="item.icon"></view>
					<text>{{item.title}}</text>
				</view>
			</view>

			<!-- 资讯 -->
			<view class="data">
				<view class="title">
					<text class="first">资讯/News</text>
				</view>
				<view class="zhuyao" v-for="(item,index) in news" :key="index"  @click="newsclick(item.id)">
					<view class="theme">
						<text class="two">{{item.introduce}}</text>
					</view>
					<view class="picture">
						<image :src="item.url"></image>
					</view>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				imgList: [],
				refreshing: false,
				swiperList: [{
					id: 0,
					type: 'image',
					//中药轮播图
					url: '../../static/swiper1/first.webp'
				}, {
					id: 1,
					type: 'image',
					url: '../../static/swiper1/twice.webp',
				}, {
					id: 2,
					type: 'image',
					url: '../../static/swiper1/third.webp'
				}, {
					id: 3,
					type: 'image',
					url: '../../static/swiper1/fourth.webp'
				}],
				navs: [
					// {
					// 	icon: 'iconfont icon-shitou',
					// 	title: '地点',
					// 	path: '/pages/site/site'
					// },
					{
						icon: 'iconfont icon-shitou',
						title: '种植',
						path: '/pages/site/site'
					},
					{
						icon: 'iconfont icon-jingdian',
						title: '种类',
						path: '/pages/kind/kind'
					}
				],
				
				//中药新闻
				news: [{
						id: 0,
						url: "../../static/content1/changyang.jpg",
						introduce: '“长阳”患者加速转阴：新国博方舱医院中药方助力患者出院时间降低2.5天'
					}, {
						id: 1,
						url: "../../static/content1/shanshi.png",
						introduce: '中医药产业发展的未来路径：中药膳食与智慧中医'
					},
					{
						id: 2,
						url: "../../static/content1/huarun.jpg",
						introduce: '“华润三九拟以29亿元入主昆药集团，开启中药行业新一轮整合序幕？'
					},
					{
						id: 3,
						url: "../../static/content1/chengcheng.webp",
						introduce: '打造中药材全产业链模式项目启动会在澄城县成功召开'
					},
				],
			}
		},
		onLoad() {

		},
		onReachBottom() {
			console.log('滑动到页面底部')
		},
		onPullDownRefresh() {
			console.log('下拉刷新')
			this.refreshing = true
		},
		methods: {
			navIteamclick(url) {
				uni.navigateTo({
					url: url
				})
			},
			gophone() {
				uni.navigateTo({
					url: '/pages/phone/camera1'
				})
			},
			seachpage() {
				uni.navigateTo({
					url: '/pages/search/Search'
				})
			},
			newsclick(value){
				uni.navigateTo({
					url:"../../pages/index/news-list?id="+value,
				})
			}
		}
	}
</script>

<style lang="scss">
	.content1 {
		height: 100%;

		swiper {
			width: 750rpx;
			height: 420rpx;

			image {
				height: 100%;
				width: 100%;
			}
		}

		.screen-swiper {
			min-height: 375upx;
		}

		.nav {
			background-color: #F8F8FF;
			display: flex;

			.nav_item {
				width: 50%;
				text-align: center;

				view {
					width: 80rpx;
					height: 80rpx;
					background: #C8C7CC;
					border-radius: 60rpx;
					margin: 10px auto;
					line-height: 90rpx;
					color: #F1F1F1;
					font-size: 40rpx;
				}

				text {
					font-size: 30rpx;
				}
			}
		}

		.data {
			width: 750rpx;
			margin-top: 40rpx;
			background-color: #F8F8FF;

			.first {
				color: #C0C0C0;
			}

			.zhuyao {
				width: 100%;
				height: 100%;
				margin-top: 60rpx;

				.theme {
					margin: 0 auto;
					text-align: center;
					width: 600rpx;
				}

				.two {
					font-size: 35rpx;
					font-weight: 550;
				}

				.picture {
					margin-top: 30rpx;
					width: 750rpx;
					height: 500rpx;

					image {
						width: 100%;
						height: 100%;
					}
				}
			}
		}
	}

	/* 搜索框 */
	.search-ico,
	.search-ico-1 {
		width: 45upx;
		height: 45upx;
	}

	.shadow {
		width: 600rpx;
		height: 60rpx;
		border-radius: 18px;
		box-shadow: 0 0 10px #e6e6e6;
		position: relative;
		left: 60upx;
	}

	.input {
		height: 46rpx;
		width: 350rpx;
		padding-left: 70rpx;
		padding-top: 8rpx;
		font-size: 30rpx;
		color: #ccc;
	}

	.sea {
		position: absolute;
		left: 79%;
		top: 14%;
		height: 46rpx;
		display: flex;
		flex-direction: column;
		justify-content: center;
		font-size: 15px;
	}

	.search-ico-wapper {

		width: 50rpx;
		padding-top: 8rpx;
		float: left;
		height: 60rpx;
		margin-left: 10rpx;

	}

	.search-box {
		width: 100%;
		height: 100rpx;
		margin: 0px auto;
		padding-top: 20rpx;
		padding-bottom: 20rpx;
	}

	.search-input {
		display: inline-block;
		width: 65%;
		height: 60rpx;
		border: 1px solid #cccccc;
		float: left;
		font-size: 12px;
		margin-left: 4px;
	}

	.search-button {
		display: inline-block;
		width: 15%;
		height: 60rpx;
		float: left;
		background-color: #00a0e9;
		font-size: 12px;
		color: #fff;
		text-align: center;
		margin-left: -8rpx;
		font-size: 24rpx;
	}

	.phone {
		height: 50rpx;
		width: 50rpx;
		float: left;
		margin-left: 20rpx;
		padding-top: 8rpx;

	}
</style>
