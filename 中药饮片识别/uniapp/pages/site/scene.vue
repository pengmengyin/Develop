<template>
	<view class="neirong">
		<view class="contbox">
			<view class="name">
				<span class="font">{{title}}</span>
			</view>
			<view class="content">
				<view class="cont">
					{{top}}
				</view>	
			</view>
			<view class="middle">
				<ul class="lijian">
					<li class="dhidden">
						<!-- <em class="fcolor">别名：</em> -->
						<span> {{name}}</span>
					</li>
<!-- 					<li class="dhidden">
						<em class="fcolor">地质公园级别：</em>
						<span>{{grade}}</span>
					</li>
					<li class="dhidden">
						<em class="fcolor">所在地/隶属：</em>
						<span>{{local}}</span>
					</li> -->
				</ul>
			</view>
			<view class="title">
				<span class="font1">介绍攻略</span>
			</view>
			<view class="txt">
				<p>
					<!-- <strong>发展历程</strong> -->
					<strong>种植攻略</strong>
				</p>
				<p>
					{{p1}}
				</p>
				<p>
					{{p2}}
				</p>
				<p>
					{{p3}}
				</p>
			</view>
<!-- 			<view class="map">
				<span class="font2">地图坐标</span>
			</view>
			<view class="allmap">
				<map class="Map_msk" :longitude="longitude" :scale="scale" :latitude="latitude" :markers="markers"></map>
		
			</view> -->
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				title:'',
				top: '',
				name:'',
				local:'',
				grade:' ',
				p1:'',
				p2:'',
				p3:'',
				longitude:"",
				latitude:"",
				scale:15,
			}
		},
		onLoad: function(res) {
			console.log(res.key)
			this.id=res.key
			this.getData()
		},
		methods:{
			getData() {
				uni.request({					
					url: "http://localhost:8088/index/local",
					// url:"http://101.201.118.42:8080/index/local",
					method: 'GET',
					header: {
						'custom-header': 'application/json' //自定义请求头信息
					},
					data: {
						id:this.id
					},
					success: (res) => {
						console.log(res)
						this.title=res.data.search.title
						this.top=res.data.search.top
						this.name=res.data.search.name
						this.local=res.data.search.local
						this.grade=res.data.search.grade
						this.p1=res.data.search.p1
						this.p2=res.data.search.p2
						this.p3=res.data.search.p3
						this.longitude=res.data.search.longitude
						this.latitude=res.data.search.latitude
					},
					fail(res) {
						console.log(res)
					}
				})
			}
		}
	}
</script>

<style lang="scss">
		.neirong{
			width: 100%;
			position: relative;
			background-color: #FFF;
			min-height: 200px;
			.contbox{
				font-size: 56rpx;
				color: #333;
				box-sizing: border-box;
				max-height: 9999rpx;
				.name{
					.font{
						font-weight: bold;
						font-size: 55rpx;
					}
				}
				.content{
					background-color: #f8fcff;
					border: solid 1px #dbeef;
					padding-bottom: 10rpx;
					// padding: 1em 1em 65px 1em;
					position: relative;
					margin-top: 10px;
					font-size: 28rpx;
					.cont{
						max-height: none;
						overflow: hidden;
						color: #666;
						line-height: 1.8em;
						box-sizing: border-box;
						font-size: 28rpx;
					}
				}
				.middle{
					.lijian{
						width: 100%;
						box-sizing: border-box;
						line-height: 1.8em;
						max-height: 9999999px;
						padding: 0px;
						margin: 0px;
						border: 0px;
						.dhidden{
							line-height: 1.8em;
							border-bottom: dashed   1px #CCC;
							padding: 8px 0px;
							position: relative;
							overflow: hidden;
							white-space: nowrap;
							text-overflow: ellipsis;
							display: block;
							list-style: none;
							font-size: 28rpx;
							.fcolor{
								color: #47a0e5;
								font-style: normal;
								box-sizing: border-box;
							}
						}
					}
				}
				.title{
					text-align: center;
					font-size: 28rpx;
					margin: 50rpx 0rpx 20rpx;
					.font1{
						font-size: 40rpx;
					}
				}
				.txt{
					max-height: 100em;
					overflow: hidden;
					color: #666;
					line-height: 1.8em;
					font-size: 28rpx;
				}
				.map{
					margin: 50rpx 0rpx 20rpx;
					text-align: center;
					font-size: 28rpx;
					.font2{
						font-size: 40rpx;
					}
				}
				.allmap{
					width: 100%;
					height: 800rpx;
					border: solid 1px #8dbde6;
					overflow: hidden;
					position: relative;
					text-align: left;
					background-color: white;
					color: black;
					.Map_msk{
						position: absolute;
						left: 0px;
						top: 0px;
						z-index: 9;
						overflow: hidden;
						width: 750rpx;
						height: 800rpx;
					}
				}
			}
		}
		.txt p{
			padding-bottom: 25px;
		}
</style>
