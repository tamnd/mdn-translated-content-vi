---
title: "DocumentFragment: phương thức replaceChildren()"
short-title: replaceChildren()
slug: Web/API/DocumentFragment/replaceChildren
page-type: web-api-instance-method
browser-compat: api.DocumentFragment.replaceChildren
---

{{APIRef("DOM")}}

Phương thức **`DocumentFragment.replaceChildren()`** thay thế các phần tử con hiện có của `DocumentFragment` bằng một tập hợp phần tử con mới được chỉ định. Các phần tử này có thể là chuỗi hoặc đối tượng {{domxref("Node")}}.

## Cú pháp

```js-nolint
replaceChildren(param1)
replaceChildren(param1, param2)
replaceChildren(param1, param2, /* …, */ paramN)
```

### Tham số

- `param1`, …, `paramN`
  - : Một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi để thay thế các phần tử con hiện có của `DocumentFragment`. Nếu không chỉ định đối tượng thay thế nào, thì toàn bộ các nút con của `DocumentFragment` sẽ bị xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném ra khi [các ràng buộc của cây nút](https://dom.spec.whatwg.org/#concept-node-tree) bị vi phạm.

## Ví dụ

### Xóa rỗng một document fragment

`replaceChildren()` cung cấp một cơ chế rất thuận tiện để xóa toàn bộ các phần tử con của một document fragment. Bạn gọi nó trên document fragment mà không truyền đối số nào:

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DocumentFragment.prepend()")}}
- {{domxref("DocumentFragment.append()")}}
