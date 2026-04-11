---
title: "RTCPeerConnection: phương thức createAnswer()"
short-title: createAnswer()
slug: Web/API/RTCPeerConnection/createAnswer
page-type: web-api-instance-method
browser-compat: api.RTCPeerConnection.createAnswer
---

{{APIRef("WebRTC")}}

Phương thức **`createAnswer()`** của giao diện {{domxref("RTCPeerConnection")}} bắt đầu tạo một câu trả lời {{Glossary("SDP")}} cho một offer nhận được từ máy ngang hàng từ xa trong quá trình thương lượng offer/answer của kết nối WebRTC.
Câu trả lời chứa thông tin về media đã gắn vào phiên, các codec và tùy chọn được trình duyệt hỗ trợ, cùng với mọi {{Glossary("ICE")}} candidate đã thu thập.

## Cú pháp

```js-nolint
createAnswer()

createAnswer(successCallback, failureCallback) // deprecated
```

### Tham số

Không có.

### Tham số lỗi thời

- `successCallback` {{deprecated_inline}}
  - : Hàm được gọi khi câu trả lời được tạo thành công.
- `failureCallback` {{deprecated_inline}}
  - : Hàm được gọi nếu việc tạo câu trả lời thất bại.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một đối tượng {{domxref("RTCSessionDescription")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu trạng thái báo hiệu của kết nối không cho phép tạo answer.

## Ví dụ

```js
pc.createAnswer().then((answer) => {
  return pc.setLocalDescription(answer);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
