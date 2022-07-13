<template>
	<header>
		<view class="search-return">
			<view class="iconfont icon-sousuo" style="display: inline-block;"></view>
		</view>
		<view class="seach-main">
			<form action="" onsubmit="return false" @keyup.enter="goSearchList()">
				<input type="text" placeholder="搜索想了解的岩石" v-model="searchVal">
			</form>
			
		</view>
		<view class="seach-btn" @click="goSearchList()">搜索</view>
	</header>	
</template>

<script>
	var _self
	export default{
		data (){
			return{
				searchVal:'',
				searchArr:[],
			}
		},
		methods:{
			goSearchList(){
				_self=this			
				
				//如果搜索的关键字是没有的，就直接return
				if(!_self.searchVal)return;
				
				//判断之前有没有搜索的本地存储
				uni.getStorage({
					key:'searchList',
					success:function(res){
						_self.searchArr=JSON.parse(res.data)
						
					},
					fail() {
						uni.setStorage({
							key:'searchList',
							data:'[]',
						})
					}
				})
				
				//增加数据
				_self.searchArr.unshift( _self.searchVal);
				//ES6去重
				let newArr = new Set(_self.searchArr)
				
				//给本地存储赋值
				uni.setStorage({
					key:'searchList',
					data:JSON.stringify(Array.from(newArr))
				})
				
				//跳转页面
				uni.navigateTo({
					url:"../../pages/search/Search-list?key="+_self.searchVal,
				})
				
			}
		},
		
	}
</script>

<style scoped>
header{
	display: flex;
	justify-content: space-around;
	align-items: center;
	width: 100%;
	height: 88upx;
	background-color: #e6e6e6;
	color: black;
}
.search-return.seach-btn{
	padding: 0 20upx;
}
.seach-btn{
	font-size: 32rpx;
}
.seach-main{
	display: flex;
	align-items: center;
	padding:12rpx 44rpx;
	width: 550upx;
	height: 60rpx;
	border-radius: 12px;
	background-color: #FFFFFF;
	
}

.seach-main form{
	width: 100%;
	
}


input{
	background: none;
	outline: none;
	border: none;
	border-radius: 12px;
}
input:focus{
	border: none;
}
</style>
