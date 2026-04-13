---
title: "MediaList: phương thức deleteMedium()"
short-title: deleteMedium()
slug: Web/API/MediaList/deleteMedium
page-type: web-api-instance-method
browser-compat: api.MediaList.deleteMedium
---

{{APIRef("CSSOM")}}

Phương thức `deleteMedium()` của giao diện {{DOMxRef("MediaList")}} xóa khỏi `MediaList` này media query đã cho.

## Cú pháp

```js-nolint
deleteMedium(medium)
```

### Tham số

- `medium`
  - : Một chuỗi chứa media query cần xóa khỏi danh sách.

### Giá trị trả về

Không có ([undefined](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined)).

### Ngoại lệ

- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra khi media query cần xóa không có trong danh sách.

## Ví dụ

Ví dụ sau xóa media query `print` khỏi `MediaList` liên quan đến stylesheet đầu tiên được áp dụng cho tài liệu hiện tại.

```js
const stylesheet = document.styleSheets[0];
stylesheet.media.deleteMedium("print");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
