<template>
	<view @click="bannerClick()">
		<view class="editbanner">
			<span>{{left}}</span>
			<span><slot name="right"></slot></span>
		</view>
	</view>
</template>

<script>
	export default{
		props:['left'],
		methods:{
			bannerClick(){
				this.$emit('bannerClick')
			}
		}
	}
</script>

<style>
	.editbanner{
		background-color:  white;
		padding: 30rpx 10rpx;
		border-bottom: 1px solid #eee;
		font-size: 28rpx;
		color: #333;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
</style>
