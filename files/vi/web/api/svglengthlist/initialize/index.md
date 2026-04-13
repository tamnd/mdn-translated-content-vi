---
title: "SVGLengthList: initialize() method"
short-title: initialize()
slug: Web/API/SVGLengthList/initialize
page-type: web-api-instance-method
browser-compat: api.SVGLengthList.initialize
---

{{APIRef("SVG")}}

Phương thức **`initialize()`** của giao diện {{domxref("SVGLengthList")}} xóa tất cả các phần tử hiện có khỏi danh sách và khởi tạo lại danh sách để chứa phần tử duy nhất được chỉ định bởi tham số. Nếu phần tử được chèn đã có trong một danh sách khác, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này. Phần tử được chèn là chính phần tử đó, không phải bản sao. Giá trị trả về là phần tử được chèn vào danh sách.

## Cú pháp

```js-nolint
initialize(newItem)
```

### Tham số

- `newItem`
  - : {{domxref("SVGLength")}} cần thêm vào danh sách.

### Giá trị trả về

{{domxref("SVGLength")}} đã được thêm vào danh sách.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra khi danh sách là chỉ đọc.

## Ví dụ

Xem {{domxref("SVGLengthList")}} để xem ví dụ đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
