---
title: MediaKeyMessageEvent()
slug: Web/API/MediaKeyMessageEvent/MediaKeyMessageEvent
page-type: web-api-constructor
browser-compat: api.MediaKeyMessageEvent.MediaKeyMessageEvent
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Hàm khởi tạo **`MediaKeyMessageEvent()`** tạo ra một đối tượng {{domxref("MediaKeyMessageEvent")}} mới.

## Cú pháp

```js-nolint
new MediaKeyMessageEvent(type, options)
```

### Tham số

- `type`
  - : Chuỗi với tên của sự kiện. Giá trị này phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt nó là `message`.
- `options`
  - : Đối tượng có _thêm_ các thuộc tính bắt buộc, ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}:
    - `messageType`
      - : Chuỗi chứa loại tin nhắn. Có thể là `"license-request"` (yêu cầu giấy phép), `"license-renewal"` (gia hạn giấy phép), `"license-release"` (giải phóng giấy phép), `"individualization-request"` (yêu cầu cá nhân hóa), hoặc `"status-request"` (yêu cầu trạng thái).
    - `message`
      - : {{jsxref("ArrayBuffer")}} chứa tin nhắn CDM.

### Giá trị trả về

Đối tượng {{domxref("MediaKeyMessageEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
