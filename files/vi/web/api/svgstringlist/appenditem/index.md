---
title: "SVGStringList: appendItem() method"
short-title: appendItem()
slug: Web/API/SVGStringList/appendItem
page-type: web-api-instance-method
browser-compat: api.SVGStringList.appendItem
---

{{APIRef("SVG")}}

Phương thức **`appendItem()`** của giao diện {{domxref("SVGStringList")}} chèn một phần tử mới vào cuối danh sách. Nếu phần tử đã cho đã có trong một danh sách khác, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này. Phần tử được chèn là chính phần tử đó, không phải bản sao.

## Cú pháp

```js-nolint
appendItem(newItem)
```

### Tham số

- `newItem`
  - : Chuỗi cần thêm vào danh sách.

### Giá trị trả về

Chuỗi đã được thêm vào danh sách.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGStringList")}} tương ứng với thuộc tính chỉ đọc hoặc khi chính đối tượng là chỉ đọc.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
