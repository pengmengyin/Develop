<template>
	<view class="content">
		<view class="login-tel">
			<input maxlength="11" type="text" v-model="userPwd" placeholder="请输入新的密码" style="padding-left: 15px;" />
		</view>
		<view class="login-btn">
			<button type="default" @click="submitBtn()">确认修改</button>
		</view>
	</view>
</template>

<script>
	import http from '@/common/api/request.js'
	export default {
		data() {
			return {
				userPwd: '',
				option: [],
				rules: {
					userPwd: {
						rule: /^\w{6,12}$/,
						msg: '密码不能为空，并且是6-12位'
					},
				},
			}
		},
		onLoad: function(option) {
			//获取参数可能有问题
			this.option = option.phone
		},
		methods: {

			submitBtn() {
				if (!this.validate('userPwd')) return;
				uni.request({
					url: "http://localhost:8088/api/recovery",
					// url:"http://101.201.118.42:8080/api/recovery",
					method: 'GET',
					header: {
						'custom-header': 'application/json' //自定义请求头信息
					},
					data: {
						userTel: this.option,
						userPwd: this.userPwd
					},
					success: (res) => {
						console.log(res)
						if (res.data.code == 200) {
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
		}
	}
</script>


<style lang="scss">
	.content {
		position: relative;
		display: flex;
		width: 650rpx;
		height: 260rpx;
		justify-content: space-between;
		flex-direction: column;
		padding-top: 10px;
		margin: 50rpx;

		.login-tel {
			position: relative;
			display: flex;
			border: 1px solid #C8C7CC;
			height: 80rpx;
			align-items: center;
			border-radius: 20px;
		}


	}
</style>
