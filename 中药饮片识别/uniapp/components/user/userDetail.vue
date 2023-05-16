<template>
	<view class="userdetail">
		<view>
			<view class="user_img">
				<image :src="userInfo.imgUrl" alt="" v-if="userInfo.imgUrl!=null"></image>
				<image src="../../static/phone.png" alt="" v-else></image>
			</view>
			<view class="user_edit">
				<view>
					<p>
						<span>{{userInfo.score}}</span>
						<span class="user_text">积分</span>
					</p>
					<p>
						<span>54</span>
						<span class="user_text">关注</span>
					</p>
					<p>
						<span>0</span>
						<span class="user_text">获赞</span>
					</p>
				</view>
				<view>
					<view class="user_editBtn" @click="edit()">编辑资料</view>

					<view class="user_editBtn1" @click="mistake()">查看错题</view>

				</view>
			</view>
		</view>
		<view >
			<h2  v-if="userInfo.username!=null" style="font-size: 40rpx; font-weight: 800;">{{userInfo.username}}</h2>
			<h2 v-else style="font-size: 40rpx; font-weight: 800;">小白</h2>
			
			<p v-if="userInfo.user_desc!=null" style="color: #AAAAAA;">{{userInfo.user_desc}}</p>
			<p v-else style="color: #AAAAAA;">这个人很神秘，什么都没弄</p>
		</view>
		<view class="tabs">
			<view class="on" v-for="(item,index) in nav" :key="index">
				<view :class="{'active':isActive==item.isActive}" @click="chenked(item.isActive)">
					{{item.name}}
				</view>
			</view>
		</view>
		<view v-if="isActive==1">
			<view class="feed">
				<view class="ending">到达动态尽头！</view>
			</view>
			<view class="foot">
				<p>发动态后再来看看吧</p>

			</view>
		</view>
		<view v-if="isActive==2">
			<view class="feed">
				<view class="ending">还没有足迹呢！</view>
			</view>
			<view class="foot">
				<p>去逛逛再回来看看吧</p>

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
				nav: [{
						name: '动态',
						isActive: 1
					},
					{
						name: '足迹',
						isActive: 2
					},
				],
				isActive: 1,
				xiaobai: '小明',
			}
		},
		computed: {
			...mapState({
				userInfo: state => state.user.userInfo

			})
		},
		methods: {
			edit() {
				uni.navigateTo({
					url: '/pages/mine/edit'
				})
			},
			chenked(type) {
				this.isActive = type
			},
			mistake(){
				uni.navigateTo({
					url:"/pages/study/mistake"
				})
			},
		},
	}
</script>

<style scoped lang="scss">
	.userdetail {
		background-color: white;
		padding: 0 24rpx;

		>view:nth-child(1) {
			display: flex;
		}

		>view:nth-child(2) {
			h2 {
				margin: 20rpx 0 6rpx 0;
				font-weight: 400;
			}

			p {
				padding: 0;
				margin: 20rpx 0;
				color: #555;
			}
		}

		.user_img {
			margin-right: 40rpx;

			image {
				height: 170rpx;
				width: 170rpx;
				border-radius: 50%;
			}
		}

		.user_edit {
			flex: 1;

			view:nth-child(1) {
				display: flex;

				p {
					flex: 1;
					display: flex;
					justify-content: center;
					align-items: center;
					flex-direction: column;
					font-size: 28rpx;
					margin: 10rpx;

					.user_text {
						color: #aaa;
					}
				}

				p:nth-child(1),
				p:nth-child(2) {
					border-right: 1px solid #ccc;
				}
			}

			view:nth-child(2) {
				margin: 10rpx 20rpx;
				padding: 4rpx 20rpx;
				.user_editBtn {
					float: left;
					width: 180rpx;
					
					padding: 6rpx;
					text-align: center;
					display: flex;
					align-items: center;
					justify-content: center;
					padding-left: 30rpx;
					font-size: 26rpx;
				}
				.user_editBtn1{
					float: right;
					width: 180rpx;
					display: flex;
					margin: 0;
					padding: 3px;
					border-radius: 6rpx;
					font-size: 26rpx;
					padding-left: 30rpx;
					
				}
			}

		}

		.tabs {
			height: 10.66667vw;
			line-height: 10.66667vw;
			padding-left: 3.2vw;
			background: #fff;
			border-top: 1px solid #e7e7e7;
			border-bottom: 1px solid #e7e7e7;
			font-size: 0;
			margin: 0;
			padding: 0;
			box-sizing: border-box;
		}

		.on {
			display: inline-block;
			margin-right: 8.53333vw;
			color: #757575;
			font-size: 3.46667vw;
			line-height: 10.66667vw;
		}

		.feed {
			box-sizing: border-box;
			color: #212121;
			font-size: 14px;
			line-height: 1.44;
			margin: 0px;

			.ending {
				text-align: center;
				font-size: 26rpx;
				line-height: 40px;
				color: #757575;

			}

		}

		.foot {
			text-align: center;
			margin: 0;
			padding: 0;
		}

		.foot p {
			margin: 0;
			padding: 0;
			color: #999;
			font-size: 26rpx;
			line-height: 20px;
		}


	}
</style>
