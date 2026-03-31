---
title: Alt-Svc header
short-title: Alt-Svc
slug: Web/HTTP/Reference/Headers/Alt-Svc
page-type: http-header
browser-compat: http.headers.Alt-Svc
sidebar: http
---

Tiêu đề HTTP **`Alt-Svc`** {{Glossary("response header", "phản hồi")}} cho phép máy chủ chỉ ra rằng một vị trí mạng khác ("dịch vụ thay thế") có thể được coi là có thẩm quyền cho nguồn gốc đó khi thực hiện các yêu cầu trong tương lai.

Làm điều này cho phép các phiên bản giao thức mới được quảng cáo mà không ảnh hưởng đến các yêu cầu đang thực hiện và cũng có thể giúp máy chủ quản lý lưu lượng. Việc sử dụng dịch vụ thay thế không hiển thị với người dùng cuối; nó không thay đổi URL hay nguồn gốc của yêu cầu và không giới thiệu các vòng truy cập bổ sung.

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
Alt-Svc: clear
Alt-Svc: <protocol-id>=<alt-authority>; ma=<max-age>
Alt-Svc: <protocol-id>=<alt-authority>; ma=<max-age>; persist=1
```

- `clear`
  - : Tất cả các dịch vụ thay thế của nguồn gốc bị vô hiệu hóa.
- `<protocol-id>`
  - : Mã định danh giao thức {{Glossary("ALPN", "Application-Layer Protocol Negotiation (ALPN)")}}. Ví dụ bao gồm `h2` cho HTTP/2 và `h3-25` cho nháp 25 của giao thức HTTP/3.
- `<alt-authority>`
  - : Một chuỗi được trích dẫn chỉ định thẩm quyền thay thế, bao gồm ghi đè máy chủ tùy chọn, dấu hai chấm, và số cổng bắt buộc.
- `ma=<max-age>` {{optional_inline}}
  - : Số giây mà dịch vụ thay thế được coi là mới (fresh). Nếu bị bỏ qua, mặc định là 24 giờ. Các mục dịch vụ thay thế có thể được lưu vào bộ nhớ đệm tới `<max-age>` giây, trừ đi tuổi của phản hồi (từ tiêu đề {{HTTPHeader("Age")}}). Khi mục được lưu vào bộ nhớ đệm hết hạn, máy khách không thể sử dụng dịch vụ thay thế này nữa cho các kết nối mới.
- `persist=1` {{optional_inline}}
  - : Các mục không bị xóa bởi các thay đổi cấu hình mạng. Các mục dịch vụ thay thế được lưu vào bộ nhớ đệm thường bị xóa khi có những thay đổi như vậy.

Nhiều mục có thể được chỉ định trong một tiêu đề `Alt-Svc` duy nhất bằng cách sử dụng dấu phẩy làm phân cách.
Trong trường hợp đó, các mục đầu tiên được coi là ưu tiên hơn.

## Ví dụ

```http
Alt-Svc: h2=":443"; ma=2592000;
Alt-Svc: h2=":443"; ma=2592000; persist=1
Alt-Svc: h2="alt.example.com:443", h2=":443"
Alt-Svc: h3-25=":443"; ma=3600, h2=":443"; ma=3600
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Alternative Services](https://www.mnot.net/blog/2016/03/09/alt-svc) bởi Chủ tịch HTTP Working Group, Mark Nottingham (2016)
