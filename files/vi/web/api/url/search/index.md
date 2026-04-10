---
title: "URL: thuộc tính search"
short-title: search
slug: Web/API/URL/search
page-type: web-api-instance-property
browser-compat: api.URL.search
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính **`search`** của giao diện {{domxref("URL")}} là một chuỗi tìm kiếm, còn gọi là _query string_, là một chuỗi chứa `"?"` theo sau bởi các tham số của URL. Nếu URL không có truy vấn tìm kiếm, thuộc tính này chứa chuỗi rỗng, `""`.

Thuộc tính này có thể được đặt để thay đổi query string của URL. Khi đặt, một tiền tố `"?"` duy nhất sẽ được thêm vào giá trị được cung cấp nếu nó chưa có sẵn. Đặt nó thành `""` sẽ xóa query string.

Truy vấn được {{Glossary("Percent-encoding", "mã hóa phần trăm")}} khi đặt nhưng không được giải mã phần trăm khi đọc.

Các trình duyệt hiện đại cung cấp thuộc tính {{domxref("URL.searchParams")}} để dễ dàng phân tích các tham số từ query string.

## Giá trị

Một chuỗi.

## Ví dụ

### Cách dùng cơ bản

```js
const url = new URL(
  "https://developer.mozilla.org/en-US/docs/Web/API/URL/search?q=123",
);
console.log(url.search); // Logs "?q=123"
```

### Tương tác với searchParams

Thuộc tính {{domxref("URL.searchParams")}} hiển thị chuỗi `search` dưới dạng một đối tượng {{domxref("URLSearchParams")}}. Khi cập nhật `URLSearchParams` này, `search` của URL sẽ được cập nhật bằng serialization của nó. Tuy nhiên, `URL.search` mã hóa một tập hợp con các ký tự mà `URLSearchParams` mã hóa, và mã hóa khoảng trắng thành `%20` thay vì `+`. Điều này có thể gây ra một vài tương tác bất ngờ - nếu bạn cập nhật `searchParams`, ngay cả với cùng các giá trị, URL vẫn có thể được serialize khác đi.

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

## Xem thêm

- Giao diện {{domxref("URL")}} mà thuộc tính này thuộc về.
