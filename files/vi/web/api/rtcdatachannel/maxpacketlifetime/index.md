---
title: "RTCDataChannel: thuộc tính maxPacketLifeTime"
short-title: maxPacketLifeTime
slug: Web/API/RTCDataChannel/maxPacketLifeTime
page-type: web-api-instance-property
browser-compat: api.RTCDataChannel.maxPacketLifeTime
---

{{APIRef("WebRTC")}}

Thuộc tính `RTCDataChannel` chỉ đọc
**`maxPacketLifeTime`** trả về lượng thời gian, trong
mili giây, trình duyệt được phép mất một khoảng thời gian để cố gắng truyền tin nhắn, như đã đặt
khi kênh dữ liệu được tạo hoặc `null`. Điều này giới hạn thời gian
trình duyệt có thể tiếp tục cố gắng truyền đi và truyền lại tin nhắn trước khi đưa ra
lên.


## Giá trị

Số mili giây mà trình duyệt có thể tiếp tục cố gắng truyền tải
tin nhắn cho đến khi nó thành công hoặc bỏ cuộc. Nếu không đặt khi
{{domxref("RTCPeerConnection.createDataChannel()")}} được gọi để tạo dữ liệu
kênh, giá trị này là `null`.


## Thông số kỹ thuật


{{Specifications}}

## Khả năng tương thích của trình duyệt


{{Compat}}

## Xem thêm


- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCDataChannel")}}
- {{domxref("RTCDataChannel.maxRetransmits")}}
- {{domxref("RTCPeerConnection.createDataChannel()")}}
