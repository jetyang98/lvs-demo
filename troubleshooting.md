# 问题总结

## 为什么使用Apifox发起请求一直从一个server得到应答，而不是轮询？

可能原因是：现在的模式是DR(direct routing)，发请求是lvs接收，但是回复请求是server，所以apifox记住了目标的mac地址，之后的请求直接发给server了。
