---
title: MediaKeys.createSession()
slug: Web/API/MediaKeys/createSession
page-type: web-api-instance-method
browser-compat: api.MediaKeys.createSession
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Phương thức **`createSession()`** của giao diện {{domxref("MediaKeys")}} trả về một đối tượng {{domxref("MediaKeySession")}} mới, đại diện cho bối cảnh để trao đổi tin nhắn với máy chủ giấy phép.

## Cú pháp

```js-nolint
createSession()
createSession(mediaKeySessionType)
```

### Tham số

- `mediaKeySessionType` {{optional_inline}}
  - : Chuỗi. Một trong `"temporary"` (tạm thời) hoặc `"persistent-license"` (giấy phép liên tục). Mặc định là `"temporary"`.

### Giá trị trả về

Đối tượng {{domxref("MediaKeySession")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
