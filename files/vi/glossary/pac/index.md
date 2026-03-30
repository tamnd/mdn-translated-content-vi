---
title: PAC
slug: Glossary/PAC
page-type: glossary-definition
sidebar: glossarysidebar
---

Tập tin Proxy Auto-Configuration (**PAC file** — tập tin cấu hình proxy tự động) là một tập tin chứa hàm `FindProxyForURL()`, được trình duyệt sử dụng để xác định xem các yêu cầu (bao gồm HTTP, HTTPS và FTP) có nên đi thẳng tới đích hay cần được chuyển tiếp qua máy chủ proxy web.

```js
function FindProxyForURL(url, host) {
  // …
}

ret = FindProxyForURL(url, host);
```

Xem [tập tin Proxy Auto-Configuration (PAC)](/en-US/docs/Web/HTTP/Guides/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_PAC_file) để biết chi tiết về cách chúng được sử dụng và cách tạo mới.

## Xem thêm

- [PAC](https://en.wikipedia.org/wiki/Proxy_auto-config) trên Wikipedia
- [Tập tin Proxy Auto-Configuration](/en-US/docs/Web/HTTP/Guides/Proxy_servers_and_tunneling/Proxy_Auto-Configuration_PAC_file) trên MDN
