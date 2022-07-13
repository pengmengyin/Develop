<template>
	<view class="editviews">

		<edit-banner left="头像" @bannerClick="uploadimg()">
			<image :src="userInfo.imgUrl" alt="" slot="right" v-if="userInfo.imgUrl!=null"></image>
			<image src="../../static/phone.png" alt="" slot="right" v-else></image>
		</edit-banner>
		<edit-banner left="昵称" @bannerClick="nameopen()">
			<a href="javascript:;" slot="right" v-if="userInfo.username!=null">{{userInfo.username}}</a>
			<a href="javascript:;" slot="right" v-else>小白</a>
		</edit-banner>
		<edit-banner left="账号">
			<a href="javascript:;" slot="right">{{userInfo.tel}}</a>
		</edit-banner>
		<edit-banner left="性别" @bannerClick="onselect()">
			<a href="javascript:;" slot="right">{{userInfo.gender != 0 ? '男':'女'}}</a>
		</edit-banner>
		<edit-banner left="个签" @bannerClick="open()">
			<view slot="right" v-if="userInfo.user_desc!=null">{{userInfo.user_desc}}</view>
			<view slot="right" v-else>快来设置签名</view>
		</edit-banner>
		
		<view class="loginout" @click="loginOut()">退出登陆</view>
		<!-- 昵称 -->
		<view>
			<uni-popup ref="popup" type="dialog">
				<uni-popup-dialog mode="input" title="昵称" message="成功消息" :duration="2000" :before-close="true"
					@close="nameclose" @confirm="nameconfirm"></uni-popup-dialog>
			</uni-popup>
		</view>
		<!-- 个签 -->
		<view>
			<uni-popup ref="popup_text" type="dialog">
				<uni-popup-dialog mode="input" title="个签" message="成功消息" :duration="2000" :before-close="true"
					@close="close" @confirm="confirm"></uni-popup-dialog>
			</uni-popup>
		</view>

	</view>
</template>

<script>
	import {
		mapState,
		mapMutations,
	} from 'vuex'
	import editBanner from '../../components/user/editBanner.vue'
	import http from '@/common/api/request.js'
	export default {
		data() {
			return {
				data:"",
				gender :1
			}
		},
		components: {
			editBanner,
		},
		computed: {
			...mapState({
				userInfo: state => state.user.userInfo,
				loginState: state => state.user.loginState

			})
		},
		methods: {
			...mapMutations(['loginOut']),
			uploadimg() {
				uni.chooseImage({
						count: 1,
						sourceType:['album'],
						success: (res) => {
							//页面展示
							// this.userInfo.imgUrl = res.tempFiles[0].path
							uni.uploadFile({
								url: 'http://localhost:8088/update/image/',
								// url:"http://101.201.118.42:8080/update/image",
								filePath: res.tempFilePaths[0],
								formData:{
									id:this.userInfo.id
								},
								name: 'file',
								success: (res) => {			
									this.data=JSON.parse(res.data)
									console.log(this.data.msg)
									this.userInfo.imgUrl =this.data.msg
								
								},
								fail: (err) => {
									console.log(err)
								},
							
							})
						}
					});
			},

			//昵称弹窗
			nameopen() {
				this.$refs.popup.open()
			},
			nameclose() {
				// TODO 做一些其他的事情，before-close 为true的情况下，手动执行 close 才会关闭对话框
				// ...
				this.$refs.popup.close()
			},
			nameconfirm(value) {
				//后台操作
				uni.request({
					// url: "http://localhost:8088/update/name",
					url:"http://101.201.118.42:8080/update/name",
					method: 'GET',
					data: {
						id: this.userInfo.id,
						name: value
					},
					success: (res) => {
						console.log(res);
					},
				})
				this.userInfo.username = value		
				this.$refs.popup.close()
			},


			//个签弹窗
			open() {
				this.$refs.popup_text.open()
			},
			close() {
				this.$refs.popup_text.close()
			},
			confirm(value) {
				// 输入框的值
				uni.request({
					url: "http://localhost:8088/update/user_desc",
					// url:"http://101.201.118.42:8080/update/user_desc",
					method: 'GET',
					data: {
						Phone: this.userInfo.tel,
						userdesc: value
					},
					success: (res) => {
						console.log(res);
					},
				})				
				this.userInfo.user_desc = value				
				// TODO 做一些其他的事情，手动执行 close 才会关闭对话框
				// ...
				this.$refs.popup_text.close()
			},


			onselect() {
				uni.showActionSheet({
					itemList: ['女', '男', ],
					success: (res) => {
						if (res.tapIndex == 1) {
							this.gender = 1
						} else {
							this.gender = 0
						}
						this.updategender()	
					},
					fail: function(res) {
						console.log(res.errMsg);
					}
				});
				
			},

			updategender(){
				uni.request({
					url: "http://localhost:8088/update/user_gender",
					// url:"http://101.201.118.42:8080/update/user_gender",
					method: 'GET',
					data: {
						id: this.userInfo.id,
						usergender: this.gender
					},
					success: (res) => {
						console.log(res);
					},
				})
				this.userInfo.gender=this.gender
			}
		}
	}
</script>

<style>
	.editviews a {
		color: #333;
	}

	.editviews image {
		height: 92rpx;
		width: 92rpx;
		border-radius: 50%;
	}

	.loginout {
		margin-top: 40rpx;
		background-color: white;
		display: flex;
		align-items: center;
		justify-content: center;
		color: #999;
		padding: 30rpx 0;
		font-size: 30rpx;


	}
</style>
