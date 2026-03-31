---
title: Forwarded header
short-title: Forwarded
slug: Web/HTTP/Reference/Headers/Forwarded
page-type: http-header
spec-urls: https://datatracker.ietf.org/doc/html/rfc7239
sidebar: http
---

Tiêu đề HTTP **`Forwarded`** {{Glossary("request header")}} chứa thông tin có thể được thêm vào bởi [các máy chủ proxy ngược](/en-US/docs/Web/HTTP/Guides/Proxy_servers_and_tunneling) (cân bằng tải, CDN, v.v.) mà nếu không sẽ bị thay đổi hoặc mất khi có máy chủ proxy tham gia vào đường dẫn yêu cầu.

Ví dụ: nếu một máy khách kết nối với máy chủ web thông qua proxy HTTP (hoặc cân bằng tải), nhật ký máy chủ sẽ chỉ chứa địa chỉ IP, địa chỉ máy chủ và giao thức của proxy; tiêu đề này có thể được sử dụng để xác định địa chỉ IP, máy chủ và giao thức của yêu cầu ban đầu.
Tiêu đề là tùy chọn và có thể được thêm vào, sửa đổi hoặc xóa bởi bất kỳ máy chủ proxy nào trên đường đến máy chủ.

Tiêu đề này được sử dụng để gỡ lỗi, thống kê và tạo nội dung phụ thuộc vị trí.
Theo thiết kế, nó tiết lộ thông tin nhạy cảm về quyền riêng tư, chẳng hạn như địa chỉ IP của máy khách.
Do đó, quyền riêng tư của người dùng phải được ghi nhớ khi sử dụng tiêu đề này.

Phiên bản thay thế và tiêu chuẩn thực tế của tiêu đề này là các tiêu đề {{HTTPHeader("X-Forwarded-For")}}, {{HTTPHeader("X-Forwarded-Host")}} và {{HTTPHeader("X-Forwarded-Proto")}}.

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
Forwarded: by=<identifier>;for=<identifier>;host=<host>;proto=<http|https>
```

Các chỉ thị là các cặp `key=value`, phân tách bằng dấu chấm phẩy.

Nếu có nhiều máy chủ proxy giữa máy khách và máy chủ, mỗi máy có thể chỉ định thông tin chuyển tiếp của riêng mình.
Điều này có thể được thực hiện bằng cách thêm tiêu đề `Forwarded` mới vào cuối khối tiêu đề, hoặc bằng cách thêm thông tin vào cuối tiêu đề `Forwarded` cuối cùng trong danh sách phân tách bằng dấu phẩy.

## Chỉ thị

- `by` {{optional_inline}}
  - : Giao diện nơi yêu cầu đến máy chủ proxy.
    Định danh có thể là:
    - định danh bị làm mờ (chẳng hạn như "hidden" hoặc "secret").
      Đây nên được coi là mặc định.
    - địa chỉ IP (v4 hoặc v6, tùy chọn với cổng, và ipv6 được trích dẫn và đặt trong dấu ngoặc vuông)
    - "unknown" khi thực thể trước đó không được biết (và bạn vẫn muốn chỉ báo rằng việc chuyển tiếp yêu cầu đã được thực hiện)

- `for` {{optional_inline}}
  - : Máy khách đã khởi tạo yêu cầu và các proxy tiếp theo trong chuỗi proxy.
    Định danh có cùng các giá trị có thể như chỉ thị `by`.
- `host` {{optional_inline}}
  - : Trường tiêu đề yêu cầu {{HTTPHeader("Host")}} nhận được bởi proxy.
- `proto` {{optional_inline}}
  - : Chỉ báo giao thức nào đã được sử dụng để thực hiện yêu cầu (thường là "http" hoặc "https").

## Ví dụ

### Sử dụng tiêu đề `Forwarded`

```http
Forwarded: for="_mdn"

# không phân biệt chữ hoa chữ thường
Forwarded: For="[2001:db8:cafe::17]:4711"

# phân tách bằng dấu chấm phẩy
Forwarded: for=192.0.2.60;proto=http;by=203.0.113.43

# Các giá trị từ nhiều máy chủ proxy có thể được thêm vào bằng dấu phẩy
Forwarded: for=192.0.2.43, for=198.51.100.17
```

### Chuyển đổi từ `X-Forwarded-For` sang `Forwarded`

Nếu ứng dụng, máy chủ hoặc proxy của bạn hỗ trợ tiêu đề `Forwarded` tiêu chuẩn, tiêu đề {{HTTPHeader("X-Forwarded-For")}} có thể được thay thế.
Lưu ý rằng địa chỉ IPv6 được trích dẫn và đặt trong dấu ngoặc vuông trong `Forwarded` (không giống trong tiêu đề {{HTTPHeader("X-Forwarded-For")}}).

```http
X-Forwarded-For: 192.0.2.172
Forwarded: for=192.0.2.172

X-Forwarded-For: 192.0.2.43, 2001:db8:cafe::17
Forwarded: for=192.0.2.43, for="[2001:db8:cafe::17]"
```

## Đặc tả

{{Specifications}}

## Xem thêm

- {{HTTPHeader("X-Forwarded-For")}}
- {{HTTPHeader("X-Forwarded-Host")}}
- {{HTTPHeader("X-Forwarded-Proto")}}
- {{HTTPHeader("Via")}} – cung cấp thông tin về chính proxy, không phải về máy khách kết nối với nó.
