---
title: "DocumentFragment: phương thức prepend()"
short-title: prepend()
slug: Web/API/DocumentFragment/prepend
page-type: web-api-instance-method
browser-compat: api.DocumentFragment.prepend
---

{{APIRef("DOM")}}

Phương thức **`DocumentFragment.prepend()`** chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi trước phần tử con đầu tiên của document fragment. Chuỗi sẽ được chèn dưới dạng các nút {{domxref("Text")}} tương ứng.

Phương thức này thêm một phần tử con lên đầu `DocumentFragment`. Để thêm lên đầu một phần tử bất kỳ trong cây, hãy xem {{domxref("Element.prepend()")}}.

## Cú pháp

```js-nolint
prepend(param1)
prepend(param1, param2)
prepend(param1, param2, /* …, */ paramN)
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

### Thêm một phần tử lên đầu document fragment

```js
let fragment = new DocumentFragment();
let div = document.createElement("div");
let p = document.createElement("p");
fragment.append(p);
fragment.prepend(div);

fragment.children; // HTMLCollection [<div>, <p>]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DocumentFragment.append()")}}
- {{domxref("Element.prepend()")}}
