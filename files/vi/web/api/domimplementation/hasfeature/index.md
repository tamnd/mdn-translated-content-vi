---
title: "DOMImplementation: hasFeature() method"
short-title: hasFeature()
slug: Web/API/DOMImplementation/hasFeature
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.DOMImplementation.hasFeature
---

{{ApiRef("DOM")}}{{Deprecated_Header}}

Phương thức **`DOMImplementation.hasFeature()`** trả về một cờ boolean cho biết một tính năng nhất định có được hỗ trợ hay không. Nó đã lỗi thời và các trình duyệt hiện đại trả về `true` trong mọi trường hợp.

Các triển khai khác nhau khá phân kỳ về loại tính năng nào được báo cáo. Phiên bản mới nhất của thông số kỹ thuật đã buộc phương thức này luôn trả về `true`, nơi chức năng chính xác và được sử dụng.

## Cú pháp

```js-nolint
hasFeature(feature, version)
```

### Tham số

- `feature`
  - : Một chuỗi đại diện cho tên tính năng.
- `version`
  - : Một chuỗi đại diện cho phiên bản của thông số kỹ thuật định nghĩa tính năng.

### Giá trị trả về

Giá trị boolean `true`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("DOMImplementation")}} mà nó thuộc về.
