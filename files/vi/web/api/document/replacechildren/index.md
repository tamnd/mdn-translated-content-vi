---
title: "Document: replaceChildren() method"
short-title: replaceChildren()
slug: Web/API/Document/replaceChildren
page-type: web-api-instance-method
browser-compat: api.Document.replaceChildren
---

{{APIRef("DOM")}}

Phương thức **`Document.replaceChildren()`** thay thế các phần tử con hiện có của một `Document` bằng một tập hợp phần tử con mới được chỉ định.

## Cú pháp

```js-nolint
replaceChildren(param1)
replaceChildren(param1, param2)
replaceChildren(param1, param2, /* …, */ paramN)
```

### Tham số

- `param1`, …, `paramN`
  - : Một tập hợp các đối tượng {{domxref("Node")}} hoặc chuỗi để thay thế các phần tử con hiện có của `Document`. Nếu không chỉ định đối tượng thay thế nào, thì `Document` sẽ bị xóa tất cả các phần tử con.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném nếu vi phạm [các ràng buộc của cây nút](https://dom.spec.whatwg.org/#concept-node-tree).

## Ví dụ

### Làm trống một tài liệu

`replaceChildren()` cung cấp một cơ chế rất tiện lợi để làm trống một tài liệu khỏi tất cả các phần tử con. Bạn gọi nó trên tài liệu mà không cần đối số nào:

```js
document.replaceChildren();
document.children; // HTMLCollection []
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.prepend()")}}
- {{domxref("Document.append()")}}
