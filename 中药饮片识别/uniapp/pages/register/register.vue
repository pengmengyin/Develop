<template>
	<view class="content">
		<view class="phone">
			<input maxlength="11" type="number" placeholder="请输输入手机号" v-model="userTel" style="padding-left: 15px;" />
		</view>
		<view class="ident">
			<input maxlength="6" type="number" placeholder="请输验证码" v-model="userCode" style="padding-left: 15px;" />
			<button class="code" @click="sendCode()" :disabled="disable">{{CodeMsg}}</button>
		</view>
		<view class="pwd">
			<input type="password" placeholder="请输入密码" v-model="userPwd" style="padding-left: 15px;" />
		</view>

		<view>
			<button type="default" @click="register()">注册</button>
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
				disable: false,
				userTel: '',
				userPwd: '',
				userCode: '',
				rules: {
					//手机号验证
					userTel: {
						rule: /^1[23456789]\d{9}$/,
						msg: '手机号不能为空，并且是11位数字'
					},
					userPwd: {
						rule: /^\w{6,12}$/,
						msg: '密码不能为空，并且要求6,12位'
					}
				},
				CodeNum: 60,
				CodeMsg: '获取短信验证码',
				code: ''
			}
		},
		methods: {
				...mapMutations(['USER_LOGIN']),
			//获取短信验证码按钮
			sendCode() {
				//验证
				if (!this.validate('userTel')) return;
				uni.request({
					url: "http://localhost:8088/sms/sendcode",
					
					// 服务器
					// url:"http://101.201.118.42:8080/sms/sendcode",
					method: 'GET',
					data: {
						Phone: this.userTel
					},
					success: (res) => {
						console.log(res);
						this.code = res.data.code
					},
				})

				//禁用按钮
				this.disable = true;
				//倒计时
				let timer = setInterval(() => {
					--this.CodeNum;
					this.CodeMsg = '重新发送' + this.CodeNum;
				}, 1000)
				//判断什么时候停止定时器
				setTimeout(() => {
					clearInterval(timer);
					this.CodeNum = 6;
					this.disable = false
					this.CodeMsg = '获取短信验证码'
				}, 60000)
			},

			//验证信息提示
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

			//点击注册
			register() {
				//验证密码
				if (!this.validate('userPwd')) return;
				//判断验证码是否正确
				if (this.code != this.userCode) {
					// Toast('验证码不正确');
					uni.showToast({
						title: '验证码不正确',
						icon: "none"
					});
					return;
				}
				uni.request({
					url: "http://localhost:8088/api/register",
					//服务器
					// url:"http://101.201.118.42:8080/api/register",
					method: 'GET',
					header: {
						'custom-header': 'application/json' //自定义请求头信息
					},
					data: {
						userTel: this.userTel,
						userPwd: this.userPwd
					},
					success: (res) => {
						console.log(res)
						this.USER_LOGIN(res.data.user)
						if (res.data.code == 500) {
							uni.showToast({
								title: res.data.msg,
								icon: "none",
								duration: 1000
							});
							setTimeout(function() {
								uni.navigateTo({
									url: '../login/login'
								})
							}, 1000);
						} else {
							uni.showToast({
								title: res.data.msg,
								icon: "none",
							});
							uni.switchTab({
								url: '../index/index'
							})
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
		}
	}
</script>

<style lang="scss">
	.content {
		top: 20rpx;
		position: relative;
		display: flex;
		width: 650rpx;
		height: 600rpx;
		justify-content: space-between;
		flex-direction: column;
		padding-top: 10px;
		margin: 50rpx;

		.phone {
			position: relative;
			display: flex;
			border: 1px solid #C8C7CC;
			height: 80rpx;
			align-items: center;
			border-radius: 20px;
		}

		.ident {
			position: relative;
			display: flex;
			border: 1px solid #C8C7CC;
			height: 80rpx;
			align-items: center;
			border-radius: 20px;

			.code {
				flex: 3;
				font-size: 25rpx;
				height: 80rpx;
				text-align: center;
				align-items: center;
				float: right;
				border-radius: 20px;
				padding: 4px ;
				background-color: #C8C7CC;
				font-size: 24rpx;
			}
		}

		.id {
			position: relative;
			display: flex;
			border: 1px solid #C8C7CC;
			height: 80rpx;
			align-items: center;
			border-radius: 20px;
		}

		.pwd {
			position: relative;
			display: flex;
			border: 1px solid #C8C7CC;
			height: 80rpx;
			align-items: center;
			border-radius: 20px;
			
		}

		.mkpwd {
			position: relative;
			display: flex;
			border: 1px solid #C8C7CC;
			height: 80rpx;
			align-items: center;
			border-radius: 20px;
		}

	}
</style>
