import axios from 'axios'
export default {
	common:{
		method:"GET",
		data:{},
		params:{}
	},
	$axios(options={}){
		options.method = options.method || this.common.method;
		options.data = options.data || this.common.data;
		options.parms = options.parms || this.common.parms;
		//请求前==》显示加载中...
		// Indicator.open('加载中...');
		uni.showToast({
			title:"加载中",
			icon:"loading"
		})
		
		
	return axios(options).then(v=>{
		let data = v.data.data;
		return new Promise((res,rej)=>{
			if( !v ) return rej();
			 //结束==》关闭加载中
			 setTimeout(()=>{
				 uni.hideLoading();
			 },500)
			 res(data);
		})
	})
	}
}