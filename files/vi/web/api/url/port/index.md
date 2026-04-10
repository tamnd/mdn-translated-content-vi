---
title: "URL: thuộc tính port"
short-title: port
slug: Web/API/URL/port
page-type: web-api-instance-property
browser-compat: api.URL.port
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Thuộc tính **`port`** của giao diện {{domxref("URL")}} là một chuỗi chứa số port của URL. Nếu port là giá trị mặc định cho protocol (`80` cho `ws:` và `http:`, `443` cho `wss:` và `https:`, và `21` cho `ftp:`), thuộc tính này chứa chuỗi rỗng, `""`.

Thuộc tính này có thể được đặt để thay đổi port của URL. Nếu URL không có {{domxref("URL.host", "host")}} hoặc scheme của nó là `file:`, thì việc đặt thuộc tính này không có tác dụng. Nó cũng bỏ qua một cách âm thầm các số port không hợp lệ.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// https protocol with non-default port number
new URL("https://example.com:5443/svn/Repos/").port; // '5443'
// http protocol with non-default port number
new URL("http://example.com:8080/svn/Repos/").port; // '8080'
// https protocol with default port number
new URL("https://example.com:443/svn/Repos/").port; // '' (empty string)
// http protocol with default port number
new URL("http://example.com:80/svn/Repos/").port; // '' (empty string)
// https protocol with no explicit port number
new URL("https://example.com/svn/Repos/").port; // '' (empty string)
// http protocol with no explicit port number
new URL("http://example.com/svn/Repos/").port; // '' (empty string)
// ftp protocol with non-default port number
new URL("ftp://example.com:221/svn/Repos/").port; // '221'
// ftp protocol with default port number
new URL("ftp://example.com:21/svn/Repos/").port; // '' (empty string)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("URL")}} mà thuộc tính này thuộc về.
