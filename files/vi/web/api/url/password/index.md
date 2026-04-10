---
title: "URL: thuộc tính password"
short-title: password
slug: Web/API/URL/password
page-type: web-api-instance-property
browser-compat: api.URL.password
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính **`password`** của giao diện {{domxref("URL")}} là một chuỗi chứa thành phần mật khẩu của URL. Nếu URL không có mật khẩu, thuộc tính này chứa chuỗi rỗng, `""`.

Thuộc tính này có thể được đặt để thay đổi mật khẩu của URL. Nếu URL không có {{domxref("URL.host", "host")}} hoặc scheme của nó là `file:`, thì việc đặt thuộc tính này không có tác dụng.

Mật khẩu được {{Glossary("Percent-encoding", "mã hóa phần trăm")}} khi đặt nhưng không được giải mã phần trăm khi đọc.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const url = new URL(
  "https://anonymous:flabada@developer.mozilla.org/en-US/docs/Web/API/URL/password",
);
console.log(url.password); // Logs "flabada"
```

## Thông số kỹ thuật

{{Specifications}}
