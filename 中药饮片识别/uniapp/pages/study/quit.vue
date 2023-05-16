<template>
	<view class="content">
		<view class="img">
			<image src="../../static/student/quit.jpg"></image>
		</view>
		<view class="txt">
			<text>积分+{{score}}</text>
		</view>
		<view class="btn">
			<button @click="gostudy()">返回</button>
		</view>
	</view>
</template>

<script>
	import {mapState} from 'vuex'
	export default {
		data() {
			return {
				score:0
			}
		},
		computed:{
			...mapState({
				userInfo:state=>state.user.userInfo
		
			})
		},
		onLoad:function(res){
			this.score=res.score
			console.log(this.score)
			this.userInfo.score=parseFloat(this.userInfo.score) + parseFloat(res.score) 
			console.log(this.userInfo.score)
		},
		methods: {
			gostudy(){
				uni.switchTab({
					url:'/pages/study/study'
				})				
			},
		}
	}
</script>

<style lang="scss">
.content{
	width: 750rpx;
    .img{
		width: 650rpx;
		height: 650rpx;
		margin: 0 auto;
		padding-top: 50px;
		image{
			width: 100%;
			height: 100%;
		}
	}
	.btn{
		width: 450rpx;
		margin: 0 auto;
		padding-top: 70rpx;
	}
	.txt{
		text-align: center;
		font-size: 80rpx;
		margin-top: 50rpx;
	}
}
</style>
