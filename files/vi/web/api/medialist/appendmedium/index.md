---
title: "MediaList: phương thức appendMedium()"
short-title: appendMedium()
slug: Web/API/MediaList/appendMedium
page-type: web-api-instance-method
browser-compat: api.MediaList.appendMedium
---

{{APIRef("CSSOM")}}

Phương thức `appendMedium()` của giao diện {{DomxRef("MediaList")}} thêm một media query vào danh sách. Nếu media query đã có trong bộ sưu tập, phương thức này không làm gì cả.

## Cú pháp

```js-nolint
appendMedium(medium)
```

### Tham số

- `medium`
  - : Một chuỗi chứa media query cần thêm.

### Giá trị trả về

Không có ([undefined](/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined)).

## Ví dụ

Ví dụ sau thêm media query `print` vào `MediaList` liên quan đến stylesheet đầu tiên được áp dụng cho tài liệu hiện tại.

```js
const stylesheet = document.styleSheets[0];
stylesheet.media.appendMedium("print");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
