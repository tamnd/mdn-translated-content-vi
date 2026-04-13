---
title: "ImageDecoder: thuộc tính tracks"
short-title: tracks
slug: Web/API/ImageDecoder/tracks
page-type: web-api-instance-property
browser-compat: api.ImageDecoder.tracks
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`tracks`** của giao diện {{domxref("ImageDecoder")}} trả về danh sách các track trong dữ liệu hình ảnh đã mã hóa.

## Giá trị

Một {{domxref("ImageTrackList")}}.

## Ví dụ

Ví dụ sau đây in giá trị của `tracks` ra console. Đây sẽ là một đối tượng {{domxref("ImageTrackList")}}.

```js
console.log(imageDecoder.tracks);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
