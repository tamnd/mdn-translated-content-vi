---
title: "RTCSessionDescription: thuộc tính type"
short-title: type
slug: Web/API/RTCSessionDescription/type
page-type: web-api-instance-property
browser-compat: api.RTCSessionDescription.type
---

{{APIRef("WebRTC")}}

Thuộc tính **`RTCSessionDescription.type`** là một chuỗi chỉ đọc mô tả loại của mô tả phiên.

## Giá trị

Các giá trị có thể là:

- `"answer"`
  - : SDP được chứa trong thuộc tính {{domxref("RTCSessionDescription.sdp", "sdp")}} là lựa chọn dứt khoát trong quá trình trao đổi. Nói cách khác, mô tả phiên này mô tả cấu hình đã được thống nhất và đang được gửi để hoàn tất quá trình thương lượng.
- `"offer"`
  - : Đối tượng mô tả phiên mô tả lời đề xuất ban đầu trong quá trình trao đổi offer/answer. Quá trình thương lượng phiên bắt đầu bằng việc gửi một offer từ bên gọi đến bên được gọi.
- `"pranswer"`
  - : Đối tượng mô tả phiên mô tả một câu trả lời tạm thời; tức là, một phản hồi cho một offer trước đó nhưng không phải là câu trả lời cuối cùng. Nó thường được sử dụng bởi phần cứng kế thừa.
- `"rollback"`
  - : Loại đặc biệt này với mô tả phiên rỗng được sử dụng để quay lại trạng thái ổn định trước đó.

## Ví dụ

```js
// Mô tả từ xa đã được thiết lập trước đó trên pc, một RTCPeerConnection

alert(pc.remoteDescription.type);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC](/en-US/docs/Web/API/WebRTC_API)
