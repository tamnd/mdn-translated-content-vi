---
title: Service-Worker header
short-title: Service-Worker
slug: Web/HTTP/Reference/Headers/Service-Worker
page-type: http-header
browser-compat: http.headers.Service-Worker
sidebar: http
---

Tiêu đề HTTP **`Service-Worker`** {{Glossary("request header")}} được bao gồm trong các yêu cầu fetch tài nguyên script của service worker.
Tiêu đề này giúp quản trị viên ghi nhật ký các yêu cầu script service worker cho mục đích giám sát.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Service-Worker: script
```

## Chỉ thị

- `script`
  - : Giá trị cho biết đây là script.
    Đây là chỉ thị duy nhất được phép cho tiêu đề này.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Tiêu đề {{HTTPHeader("Service-Worker-Allowed")}}
- [Service worker API](/en-US/docs/Web/API/Service_Worker_API)
