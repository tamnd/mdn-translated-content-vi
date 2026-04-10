---
title: "Location: thuộc tính search"
short-title: search
slug: Web/API/Location/search
page-type: web-api-instance-property
browser-compat: api.Location.search
---

{{ApiRef("Location")}}

Thuộc tính **`search`** của giao diện {{domxref("Location")}} là một chuỗi tìm kiếm, còn gọi là _query string_, chứa một `"?"` theo sau là các tham số của URL vị trí. Nếu URL không có truy vấn tìm kiếm, thuộc tính này chứa chuỗi rỗng `""`.

Thuộc tính này có thể được đặt để thay đổi query string của URL. Khi đặt, một tiền tố đơn `"?"` sẽ được thêm vào giá trị được cung cấp nếu chưa có. Đặt thành `""` sẽ xóa query string.

Truy vấn được {{Glossary("Percent-encoding", "percent-encoded")}} khi đặt nhưng không được giải mã phần trăm khi đọc.

Các trình duyệt hiện đại cung cấp [`URLSearchParams`](/en-US/docs/Web/API/URLSearchParams/get#examples) và [`URL.searchParams`](/en-US/docs/Web/API/URL/searchParams#examples) để dễ dàng phân tích các tham số từ query string.

Xem {{domxref("URL.search")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Giả sử phần tử <a id="myAnchor" href="/en-US/docs/Location.search?q=123"> nằm trong tài liệu
const anchor = document.getElementById("myAnchor");
const queryString = anchor.search; // Trả về:'?q=123'

// Phân tích tiếp:
const params = new URLSearchParams(queryString);
const q = parseInt(params.get("q"), 10); // là số 123
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
