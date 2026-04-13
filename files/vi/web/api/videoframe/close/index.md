---
title: "VideoFrame: close() method"
short-title: close()
slug: Web/API/VideoFrame/close
page-type: web-api-instance-method
browser-compat: api.VideoFrame.close
---

{{APIRef("Web Codecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`close()`** của giao diện {{domxref("VideoFrame")}} xóa tất cả trạng thái và giải phóng tham chiếu đến tài nguyên media.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Undefined.

## Ví dụ

Ví dụ sau cho thấy đối tượng `VideoFrame` đang được đóng.

```js
VideoFrame.close();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
