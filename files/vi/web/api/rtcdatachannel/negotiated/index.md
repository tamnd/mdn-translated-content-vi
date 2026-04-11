---
title: "RTCDataChannel: tài sản được thương lượng"
short-title: negotiated
slug: Web/API/RTCDataChannel/negotiated
page-type: web-api-instance-property
browser-compat: api.RTCDataChannel.negotiated
---

{{APIRef("WebRTC")}}

Thuộc tính `RTCDataChannel` chỉ đọc
**`negotiated`** cho biết liệu
Kết nối của {{domxref("RTCDataChannel")}} đã được ứng dụng Web thương lượng
(`true`) hoặc theo lớp WebRTC (`false`). ** Cái
mặc định là `false`.**

Xem [Tạo kênh dữ liệu](/en-US/docs/Web/API/WebRTC_API/Using_data_channels#creating_a_data_channel) để biết thêm thông tin về thuộc tính này.


## Giá trị

`true` nếu kết nối của {{domxref("RTCDataChannel")}} đã được thương lượng bởi
chính ứng dụng Web; `false` nếu cuộc thương lượng được xử lý bởi WebRTC
lớp. Giá trị mặc định là `false`.


## Ví dụ

Đoạn mã bên dưới kiểm tra giá trị của `negotiated`; nếu nó
`true`, một hàm có tên `shutdownRemoteChannel()` được gọi
với {{domxref("RTCDataChannel.id", "id")}} của kênh; có lẽ đây sẽ là
được thực hiện để truyền tín hiệu tắt máy đến thiết bị ngang hàng từ xa trước khi kết thúc
kết nối.

```js
if (dataChannel.negotiated) {
  shutdownRemoteChannel(dataChannel.id);
}

```

## Thông số kỹ thuật


{{Specifications}}


## Khả năng tương thích của trình duyệt

{{Compat}}


## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Sử dụng kênh dữ liệu WebRTC](/en-US/docs/Web/API/WebRTC_API/Using_data_channels)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCPeerConnection.createDataChannel()")}}
