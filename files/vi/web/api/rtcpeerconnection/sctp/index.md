---
title: "RTCPeerConnection: thuộc tính sctp"
short-title: sctp
slug: Web/API/RTCPeerConnection/sctp
page-type: web-api-instance-property
browser-compat: api.RTCPeerConnection.sctp
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`sctp`** của giao diện {{domxref("RTCPeerConnection")}} trả về một {{domxref("RTCSctpTransport")}} mô tả lớp truyền tải {{Glossary("SCTP")}} mà qua đó dữ liệu SCTP đang được gửi và nhận.
Nếu SCTP chưa được thương lượng, giá trị này là `null`.

Lớp truyền tải SCTP được dùng để truyền và nhận dữ liệu cho bất kỳ và tất cả các {{domxref("RTCDataChannel")}} trên kết nối ngang hàng.

## Giá trị

Một đối tượng {{domxref("RTCSctpTransport")}} mô tả lớp truyền tải SCTP đang được {{domxref("RTCPeerConnection")}} dùng để gửi và nhận trên các kênh dữ liệu của nó, hoặc `null` nếu việc thương lượng SCTP chưa diễn ra.

## Ví dụ

```js
const peerConnection = new RTCPeerConnection();

const channel = peerConnection.createDataChannel("Mydata");
channel.onopen = (event) => {
  channel.send("sending a message");
};
channel.onmessage = (event) => {
  console.log(event.data);
};

// Xác định kích thước tối đa của thông điệp có thể gửi

const sctp = peerConnection.sctp;
const maxMessageSize = sctp.maxMessageSize;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCPeerConnection")}}
- {{domxref("RTCDataChannel")}}
- {{Glossary("SCTP")}}
