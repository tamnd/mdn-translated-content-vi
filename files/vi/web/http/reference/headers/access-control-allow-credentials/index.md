---
title: Access-Control-Allow-Credentials header
short-title: Access-Control-Allow-Credentials
slug: Web/HTTP/Reference/Headers/Access-Control-Allow-Credentials
page-type: http-header
browser-compat: http.headers.Access-Control-Allow-Credentials
sidebar: http
---

Tiêu đề HTTP **`Access-Control-Allow-Credentials`** {{Glossary("response header", "phản hồi")}} cho trình duyệt biết liệu máy chủ có cho phép thông tin xác thực được bao gồm trong các yêu cầu HTTP cross-origin hay không.

Thông tin xác thực bao gồm cookie, chứng chỉ máy khách {{glossary("TLS", "Transport Layer Security (TLS)")}}, hoặc các tiêu đề xác thực chứa tên người dùng và mật khẩu.
Theo mặc định, các thông tin xác thực này không được gửi trong các yêu cầu cross-origin, và việc làm như vậy có thể làm trang web dễ bị tấn công {{Glossary("CSRF", "Cross-Site Request Forgery (CSRF)")}}.

Máy khách có thể yêu cầu thông tin xác thực được bao gồm trong các yêu cầu cross-site theo một số cách:

- Sử dụng {{domxref("Window/fetch", "fetch()")}}, bằng cách đặt tùy chọn [`credentials`](/en-US/docs/Web/API/RequestInit#credentials) thành `"include"`.
- Sử dụng {{domxref("XMLHttpRequest")}}, bằng cách đặt thuộc tính {{domxref("XMLHttpRequest.withCredentials")}} thành `true`.
- Sử dụng {{domxref("EventSource()")}}, bằng cách đặt thuộc tính {{domxref("EventSource.withCredentials")}} thành `true`.

Khi thông tin xác thực được bao gồm:

- Đối với các yêu cầu {{glossary("Preflight_request", "preflight")}}: Yêu cầu preflight không bao gồm thông tin xác thực. Nếu phản hồi của máy chủ đối với yêu cầu preflight đặt tiêu đề `Access-Control-Allow-Credentials` thành `true`, thì yêu cầu thực tế sẽ bao gồm thông tin xác thực; nếu không, trình duyệt báo lỗi mạng.
- Đối với các yêu cầu không preflight: Yêu cầu sẽ bao gồm thông tin xác thực, và nếu phản hồi của máy chủ không đặt tiêu đề `Access-Control-Allow-Credentials` thành `true`, trình duyệt báo lỗi mạng.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Access-Control-Allow-Credentials: true
```

## Chỉ thị

- `true`
  - : Máy chủ cho phép thông tin xác thực được bao gồm trong các yêu cầu HTTP cross-origin. Đây là giá trị hợp lệ duy nhất cho tiêu đề này và phân biệt chữ hoa/thường. Nếu bạn không cần thông tin xác thực, hãy bỏ qua hoàn toàn tiêu đề này thay vì đặt giá trị của nó thành `false`.

## Ví dụ

Cho phép thông tin xác thực:

```http
Access-Control-Allow-Credentials: true
```

Sử dụng {{domxref("Window/fetch", "fetch()")}} với thông tin xác thực:

```js
fetch(url, {
  credentials: "include",
});
```

Sử dụng {{domxref("XMLHttpRequest")}} với thông tin xác thực:

```js
const xhr = new XMLHttpRequest();
xhr.open("GET", "http://example.com/", true);
xhr.withCredentials = true;
xhr.send(null);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XMLHttpRequest.withCredentials")}}
- {{domxref("Request.Request()", "Request()")}}
