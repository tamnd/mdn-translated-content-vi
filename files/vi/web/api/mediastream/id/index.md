---
title: "MediaStream: thuộc tính id"
short-title: id
slug: Web/API/MediaStream/id
page-type: web-api-instance-property
browser-compat: api.MediaStream.id
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính chỉ đọc **`id`** của giao diện {{domxref("MediaStream")}} là một chuỗi chứa 36 ký tự biểu thị một định danh duy nhất (GUID) cho đối tượng.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const promise = navigator.mediaDevices.getUserMedia({
  audio: true,
  video: true,
});

promise.then((stream) => {
  console.log(stream.id);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MediaStream")}}, giao diện mà thuộc tính này thuộc về.
