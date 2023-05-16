import {
	USER_LOGIN,
	INIT_USER,
} from './mutations-types.js'
export default {
	state: {

		loginStatus: false, //登陆状态

		token: null, //token

		userInfo: {} //用户信息：用户头像|名称
	},
	getters: {

	},
	mutations: {
		//设置
		[USER_LOGIN](state, user) {
			state.loginStatus = true;
			// state.token = user.token;
			state.userInfo = user
			console.log(state,user)
			//持久化存储==》本地存储
			// localStorage.setItem('teauserInfo', JSON.stringify(user));
			uni.setStorage({
				key:'teauserInfo',
				data:JSON.stringify(user)
			})
		},
		//读取 
		[INIT_USER](state){
			// let userInfo =  JSON.parse(localStorage.getItem('teauserInfo'));
			uni.getStorage({
				key:'teauserInfo',
				success:function(res){
					const userInfo= JSON.parse(res.data)
				}
			})
			if(this.userInfo){
				state.loginStatus = true;
				state.token = userInfo.token
				state.userInfo = userInfo
			}
		},
		//退出登陆
		loginOut(state){
			state.loginStatus = false;
			state.token = null;
			state.userInfo = {};
			// localStorage.removeItem('teauserInfo');
			uni.removeStorage({
				key: 'teauserInfo',
			});
			uni.reLaunch({
				url:'/pages/login/login'
			})
		},

		
	},
	actions: {

	},
}
