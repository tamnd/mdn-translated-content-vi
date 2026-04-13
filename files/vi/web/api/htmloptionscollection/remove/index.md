---
title: "HTMLOptionsCollection: remove() method"
short-title: remove()
slug: Web/API/HTMLOptionsCollection/remove
page-type: web-api-instance-method
browser-compat: api.HTMLOptionsCollection.remove
---

{{ APIRef("HTML DOM") }}

Phương thức **`remove()`** của giao diện {{DOMxRef("HTMLOptionsCollection")}} xóa phần tử {{HTMLelement("option")}} được chỉ định bởi chỉ số khỏi tập hợp này.

## Cú pháp

```js-nolint
remove(index)
```

### Tham số

- `index`
  - : Một số nguyên bắt đầu từ 0 cho chỉ số của {{ domxref("HTMLOptionElement") }} trong {{DOMxRef("HTMLOptionsCollection")}}. Nếu chỉ số không được tìm thấy, phương thức không có hiệu lực.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const optionList = document.querySelector("select").options;
const listLength = optionList.length;
optionList.remove(listLength - 1); // removes the last item
optionList.remove(0); // removes the first item
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("HTMLOptionsCollection.add()")}}
- {{DOMxRef("HTMLOptionsCollection.length")}}
- {{DOMxRef("HTMLOptionsCollection.selectedIndex")}}
- {{domxref("HTMLOptionsCollection")}}
- {{domxref("Element.remove")}}
