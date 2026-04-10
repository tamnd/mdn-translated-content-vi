---
title: "Document: thuộc tính referrer"
short-title: referrer
slug: Web/API/Document/referrer
page-type: web-api-instance-property
browser-compat: api.Document.referrer
---

{{APIRef("DOM")}}

Thuộc tính **`Document.referrer`** trả về [URI](https://www.w3.org/Addressing/#background) của trang đã liên kết đến trang này.

## Giá trị

Giá trị là một chuỗi rỗng nếu người dùng điều hướng đến trang trực tiếp (không thông qua một liên kết, mà ví dụ bằng cách sử dụng bookmark). Vì thuộc tính này chỉ trả về một chuỗi, nó không cung cấp quyền truy cập DOM đến trang giới thiệu.

Bên trong một {{HTMLElement("iframe")}}, `Document.referrer` ban đầu sẽ được đặt thành {{domxref("HTMLAnchorElement/href", "href")}} của {{domxref("Window/location", "Window.location")}} cha trong các yêu cầu same-origin. Trong các yêu cầu cross-origin, theo mặc định nó là {{domxref("HTMLAnchorElement/origin", "origin")}} của `Window.location` cha. Để biết thêm thông tin, xem tài liệu [Referrer-Policy: strict-origin-when-cross-origin](/en-US/docs/Web/HTTP/Reference/Headers/Referrer-Policy#strict-origin-when-cross-origin).

## Ví dụ

Đoạn mã sau sẽ ghi lại một chuỗi chứa referrer của tài liệu.

```js
console.log(document.referrer);
```

Nếu người dùng điều hướng đến trang thông qua một liên kết như `<a href="https://www.w3.org/">W3</a>`, thì nó sẽ xuất ra domain trước đó như `developer.mozilla.org`. Nếu người dùng điều hướng đến trang trực tiếp, nó sẽ xuất ra một chuỗi rỗng.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
