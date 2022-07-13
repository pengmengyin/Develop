<template>
	<view class="identification">
		<view class="introduce">
			<view class="txt" style="font-size: 40rpx;color: #AAAAAA;">欢迎使用中药识别App</view>
			<view class="phone">
				<!-- 			<view class="iconfont icon-tupian" style="font-size: 160rpx; float: right; padding: 40rpx;"></view>
				<view class="iconfont icon-paizhao" style="font-size: 160rpx; float: left; padding: 40rpx;"></view> -->
				<view class="but1">
					<image :src="imgpath[0]" mode="widthFix" style="width: 100%;" v-if="isshow"></image>
					<button type="primary" @click="takephone()">点击此处拍照或者上传</button>
				</view>
			</view>
		</view>
		<button class="btn2" @click="update()">上传识别</button>
		<view class="result">
			<view class="top">识别结果</view>
<!-- 			<view class="btm">{{kind}}</view> -->
			<view class="btm" v-model="kind" v-if="kind.length">{{kind}}</view>
			<view class="btm" v-else >"请上传图片识别"</view>	
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				tupian: null,
				// kind:"请上传图片识别",
				kind: "",
				imgpath: ['../../static/zhaopian.png'],
				isshow: true,
			};

		},
		methods: {
			//从相册或者相机获得一张照片，并展示					
			takephone() {
				uni.chooseImage({
					count: 1,
					success: (res) => {
						console.log(res)
						this.imgpath = res.tempFilePaths;
						console.log(this.imgpath)
						// this.isshow =! this.isshow
					},
				})
			},
			update() {
				uni.showLoading({
					title: '识别中'
				});
				setTimeout(function() {
					uni.hideLoading();
				}, 6000);
				uni.uploadFile({
					// url: 'http://101.201.118.42:80/predict',
					// 中药
					url: 'http://101.201.118.42:8000/predict',
					// responseType: 'arraybuffer',
					filePath: this.imgpath[0],
					name: 'file',
					success: (res) => {
						uni.hideLoading();
						// console.log(res.data)
						this.kind = res.data
						console.log(this.kind)
						// this.kind=JSON.parse(res.data)
						// this.kind[1]=Number(this.kind[1]*100).toFixed(3)
						// this.kind[1]=this.kind[1]+'%'
					},
					fail: (err) => {
						console.log(err)
					},

				})
				//数据流
				// uni.request({
				// 	url: 'http://172.27.239.253:8000//predict',
				// 	responseType: 'arraybuffer',
				// 	method:"POST",
				// 	success: (res) => {
				// 		console.log(res)
				// 		const arrayBuffer = res.data
				// 		this.imgurl = 'data:image/jpeg;base64,' + uni.arrayBufferToBase64(arrayBuffer)
				// 	}
				// })
			},
		}

	}
</script>



<style>
	.identification {
		width: 100%;
	}

	.introduce {
		height: 40%;
	}

	.txt {
		font-size: 50rpx;
		text-align: center;
		padding: 40rpx;
	}

	.phone {
		width: 70%;
		margin: 0 auto;
		border: 4rpx solid #AAAAAA;
		margin-bottom: 50rpx;

	}

	.but1 {
		width: 500rpx;
		margin: 20rpx auto;
		margin-top: 10rpx;
	}

	.btn2 {
		width: 80%;
		background-color: #2979FF;
		color: white;
		margin-bottom: 100rpx;
	}

	.result {
		width: 650rpx;
		margin: 0px auto;
		border-radius: 25rpx;
	}

	.top {
		background-color: #AAAAAA;
		height: 60rpx;
		padding: 8rpx;
	}

	.btm {
		background-color: white;
		height: 100rpx;
		font-size: 32rpx;
		text-align: center;
		padding: 20rpx;
	}
</style>
