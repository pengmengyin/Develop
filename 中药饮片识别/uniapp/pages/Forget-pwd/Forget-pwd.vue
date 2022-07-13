<template>
	<view class="content">
		<view class="phone">
			<input maxlength="11" type="number" placeholder="请输输入手机号" v-model="userTel" style="padding-left: 15px;" />
		</view>
		<view class="ident">
			<input maxlength="6" type="number" placeholder="请输验证码" v-model="userCode" style="padding-left: 15px;" />
			<button class="code" @click="sendCode()" :disabled="disable">{{CodeMsg}}</button>
		</view>
		<view class="confirm">
			<button type="default" @click="next()">下一步</button>
		</view>
	</view>
</template>

<script>
	// import { Toast } from 'mint-ui';
	import http from '@/common/api/request.js'
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
				},
				CodeNum: 60,
				CodeMsg: '获取短信验证码',
				code: ''
			}
		},
		methods: {
			//获取短信验证码按钮
			sendCode() {
				//验证
				if (!this.validate('userTel')) return;
				//请求短信验证码接口
				uni.request({
					url: "http://localhost:8088/sms/sendcode",
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
					uni.showToast({
						title: this.rules[key].msg,
						icon: "none"
					})

					// Toast(this.rules[key].msg);
					bool = false;
					return false;
				}
				return bool;
			},

			//点击下一步
			next() {
				//判断验证码是否正确
				if (this.code != this.userCode) {
					// Toast('验证码不正确');

					uni.showToast({
						title: '验证码不正确',
						icon: "none"
					});
					return;
				}

				//如果正确，告诉后端，用户输入的手机号，存在吗？
				uni.request({
					url: "http://localhost:8088/api/selectUser",
					// url:"http://101.201.118.42:8080/api/selectUser",
					method: 'GET',
					data: {
						phone: this.userTel,
					},
					success: (res) => {
						console.log(res);
						uni.showToast({
							title: res.data.msg,
							icon: "none"
						});
						if(res.data.code==200){
							uni.navigateTo({
								url:'/pages/Forget-pwd/RecoveryBtn?phone='+this.userTel
							})
						}
					},
				})

			}
		}
	}
</script>

<style lang="scss">
	.content {
		position: relative;
		display: flex;
		width: 650rpx;
		height: 400rpx;
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
				background-color: #C8C7CC;
				font-size: 24rpx;
				padding: 4px;
			}
		}

		.password {
			position: relative;
			display: flex;
			border: 1px solid #C8C7CC;
			height: 80rpx;
			align-items: center;
			border-radius: 20px;
		}
	}
</style>
