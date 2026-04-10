---
title: "DocumentFragment: phương thức append()"
short-title: append()
slug: Web/API/DocumentFragment/append
page-type: web-api-instance-method
browser-compat: api.DocumentFragment.append
---

{{APIRef("DOM")}}

Phương thức **`DocumentFragment.append()`** chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi sau phần tử con cuối cùng của document fragment. Chuỗi sẽ được chèn dưới dạng các nút {{domxref("Text")}} tương ứng.

Phương thức này thêm một phần tử con vào `DocumentFragment`. Để thêm vào một phần tử bất kỳ trong cây, hãy xem {{domxref("Element.append()")}}.

## Cú pháp

```js-nolint
append(param1)
append(param1, param2)
append(param1, param2, /* …, */ paramN)
```

### Tham số

- `param1`, …, `paramN`
  - : Một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi để chèn vào.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném ra khi nút không thể được chèn tại vị trí đã chỉ định trong cây phân cấp.

## Ví dụ

### Thêm một phần tử vào document fragment

```js
let fragment = new DocumentFragment();
let div = document.createElement("div");
fragment.append(div);

fragment.children; // HTMLCollection [<div>]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DocumentFragment.prepend()")}}
- {{domxref("Element.append()")}}
