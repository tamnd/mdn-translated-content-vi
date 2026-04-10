---
title: "DocumentFragment: phương thức querySelectorAll()"
short-title: querySelectorAll()
slug: Web/API/DocumentFragment/querySelectorAll
page-type: web-api-instance-method
browser-compat: api.DocumentFragment.querySelectorAll
---

{{ApiRef("DOM")}}

Phương thức **`DocumentFragment.querySelectorAll()`** trả về một {{domxref("NodeList")}} các phần tử bên trong {{domxref("DocumentFragment")}} (dùng duyệt theo thứ tự tiền tố theo chiều sâu của các nút trong tài liệu) khớp với nhóm bộ chọn đã chỉ định.

Nếu các bộ chọn được chỉ định trong tham số không hợp lệ, một {{domxref("DOMException")}} với giá trị `SYNTAX_ERR` sẽ được ném ra.

## Cú pháp

```js-nolint
querySelectorAll(selectors)
```

### Tham số

- `selectors`
  - : Một chuỗi chứa một hoặc nhiều bộ chọn CSS được phân tách bằng dấu phẩy.

### Giá trị trả về

Một {{domxref("NodeList")}} không động chứa một đối tượng {{domxref("Element")}} cho mỗi phần tử khớp với ít nhất một trong các bộ chọn đã chỉ định, hoặc một {{domxref("NodeList")}} rỗng nếu không có kết quả khớp nào.

## Ví dụ

Ví dụ này trả về danh sách tất cả các phần tử `div` bên trong `DocumentFragment` có lớp là `note` hoặc `alert`:

```js
const matches = documentFrag.querySelectorAll("div.note, div.alert");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("DocumentFragment")}} mà nó thuộc về.
