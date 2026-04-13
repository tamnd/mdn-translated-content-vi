---
title: "DocumentFragment: phương thức querySelector()"
short-title: querySelector()
slug: Web/API/DocumentFragment/querySelector
page-type: web-api-instance-method
browser-compat: api.DocumentFragment.querySelector
---

{{ApiRef("DOM")}}

Phương thức **`DocumentFragment.querySelector()`** trả về phần tử đầu tiên, hoặc `null` nếu không tìm thấy kết quả khớp, trong {{domxref("DocumentFragment")}} (sử dụng duyệt đệ quy các nút của tài liệu theo thứ tự trước) khớp với nhóm bộ chọn đã chỉ định.

Nếu bộ chọn khớp với một ID và ID này được sử dụng sai nhiều lần trong tài liệu, nó trả về phần tử khớp đầu tiên.

Nếu các bộ chọn được chỉ định trong tham số không hợp lệ, một {{domxref("DOMException")}} với giá trị `SYNTAX_ERR` sẽ được ném ra.

## Cú pháp

```js-nolint
querySelector(selectors)
```

### Tham số

- `selectors`
  - : Một chuỗi chứa một hoặc nhiều bộ chọn CSS được phân tách bằng dấu phẩy.

### Giá trị trả về

Một đối tượng {{domxref("Element")}} đại diện cho phần tử đầu tiên trong tài liệu khớp với tập hợp [bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors) đã chỉ định, hoặc `null` được trả về nếu không có kết quả khớp.

## Ví dụ

### Ví dụ cơ bản

Trong ví dụ cơ bản này, phần tử đầu tiên trong {{domxref("DocumentFragment")}} có lớp `myclass` được trả về:

```js
const el = documentfragment.querySelector(".myclass");
```

### Cú pháp CSS và đối số của phương thức

Chuỗi đối số truyền cho `querySelector` phải tuân theo cú pháp CSS. Để khớp với ID hoặc các bộ chọn không tuân theo cú pháp CSS (ví dụ: sử dụng dấu chấm phẩy hoặc dấu cách không đúng cách), bắt buộc phải thoát ký tự sai bằng hai dấu gạch chéo ngược:

```html
<div id="foo\bar"></div>
<div id="foo:bar"></div>
```

```js
document.querySelector("#foo\bar"); // Không khớp với gì cả
document.querySelector("#foo\\\\bar"); // Khớp với div đầu tiên
document.querySelector("#foo:bar"); // Không khớp với gì cả
document.querySelector("#foo\\:bar"); // Khớp với div thứ hai
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("DocumentFragment")}} mà nó thuộc về.
