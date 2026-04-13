---
title: "DocumentFragment: phương thức querySelectorAll()"
short-title: querySelectorAll()
slug: Web/API/DocumentFragment/querySelectorAll
page-type: web-api-instance-method
browser-compat: api.DocumentFragment.querySelectorAll
---

{{ApiRef("DOM")}}

Phương thức **`DocumentFragment.querySelectorAll()`** trả về một {{domxref("NodeList")}} của các phần tử trong {{domxref("DocumentFragment")}} (sử dụng duyệt đệ quy các nút của tài liệu theo thứ tự trước) khớp với nhóm bộ chọn đã chỉ định.

Nếu các bộ chọn được chỉ định trong tham số không hợp lệ, một {{domxref("DOMException")}} với giá trị `SYNTAX_ERR` sẽ được ném ra.

## Cú pháp

```js-nolint
querySelectorAll(selectors)
```

### Tham số

- `selectors`
  - : Một chuỗi chứa một hoặc nhiều bộ chọn CSS được phân tách bằng dấu phẩy.

### Giá trị trả về

Một {{domxref("NodeList")}} không trực tiếp chứa một đối tượng {{domxref("Element")}} cho mỗi phần tử khớp với ít nhất một trong các bộ chọn đã chỉ định hoặc một {{domxref("NodeList")}} rỗng trong trường hợp không có kết quả khớp.

## Ví dụ

Ví dụ này trả về danh sách tất cả các phần tử `div` trong `DocumentFragment` có lớp là `note` hoặc `alert`:

```js
const matches = documentFrag.querySelectorAll("div.note, div.alert");
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("DocumentFragment")}} mà nó thuộc về.
