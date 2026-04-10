---
title: "DocumentFragment: phương thức prepend()"
short-title: prepend()
slug: Web/API/DocumentFragment/prepend
page-type: web-api-instance-method
browser-compat: api.DocumentFragment.prepend
---

{{APIRef("DOM")}}

Phương thức **`DocumentFragment.prepend()`** chèn một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi trước phần tử con đầu tiên của phân đoạn tài liệu. Các chuỗi được chèn dưới dạng các nút {{domxref("Text")}} tương đương.

Phương thức này thêm một phần tử con vào trước `DocumentFragment`. Để thêm vào trước một phần tử bất kỳ trong cây, xem {{domxref("Element.prepend()")}}.

## Cú pháp

```js-nolint
prepend(param1)
prepend(param1, param2)
prepend(param1, param2, /* …, */ paramN)
```

### Tham số

- `param1`, …, `paramN`
  - : Một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi cần chèn.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném khi nút không thể được chèn tại vị trí đã chỉ định trong hệ thống phân cấp.

## Ví dụ

### Thêm một phần tử vào trước phân đoạn tài liệu

```js
let fragment = new DocumentFragment();
let div = document.createElement("div");
let p = document.createElement("p");
fragment.append(p);
fragment.prepend(div);

fragment.children; // HTMLCollection [<div>, <p>]
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DocumentFragment.append()")}}
- {{domxref("Element.prepend()")}}
