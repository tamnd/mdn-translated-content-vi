---
title: "RTCDataChannel: thuộc tính maxRetransmits"
short-title: maxRetransmits
slug: Web/API/RTCDataChannel/maxRetransmits
page-type: web-api-instance-property
browser-compat: api.RTCDataChannel.maxRetransmits
---

{{APIRef("WebRTC")}}

Thuộc tính `RTCDataChannel` chỉ đọc
**`maxRetransmits`** trả về số lần tối đa
trình duyệt nên cố gắng truyền lại tin nhắn trước khi từ bỏ, như được đặt khi dữ liệu
kênh đã được tạo hoặc `null`, cho biết rằng không có
tối đa. Điều này chỉ có thể được đặt khi {{domxref("RTCDataChannel")}} được tạo
bằng cách gọi {{domxref("RTCPeerConnection.createDataChannel()")}}, sử dụng
Trường `maxRetransmits` trong `options` được chỉ định.


## Giá trị

Số lần tối đa trình duyệt sẽ cố gắng truyền lại tin nhắn trước khi đưa ra
lên hoặc `null` nếu không được đặt khi
{{domxref("RTCPeerConnection.createDataChannel()")}} đã được gọi. Mặc định là
`null`.


## Thông số kỹ thuật


{{Specifications}}

## Khả năng tương thích của trình duyệt


{{Compat}}

## Xem thêm


- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCDataChannel.maxPacketLifetime")}}
- {{domxref("RTCPeerConnection.createDataChannel()")}}
