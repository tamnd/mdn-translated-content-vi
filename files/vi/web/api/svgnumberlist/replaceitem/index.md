---
title: "SVGNumberList: replaceItem() method"
short-title: replaceItem()
slug: Web/API/SVGNumberList/replaceItem
page-type: web-api-instance-method
browser-compat: api.SVGNumberList.replaceItem
---

{{APIRef("SVG")}}

Phương thức **`replaceItem()`** của giao diện {{domxref("SVGNumberList")}} thay thế một phần tử hiện có trong danh sách bằng một phần tử mới. Nếu phần tử mới đã có trong một danh sách khác, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này. Phần tử được chèn là chính phần tử đó, không phải bản sao. Nếu phần tử đã có trong danh sách này, lưu ý rằng chỉ mục của phần tử cần thay thế là trước khi xóa phần tử.

## Cú pháp

```js-nolint
replaceItem(newItem, index)
```

### Tham số

- `newItem`
  - : {{domxref("SVGNumber")}} cần thêm vào danh sách.
- `index`
  - : Một số nguyên không âm chỉ định chỉ mục của phần tử cần xóa.

### Giá trị trả về

{{domxref("SVGNumber")}} đã được thêm vào danh sách.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("SVGNumberList")}} tương ứng với thuộc tính chỉ đọc hoặc khi chính đối tượng là chỉ đọc.
- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra khi chỉ mục nằm ngoài phạm vi của danh sách.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
