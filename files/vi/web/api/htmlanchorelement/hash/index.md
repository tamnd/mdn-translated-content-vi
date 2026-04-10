---
title: "HTMLAnchorElement: thuộc tính hash"
short-title: hash
slug: Web/API/HTMLAnchorElement/hash
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.hash
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`hash`** của giao diện {{domxref("HTMLAnchorElement")}} là một chuỗi chứa một `"#"` theo sau là định danh phân đoạn của `href` thuộc phần tử `<a>`. Nếu URL không có định danh phân đoạn, thuộc tính này chứa một chuỗi rỗng, `""`.

Xem {{domxref("URL.hash")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

### Lấy hash từ một liên kết neo

Cho phần HTML sau

```html
<a id="myAnchor" href="/en-US/docs/Web/API/HTMLAnchorElement/hash#examples">
  Ví dụ
</a>
```

bạn có thể lấy hash của neo như sau:

```js
const anchor = document.getElementById("myAnchor");
anchor.hash; // '#examples'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAnchorElement")}} mà nó thuộc về.
