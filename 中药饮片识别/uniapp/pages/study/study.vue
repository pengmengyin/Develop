<template>
	<view class="content">
		<view class="box">
			<image src="../../static/study.webp" style="width: 100%; height: 100%;  z-index: -1;"></image>
		</view>
		<view class="text">
			<!-- <image src="../../static/student/title.jpg"></image> -->
			<p>开始进行中药测评吧</p>
			<p>通过首页查询</p>
			<p>增加中药储备量</p>
		</view>
		<view class="btn">
			<button @click="gostudy()" style="background-color: transparent;
			border-style: none;">开始学习</button>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {

			}
		},
		methods: {
			gostudy() {
				uni.navigateTo({
					url: '/pages/study/subject'
				})
			},
		}
	}
</script>

<style lang="scss">
	.content {
		width: 100%;
		height: 100%;

		.box {
			width: 100%;
			position: fixed;
			height: 100%;
			top: 0;
			left: 0;
			z-index: -1;
		}

		.text {
			width: 500rpx;
			height: 100%;
			margin: 0 auto;
			padding-top: 150px;

		}
		.text p{
			line-height: 40px;
			color: #4F4F4F;
		}

		.btn {
			width: 450rpx;
			margin: 0 auto;
			padding-top: 120rpx;

		}
	}
</style>
