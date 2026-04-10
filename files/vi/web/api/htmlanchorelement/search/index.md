---
title: "HTMLAnchorElement: thuộc tính search"
short-title: search
slug: Web/API/HTMLAnchorElement/search
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.search
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`search`** của giao diện {{domxref("HTMLAnchorElement")}} là một chuỗi tìm kiếm, còn gọi là _chuỗi truy vấn_, chứa một `"?"` theo sau là các tham số của `href` thuộc phần tử `<a>`. Nếu URL không có chuỗi truy vấn, thuộc tính này chứa một chuỗi rỗng, `""`.

Thuộc tính này có thể được đặt để thay đổi chuỗi truy vấn của URL. Khi đặt, một tiền tố `"?"` duy nhất được thêm vào giá trị được cung cấp, nếu chưa có. Việc đặt nó thành `""` sẽ xóa chuỗi truy vấn.

Chuỗi truy vấn được {{Glossary("Percent-encoding", "mã hóa phần trăm")} khi đặt nhưng không được giải mã phần trăm khi đọc.

Các trình duyệt hiện đại cung cấp
[`URLSearchParams`](/en-US/docs/Web/API/URLSearchParams/get#examples)
và
[`URL.searchParams`](/en-US/docs/Web/API/URL/searchParams#examples)
để giúp phân tích cú pháp các tham số từ chuỗi truy vấn một cách dễ dàng.

Xem {{domxref("URL.search")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

### Lấy chuỗi tìm kiếm từ một liên kết neo

```js
// Một phần tử <a id="myAnchor" href="/en-US/docs/HTMLAnchorElement?q=123"> có trong tài liệu
const anchor = document.getElementById("myAnchor");
anchor.search; // trả về '?q=123'
```

### Phân tích nâng cao bằng URLSearchParams

Ngoài ra, có thể sử dụng [`URLSearchParams`](/en-US/docs/Web/API/URLSearchParams/get#examples):

```js
let params = new URLSearchParams(queryString);
let q = parseInt(params.get("q"), 10); // trả về số 123
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAnchorElement")}} mà nó thuộc về.
