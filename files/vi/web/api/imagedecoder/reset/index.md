---
title: "ImageDecoder: phương thức reset()"
short-title: reset()
slug: Web/API/ImageDecoder/reset
page-type: web-api-instance-method
browser-compat: api.ImageDecoder.reset
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`reset()`** của giao diện {{domxref("ImageDecoder")}} hủy tất cả các thao tác `decode()` đang chờ; từ chối tất cả các promise đang chờ. Tất cả các trạng thái khác sẽ không thay đổi. Các phương thức của lớp vẫn có thể được gọi sau `reset()`. Ví dụ, gọi `decode()` sau `reset()` là được phép.

## Cú pháp

```js-nolint
reset()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau đây đặt lại `ImageDecoder`.

```js
for (let i = 0; i < imageDecoder.tracks.selectedTrack.frameCount; ++i)
  imageDecoder.decode({ frameIndex: i }).catch(console.log);
imageDecoder.reset();
imageDecoder.decode({ frameIndex: 0 }).then(console.log);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
