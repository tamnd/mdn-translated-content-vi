---
title: "AudioDecoder: phương thức flush()"
short-title: flush()
slug: Web/API/AudioDecoder/flush
page-type: web-api-instance-method
browser-compat: api.AudioDecoder.flush
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`flush()`** của giao diện {{domxref("AudioDecoder")}} trả về một Promise được hoàn tất sau khi mọi thông điệp đang chờ trong hàng đợi đã được hoàn tất.

## Cú pháp

```js-nolint
flush()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được hoàn tất với undefined.

### Ngoại lệ

Nếu xảy ra lỗi, promise sẽ được hoàn tất với một trong các ngoại lệ sau:

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu Promise bị từ chối vì {{domxref("AudioDecoder.state","state")}} không phải là `configured`.

## Ví dụ

Ví dụ sau flush `AudioDecoder`.

```js
await audioDecoder.flush();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
