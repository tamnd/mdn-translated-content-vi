---
title: "SVGNumberList: appendItem() method"
short-title: appendItem()
slug: Web/API/SVGNumberList/appendItem
page-type: web-api-instance-method
browser-compat: api.SVGNumberList.appendItem
---

{{APIRef("SVG")}}

Phương thức **`appendItem()`** của giao diện {{domxref("SVGNumberList")}} chèn một phần tử mới vào cuối danh sách. Nếu phần tử đã cho đã có trong một danh sách khác, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này. Phần tử được chèn là chính phần tử đó, không phải bản sao.

## Cú pháp

```js-nolint
appendItem(newItem)
```

### Tham số

- `newItem`
  - : {{domxref("SVGNumber")}} cần thêm vào danh sách.

### Giá trị trả về

{{domxref("SVGNumber")}} đã được thêm vào danh sách.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGNumberList")}} tương ứng với thuộc tính chỉ đọc hoặc khi chính đối tượng là chỉ đọc.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
