<template>
	<view class="load">
		<!-- 		背景部分 -->
		<view class="box">
			<image src="../../static/true.jpg"></image>
		</view>
		<!-- 		logo部分 -->
		<view class="content">
			<image src="../../static/medic.png"></image>
		</view>
		<!-- 	内容部分 -->
		<view class="form">
			<view class="input">
				<input maxlength="11" v-model="userTel" type="number" placeholder="请输入手机号"
					placeholder-class="input_place" style="padding-left: 15px;" />
			</view>
			<view class="input">
				<input maxlength="16" v-model="userPwd" type="password" placeholder="请输入密码"
					placeholder-class="input_place" style="padding-left: 15px;" />
			</view>
			<view class="loginBtn">
				<button type="default" @click="login()">登陆</button>
			</view>
		</view>
		<view class="turn">
			<navigator url="../Forget-pwd/Forget-pwd">
				<button class="left" plain="true">忘记密码</button>
			</navigator>
			<navigator url="../register/register">
				<button class="right" plain="true">立即注册</button>
			</navigator>
		</view>
	</view>
</template>

<script>
	// import { Toast } from 'mint-ui';
	import http from '@/common/api/request.js'
	import {
		mapMutations
	} from 'vuex'
	export default {
		data() {
			return {
				isShow: true,
				username: '',
				password: '',
				userTel: '', //用户输入手机号
				userPwd: '', //用户输入密码
				user:{
					id:'',
					imgUrl:'',
					nickNmae:'',
					pwd:"",
					tel:'',
					token:''
				},
				//验证规则
				rules: {
					//手机号验证
					userTel: {
						rule: /^1[23456789]\d{9}$/,
						msg: '手机号不能为空，并且是11位数字'
					},
					//密码验证
					userPwd: {
						rule: /^\w{6,12}$/,
						msg: '密码不能为空，并且要求6,12位'
					}
				}

			}
		},
		methods: {
			...mapMutations(['USER_LOGIN']),
			//点击登录
			login() {
				//前端验证
				if (!this.validate('userTel')) return;
				if (!this.validate('userPwd')) return;
				//发送请求，后端验证
				uni.request({
					url: "http://localhost:8088/api/login",//后台地址
					// url:"http://101.201.118.42:8080/api/login",//服务器地址
					method: 'GET',
					header: {
						'custom-header': 'application/json' //自定义请求头信息
					},
					data: {
						userTel: this.userTel,
						userPwd: this.userPwd
					},
					success: (res) => {
						console.log(res.data.user)
						this.USER_LOGIN(res.data.user)
						uni.showToast({
							title: res.data.msg,
							icon: "none"
						});
						if (res.data.code == 200) {
							uni.showToast({
								title: res.data.msg,
								icon: "none"
							});
							setTimeout(function() {
								uni.switchTab({
									url: '/pages/index/index'
								})
							}, 1000);
						}
					},
					fail(res) {
						uni.showToast({
							title: "请求错误",
							icon: "none",
						}, 2000)
						console.log(res)
					}
				})

			},
			validate(key) {
				let bool = true;
				if (!this.rules[key].rule.test(this[key])) {
					// Toast(this.rules[key].msg);
					uni.showToast({
						title: this.rules[key].msg,
						icon: "none"
					});
					bool = false;
					return false;
				}
				return bool;
			},
		}
	}
</script>

<style lang="scss">
	.load {
		.box {
			height: 100%;
		}
		image {
			position: absolute;
			display: block;
			height: 100%;
			width: 100%;
		}

		.content {
			top: 90rpx;
			position: relative;
			width: 300rpx;
			height: 300rpx;
			overflow: hidden;
			margin: 0 auto;

			.image {
				width: 100%;
				height: 100%;
				position: relative;
				border: none;

			}
		}

		.form {
			top: 70rpx;
			position: relative;
			display: flex;
			width: 650rpx;
			height: 200px;
			justify-content: space-between;
			flex-direction: column;
			padding-top: 10px;
			margin: 50rpx;

			.input {
				position: relative;
				display: flex;
				border: 1px solid #FFFFFF;
				height: 40px;
				align-items: center;
				border-radius: 20px;

				.input_place {
					font-size: 15px;
				}

			}
		}

		.turn {
			top: 100rpx;
			position: relative;
			width: 750rpx;
			height: 40px;

			.left {
				position: absolute;
				text-align: center;
				font-size: 12px;
				margin-left: 70rpx;
				border: none;
			}

			.right {
				position: absolute;
				text-align: center;
				font-size: 12px;
				margin-left: 500rpx;
				border: none;
			}
		}
	}
</style>
