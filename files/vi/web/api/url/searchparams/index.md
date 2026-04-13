---
title: "URL: thuộc tính searchParams"
short-title: searchParams
slug: Web/API/URL/searchParams
page-type: web-api-instance-property
browser-compat: api.URL.searchParams
---

{{APIRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`searchParams`** của giao diện {{domxref("URL")}} trả về một đối tượng {{domxref("URLSearchParams")}} cho phép truy cập các tham số truy vấn đã giải mã {{httpmethod("GET")}} có trong URL.

## Giá trị

Một đối tượng {{domxref("URLSearchParams")}}.

## Ví dụ

### Cách dùng cơ bản

```js
const params = new URL("https://example.com/?name=Jonathan%20Smith&age=18")
  .searchParams;
const name = params.get("name");
const age = parseInt(params.get("age"), 10);

console.log(`name: ${name}`); // name: Jonathan Smith
console.log(`age: ${age}`); // age: 18
```

### Tương tác với search

Thuộc tính `searchParams` hiển thị chuỗi {{domxref("URL.search")}} dưới dạng một đối tượng {{domxref("URLSearchParams")}}. Khi cập nhật `URLSearchParams` này, `search` của URL sẽ được cập nhật bằng serialization của nó. Tuy nhiên, `URL.search` mã hóa một tập hợp con các ký tự mà `URLSearchParams` mã hóa, và mã hóa khoảng trắng thành `%20` thay vì `+`. Điều này có thể gây ra một vài tương tác bất ngờ - nếu bạn cập nhật `searchParams`, ngay cả với cùng các giá trị, URL vẫn có thể được serialize khác đi.

```js
const url = new URL("https://example.com/?a=b ~");
console.log(url.href); // "https://example.com/?a=b%20~"
console.log(url.searchParams.toString()); // "a=b+%7E"
// Điều này lẽ ra phải là no-op, nhưng nó thay đổi truy vấn của URL
// thành serialization của searchParams
url.searchParams.sort();
console.log(url.href); // "https://example.com/?a=b+%7E"

const url2 = new URL("https://example.com?search=1234&param=my%20param");
console.log(url2.search); // "?search=1234&param=my%20param"
url2.searchParams.delete("search");
console.log(url2.search); // "?param=my+param"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
