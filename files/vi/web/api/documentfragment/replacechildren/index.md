---
title: "DocumentFragment: phương thức replaceChildren()"
short-title: replaceChildren()
slug: Web/API/DocumentFragment/replaceChildren
page-type: web-api-instance-method
browser-compat: api.DocumentFragment.replaceChildren
---

{{APIRef("DOM")}}

Phương thức **`DocumentFragment.replaceChildren()`** thay thế các phần tử con hiện có của một `DocumentFragment` bằng một tập hợp phần tử con mới đã chỉ định. Các phần tử này có thể là chuỗi hoặc các đối tượng {{domxref("Node")}}.

## Cú pháp

```js-nolint
replaceChildren(param1)
replaceChildren(param1, param2)
replaceChildren(param1, param2, /* …, */ paramN)
```

### Tham số

- `param1`, …, `paramN`
  - : Một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi để thay thế các phần tử con hiện có của `DocumentFragment`. Nếu không có đối tượng thay thế nào được chỉ định, thì `DocumentFragment` sẽ bị làm trống tất cả các nút con.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném khi [các ràng buộc của cây nút](https://dom.spec.whatwg.org/#concept-node-tree) bị vi phạm.

## Ví dụ

### Làm trống một phân đoạn tài liệu

`replaceChildren()` cung cấp một cơ chế rất tiện lợi để làm trống một phân đoạn tài liệu khỏi tất cả các phần tử con của nó. Bạn gọi nó trên phân đoạn tài liệu mà không có đối số nào được chỉ định:

```js
let fragment = new DocumentFragment();
let div = document.createElement("div");
let p = document.createElement("p");
fragment.append(p);
fragment.prepend(div);

fragment.children; // HTMLCollection [<div>, <p>]

fragment.replaceChildren();

fragment.children; // HTMLCollection []
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DocumentFragment.prepend()")}}
- {{domxref("DocumentFragment.append()")}}
