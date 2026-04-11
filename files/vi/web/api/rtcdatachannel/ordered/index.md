---
title: "RTCDataChannel: tài sản được đặt hàng"
short-title: ordered
slug: Web/API/RTCDataChannel/ordered
page-type: web-api-instance-property
browser-compat: api.RTCDataChannel.ordered
---

{{APIRef("WebRTC")}}

Thuộc tính `RTCDataChannel` chỉ đọc **`ordered`** biểu thị
kênh dữ liệu có đảm bảo việc gửi tin nhắn theo thứ tự hay không;
mặc định là `true`,
chỉ ra rằng kênh dữ liệu thực sự được sắp xếp.
Điều này được đặt khi {{domxref("RTCDataChannel")}} được tạo,
bằng cách đặt thuộc tính `ordered`
trên đối tượng được truyền dưới dạng tham số `options` của {{domxref("RTCPeerConnection.createDataChannel()")}}.


## Giá trị

Giá trị boolean là `true` nếu giao hàng theo thứ tự là
được đảm bảo và ngược lại là `false`.


## Ví dụ

```js
const pc = new RTCPeerConnection();
const dc = pc.createDataChannel("my channel");

if (!dc.ordered) {
  // Handle unordered messaging
}

```

## Thông số kỹ thuật


{{Specifications}}


## Khả năng tương thích của trình duyệt

{{Compat}}


## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCPeerConnection.createDataChannel()")}}
