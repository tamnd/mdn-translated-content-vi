---
title: "SVGLengthList: appendItem() method"
short-title: appendItem()
slug: Web/API/SVGLengthList/appendItem
page-type: web-api-instance-method
browser-compat: api.SVGLengthList.appendItem
---

{{APIRef("SVG")}}

Phương thức **`appendItem()`** của giao diện {{domxref("SVGLengthList")}} chèn một phần tử mới vào cuối danh sách. Nếu phần tử đã cho đã có trong một danh sách khác, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này. Phần tử được chèn là chính phần tử đó, không phải bản sao.

## Cú pháp

```js-nolint
appendItem(newItem)
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
