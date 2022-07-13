<template>
	<view class="content">
		<view class="top">
			<view class="grade">
				<text>等级{{rank}}</text>
			</view>
			<view class="number">
				<text class="left">积分{{score}}</text>
				<text class="right">生命{{life}}</text>
			</view>
		</view>
		<view class="middle">
			<image :src="src"></image>
		</view>
		<view class="under">

			<view class="first">
				<button class="A" @click="checkitem(stone[0].name)">A {{stone[0].name}}</button>
				<button class="B" @click="checkitem(stone[1].name)">B {{stone[1].name}}</button>
			</view>
			<view class="two">
				<button class="C" @click="checkitem(stone[2].name)">C {{stone[2].name}}</button>
				<button class="D" @click="checkitem(stone[3].name)">D {{stone[3].name}}</button>
			</view>
		</view>
		<view class="explain">
			<view @click="goExplain">
				答题规则说明
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
				// id: Math.floor(Math.random() * (30 - 1 + 1)) + 1,
				id: 0,
				src: '',
				stone: [],
				soloution: '',
				score: 0,
				life: 10,
				rank: 1
			}
		},
		computed: {
			...mapState({
				userInfo: state => state.user.userInfo

			})
		},
		onLoad: function() {
			this.getphone();
			this.getname()
		},
		methods: {
			gosbt() {
				if (life = 0) {
					uni.navigateTo({
						url: '/pages/study/death'
					})
				}
			},
			goExplain() {
				uni.navigateTo({
					url: './introduce'
				});
			},
			getphone() {
				uni.request({
					url: "http://localhost:8088/study/getphoto",
					// url:"http://101.201.118.42:8080/study/getphoto",
					method: 'GET',
					data: {
						// ID: this.id = Math.floor(Math.random() * (180 - 1 + 1)) + 1,
						ID: this.id = Math.floor(Math.random() * (12 - 1 + 1)) + 1,
					},
					header: {
						'custom-header': 'application/json' //自定义请求头信息
					},
					success: (res) => {
						this.soloution = res.data.search.name
						this.src = res.data.search.src
						console.log(this.src)
					},
					fail(res) {
						console.log(res)
					}
				})
			},
			getname() {
				uni.request({
					url: "http://localhost:8088/study/getname",
					// url:"http://101.201.118.42:8080/study/getname",
					method: 'GET',
					data: {
						ID: this.id
					},
					header: {
						'custom-header': 'application/json' //自定义请求头信息
					},
					success: (res) => {
						this.stone = res.data
					},
					fail(res) {
						console.log(res)
					}
				})
			},
			checkitem(value) {
				if (this.soloution == value) {
					this.score = this.score + 2;
					if (this.score == 20 || this.score == 30 || this.score == 40) {
						uni.showToast({
							title: '恭喜你进入下一阶段',
							icon: 'none'
						})
						this.rank = this.rank + 1
					} else if (this.score == 50) {
						this.rank = 5
					}
					if (this.rank == 5) {
						uni.showModal({
							title: '提示',
							content: '恭喜你通关了',
							showCancel: false,
							success() {
								uni.navigateTo({
									url: "./quit?score=" + 50,
								})
							}
						})
					}
				} else {
					this.insertmistake()
					this.life = this.life - 1;
					if (this.life == 0) {
						console.log(this.score)
						uni.request({
							url: "http://localhost:8088/study/updatescore",
							// url:"http://101.201.118.42:8080/study/updatescore",
							
							method: 'GET',
							data: {
								phone: this.userInfo.tel,
								score: this.score
							},
							header: {
								'custom-header': 'application/json' //自定义请求头信息
							},
							success: (res) => {
								console.log(res)
							},
							fail(res) {
								console.log(res)
							}
						})
						uni.navigateTo({
							url: "./quit?score=" + this.score,
						})
						this.life = 10
						this.score = 0
					}


				}
				this.getphone()
				this.getname()
				
			},
			insertmistake() {
				uni.request({
					url: "http://localhost:8088/study/mistakequestion",
					// url:"http://101.201.118.42:8080/study/mistakequestion",
					method: 'GET',
					data: {
						phone: this.userInfo.tel,
						ID: this.id,
					},
					header: {
						'custom-header': 'application/json' //自定义请求头信息
					},
					success: (res) => {
						console.log(res)
					},
					fail(res) {
						console.log(res)
					}
				})
			}
		},
	}
</script>

<style lang="scss">
	.content {
		width: 750rpx;

		.top {
			width: 100%;
			height: 20%;
			color: #C0C0C0;
			margin-top: 30rpx;

			.number {
				padding-top: 20rpx;

				.right {
					float: right;
				}
			}
		}

		.middle {
			width: 60%;
			height: 60%;
			margin: 0 auto;
			margin-top: 60rpx;

			image {
				max-width: 100%;
				max-height: 100%;
			}
		}

		.under {
			width: 80%;
			margin: 0 auto;
			margin-top: 50rpx;
			font-size: 20rpx;
			.first {
				width: 100%;
				height: 200rpx;


				.A {
					float: left;
					font-size: 28rpx;
					
				}

				.B {
					float: right;
					font-size: 28rpx;
				}
			}

			.two {
				width: 100%;
				height: 100rpx;
				
				.C {
					float: left;
					font-size: 28rpx;
				}

				.D {
					float: right;
					font-size: 28rpx;
				}
			}
		}

		.explain {
			width: 750rpx;
			// position: absolute;
			bottom: 40rpx;
			font-size: 24rpx;
			margin: 10rpx 0 40rpx 0;
			padding-top: 40rpx;
			text-align: center;
			color: #999999;

			.integral {
				font-size: 30rpx;
				margin-bottom: 15rpx;
				color: #333333;
			}
		}
	}
</style>
