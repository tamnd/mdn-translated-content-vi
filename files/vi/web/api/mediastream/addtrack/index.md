---
title: "MediaStream: phương thức addTrack()"
short-title: addTrack()
slug: Web/API/MediaStream/addTrack
page-type: web-api-instance-method
browser-compat: api.MediaStream.addTrack
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`addTrack()`** của giao diện {{domxref("MediaStream")}} thêm một track mới vào luồng. Track được chỉ định làm tham số có kiểu {{domxref("MediaStreamTrack")}}.

> [!NOTE]
> Nếu track được chỉ định đã nằm trong tập hợp track của luồng, phương thức này không có hiệu lực.

## Cú pháp

```js-nolint
addTrack(track)
```

### Tham số

- `track`
  - : Một {{domxref("MediaStreamTrack")}} cần thêm vào luồng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaStream")}}, giao diện mà nó thuộc về.
