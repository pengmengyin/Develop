<template>
	<view class="userinfo">
		<image src="../../static/true.jpg" alt="" class="backImg"></image>
		<user-detial></user-detial>
	</view>

</template>

<script>
	import {mapState,mapMutataion} from 'vuex'
	import userDetial from "../../components/user/userDetail"
	export default {
		data() {
			return {
				
			}
		},
		components:{
			userDetial
		},
		computed:{
			...mapState({userInfo:state=>state.user.userInfo})
		},
		methods: {

		},

	}
</script>

<style lang="scss">
.userinfo{
	.backImg{
		height: 210rpx;
		width: 100%;
	}
	
}
</style>
