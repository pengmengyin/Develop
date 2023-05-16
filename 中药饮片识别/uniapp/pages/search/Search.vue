<template>
	<view class="seach">
		<Header></Header>
		<section>
			<view class="search-history" v-if="searchArr.length">
				<h2>
					<i class="iconfont icon-shijian"></i>
					<span>历史搜索</span>
					<span @click="deleteStorge()">清空历史记录</span>
				</h2>
				<ul>
					<li v-for="(item,index) in searchArr" :key='index' @click='goSearchList(item)'>{{item}}</li>				
				</ul>
			</view>
			<view v-else>暂无搜索记录....</view>
		</section>
	</view>
</template>

<script>
	import Header from "@/components/search/Header.vue"
	var _self
	export default{
		data(){
			return{
				searchArr:[]
			}
		},
		components:{
			Header,
		},
		created() {
			_self=this;
			// this.searchArr = JSON.parse(localStorage.getItem('searchList'));
			uni.getStorage({
				key:'searchList'||[],
				success:function(res){
					_self.searchArr=JSON.parse(res.data)				
				},
			})
		},
		methods:{
			deleteStorge(){
				uni.showModal({
					title:'确定执行此操作',
					success:function(res){
						if(res.confirm){
							//删除本地存储
							// localStorage.removeItem('searchList');
							uni.removeStorage({
								key:'searchList'
							})
							//清空数据
							_self.searchArr=[];
						}
					}
				})
			},
			//点击历史搜索，进入搜索页面
			goSearchList(item){
				console.log(item)
				uni.navigateTo({
					url:"../../pages/search/Search-list?key="+item,
				})
			}
		}
}
</script>

<style>
	.seach{
		display: flex;
		flex-direction: column;
		width: 100%vw;
		height: 100%vh;
		overflow: hidden;
		
		
	}
	section{
		flex: 1;
		overflow: hidden;
		background-color: #F5F5F5;
	}

	.search-history h2{
		position: relative;
		padding: 40rpx;
		font-weight: 400;
		font-size: 36rpx;
		
	}
	.search-history h2 i{
		padding-right:14rpx;
		padding-top: 9rpx;
		width: 40rpx;
		color: #82848A;
		font-size: 36rpx;
		float: left
	}
	.search-history h2 span:last-child{
		position: absolute;
		right: 40rpx;
		
	}
	.search-history ul{
		padding: 10rpx 20rpx;
		display: flex;
		flex-wrap: wrap;
	}
	.search-history ul li{
		margin: 20rpx;
		font-size:28rpx ;
		border: 1px solid #ccc;
		padding: 6rpx 12rpx;
		list-style-type: none;
	}
</style>
