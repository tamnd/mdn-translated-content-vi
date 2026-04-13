---
title: "SVGLengthList: replaceItem() method"
short-title: replaceItem()
slug: Web/API/SVGLengthList/replaceItem
page-type: web-api-instance-method
browser-compat: api.SVGLengthList.replaceItem
---

{{APIRef("SVG")}}

Phương thức **`replaceItem()`** của giao diện {{domxref("SVGLengthList")}} thay thế một phần tử hiện có trong danh sách bằng một phần tử mới. Nếu phần tử mới đã có trong một danh sách khác, nó sẽ bị xóa khỏi danh sách trước đó trước khi được chèn vào danh sách này. Phần tử được chèn là chính phần tử đó, không phải bản sao. Nếu phần tử đã có trong danh sách này, lưu ý rằng chỉ mục của phần tử cần thay thế là trước khi xóa phần tử.

## Cú pháp

```js-nolint
replaceItem(newItem, index)
```

### Tham số

- `newItem`
  - : {{domxref("SVGLength")}} cần thêm vào danh sách.
- `index`
  - : Một số nguyên không âm chỉ định chỉ mục của phần tử cần xóa.

### Giá trị trả về

{{domxref("SVGLength")}} đã được thêm vào danh sách.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra khi danh sách là chỉ đọc.
- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra khi chỉ mục nằm ngoài phạm vi của danh sách.

## Ví dụ

Xem {{domxref("SVGLengthList")}} để xem ví dụ đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
