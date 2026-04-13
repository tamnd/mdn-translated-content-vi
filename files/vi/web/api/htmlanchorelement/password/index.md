---
title: "HTMLAnchorElement: thuộc tính password"
short-title: password
slug: Web/API/HTMLAnchorElement/password
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.password
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`password`** của giao diện {{domxref("HTMLAnchorElement")}} là một chuỗi chứa thành phần mật khẩu của `href` thuộc phần tử `<a>`. Nếu URL không có mật khẩu, thuộc tính này chứa một chuỗi rỗng, `""`.

Thuộc tính này có thể được đặt để thay đổi mật khẩu của URL. Nếu URL không có {{domxref("HTMLAnchorElement.host", "tên máy chủ")}} hoặc giao thức của nó là `file:`, thì việc đặt thuộc tính này không có tác dụng.

Mật khẩu được {{Glossary("Percent-encoding", "mã hóa phần trăm")} khi đặt nhưng không được giải mã phần trăm khi đọc.

Xem {{domxref("URL.password")}} để biết thêm thông tin.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Một <a id="myAnchor" href="https://anonymous:flabada@developer.mozilla.org/en-US/docs/HTMLAnchorElement"> có trong tài liệu
const anchor = document.getElementByID("myAnchor");
anchor.password; // trả về 'flabada'
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Giao diện {{domxref("HTMLAnchorElement")}} mà nó thuộc về.
