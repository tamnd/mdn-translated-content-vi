---
title: "Selection: phương thức extend()"
short-title: extend()
slug: Web/API/Selection/extend
page-type: web-api-instance-method
browser-compat: api.Selection.extend
---

{{ ApiRef("DOM") }}

Phương thức **`Selection.extend()`** di chuyển focus của vùng chọn tới một điểm đã chỉ định. Anchor của vùng chọn không di chuyển. Vùng chọn sẽ kéo dài từ anchor đến focus mới, bất kể hướng.

## Cú pháp

```js-nolint
extend(node)
extend(node, offset)
```

### Tham số

- `node`
  - : Nút mà focus sẽ được di chuyển vào bên trong.
- `offset` {{optional_inline}}
  - : Vị trí độ lệch trong `node` mà focus sẽ được di chuyển tới. Nếu không chỉ định, giá trị mặc định `0` sẽ được dùng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}, giao diện mà nó thuộc về.
