---
title: "HTMLAnchorElement: thuộc tính username"
short-title: username
slug: Web/API/HTMLAnchorElement/username
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.username
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`username`** của giao diện {{domxref("HTMLAnchorElement")}} là một chuỗi chứa thành phần tên người dùng của `href` thuộc phần tử `<a>`. Nếu URL không có tên người dùng, thuộc tính này chứa một chuỗi rỗng, `""`.

Thuộc tính này có thể được đặt để thay đổi tên người dùng của URL. Nếu URL không có {{domxref("HTMLAnchorElement.host", "tên máy chủ")}} hoặc giao thức của nó là `file:`, thì việc đặt thuộc tính này không có tác dụng.

Tên người dùng được {{Glossary("Percent-encoding", "mã hóa phần trăm")} khi đặt nhưng không được giải mã phần trăm khi đọc.

Xem {{domxref("URL.username")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

### Lấy tên người dùng từ một liên kết neo

```js
// Một phần tử <a id="myAnchor" href="https://anonymous:flabada@developer.mozilla.org/en-US/docs/HTMLAnchorElement"> có trong tài liệu
const anchor = document.getElementByID("myAnchor");
anchor.username; // trả về 'anonymous'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAnchorElement")}} mà nó thuộc về.
