---
title: "MediaStreamTrack: phương thức clone()"
short-title: clone()
slug: Web/API/MediaStreamTrack/clone
page-type: web-api-instance-method
browser-compat: api.MediaStreamTrack.clone
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`clone()`** của giao diện {{domxref("MediaStreamTrack")}}
tạo ra một bản sao của `MediaStreamTrack`. Đối tượng
`MediaStreamTrack` mới này giống hệt ngoại trừ
{{domxref("MediaStreamTrack.id", "id")}} duy nhất của nó.

## Cú pháp

```js-nolint
clone()
```

### Tham số

Không có.

### Giá trị trả về

Một instance {{domxref("MediaStreamTrack")}} mới giống hệt với instance mà
`clone()` được gọi, ngoại trừ {{domxref("MediaStreamTrack.id", "id")}} duy nhất mới của nó.

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}
