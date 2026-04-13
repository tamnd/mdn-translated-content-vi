---
title: "MediaList: thuộc tính length"
short-title: length
slug: Web/API/MediaList/length
page-type: web-api-instance-property
browser-compat: api.MediaList.length
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`length`** của giao diện {{DOMxRef("MediaList")}} trả về số lượng media query trong danh sách.

## Giá trị

Một số nguyên dương.

## Ví dụ

Ví dụ sau sẽ ghi vào console số lượng media query được lưu trong `MediaList` liên quan đến stylesheet đầu tiên được áp dụng cho tài liệu hiện tại.

```js
const stylesheets = document.styleSheets;
const stylesheet = stylesheets[0];
console.log(stylesheet.media.length);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
