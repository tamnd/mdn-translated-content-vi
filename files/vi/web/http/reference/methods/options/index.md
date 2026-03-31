---
title: OPTIONS request method
short-title: OPTIONS
slug: Web/HTTP/Reference/Methods/OPTIONS
page-type: http-method
browser-compat: http.methods.OPTIONS
sidebar: http
---

Phương thức HTTP **`OPTIONS`** yêu cầu các tùy chọn giao tiếp được cho phép cho một URL hoặc máy chủ nhất định.
Phương thức này có thể được dùng để kiểm tra các phương thức HTTP được phép cho một yêu cầu, hoặc để xác định xem một yêu cầu có thành công khi thực hiện yêu cầu preflight CORS hay không.
Client có thể chỉ định một URL với phương thức này, hoặc dấu hoa thị (`*`) để tham chiếu đến toàn bộ máy chủ.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Yêu cầu có phần thân</th>
      <td>Có thể có*</td>
    </tr>
    <tr>
      <th scope="row">Phản hồi thành công có phần thân</th>
      <td>Có thể có</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Safe/HTTP", "An toàn")}}</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Idempotent", "Bất biến")}}</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Cacheable", "Có thể lưu đệm")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">Cho phép trong HTML forms</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

\* Mặc dù thông điệp `OPTIONS` có phần thân yêu cầu về mặt kỹ thuật được phép, nhưng nó không có ngữ nghĩa được xác định.
Bạn có thể bao gồm phần thân trong thông điệp `OPTIONS` miễn là bạn cung cấp tiêu đề {{HTTPHeader("Content-Type")}} hợp lệ, và khi bạn biết máy chủ mong đợi điều đó, vì hành vi phụ thuộc vào cách triển khai.

## Cú pháp

```http
OPTIONS *|<request-target>["?"<query>] HTTP/1.1
```

Mục tiêu yêu cầu có thể ở dạng 'dấu hoa thị' `*` cho biết toàn bộ máy chủ, hoặc là mục tiêu yêu cầu như thường gặp với các phương thức khác:

- `*`
  - : Cho biết rằng client muốn yêu cầu `OPTIONS` cho toàn bộ máy chủ, thay vì một tài nguyên cụ thể được đặt tên của máy chủ đó.
- `<request-target>`
  - : Xác định tài nguyên đích của yêu cầu khi kết hợp với thông tin được cung cấp trong tiêu đề {{HTTPHeader("Host")}}.
    Đây là đường dẫn tuyệt đối (ví dụ: `/path/to/file.html`) trong các yêu cầu đến máy chủ gốc, và là URL tuyệt đối trong các yêu cầu đến proxy (ví dụ: `http://www.example.com/path/to/file.html`).
- `<query>` {{optional_inline}}
  - : Thành phần truy vấn tùy chọn được đặt trước dấu hỏi `?`.
    Thường được dùng để mang thông tin nhận dạng dưới dạng các cặp `key=value`.

## Ví dụ

### Xác định các phương thức yêu cầu được phép

Để tìm hiểu các phương thức yêu cầu nào mà máy chủ hỗ trợ, người ta có thể dùng chương trình dòng lệnh `curl` để gửi yêu cầu `OPTIONS`:

```bash
curl -X OPTIONS https://example.org -i
```

Lệnh này tạo ra yêu cầu HTTP sau:

```http
OPTIONS / HTTP/2
Host: example.org
User-Agent: curl/8.7.1
Accept: */*
```

Phản hồi chứa tiêu đề {{HTTPHeader("Allow")}} cho biết các phương thức được phép:

```http
HTTP/1.1 204 No Content
Allow: OPTIONS, GET, HEAD, POST
Cache-Control: max-age=604800
Date: Thu, 13 Oct 2016 11:45:00 GMT
Server: EOS (lax004/2813)
```

### Các yêu cầu preflight trong CORS

Trong [CORS](/en-US/docs/Web/HTTP/Guides/CORS), một [yêu cầu preflight](/en-US/docs/Glossary/Preflight_request) được gửi với phương thức `OPTIONS` để máy chủ có thể phản hồi xem có chấp nhận gửi yêu cầu hay không. Trong ví dụ này, chúng ta sẽ yêu cầu quyền cho các tham số sau:

- Tiêu đề {{HTTPHeader("Access-Control-Request-Method")}} được gửi trong yêu cầu preflight cho máy chủ biết rằng khi yêu cầu thực tế được gửi, nó sẽ có phương thức yêu cầu {{HTTPMethod("POST")}}.
- Tiêu đề {{HTTPHeader("Access-Control-Request-Headers")}} cho máy chủ biết rằng khi yêu cầu thực tế được gửi, nó sẽ có các tiêu đề `X-PINGOTHER` và `Content-Type`.

```http
OPTIONS /resources/post-here/ HTTP/1.1
Host: bar.example
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-us,en;q=0.5
Accept-Encoding: gzip,deflate
Connection: keep-alive
Origin: https://foo.example
Access-Control-Request-Method: POST
Access-Control-Request-Headers: content-type,x-pingother
```

Máy chủ có thể phản hồi xem có chấp nhận yêu cầu trong những trường hợp này không. Trong ví dụ này, phản hồi của máy chủ cho biết:

- {{HTTPHeader("Access-Control-Allow-Origin")}}
  - : Nguồn gốc `https://foo.example` được phép yêu cầu URL `bar.example/resources/post-here/` thông qua những điều sau:
- {{HTTPHeader("Access-Control-Allow-Methods")}}
  - : {{HTTPMethod("POST")}}, {{HTTPMethod("GET")}}, và `OPTIONS` là các phương thức được phép cho URL. (Tiêu đề này tương tự như tiêu đề phản hồi {{HTTPHeader("Allow")}}, nhưng chỉ được dùng cho [CORS](/en-US/docs/Web/HTTP/Guides/CORS).)
- {{HTTPHeader("Access-Control-Allow-Headers")}}
  - : `X-PINGOTHER` và `Content-Type` là các tiêu đề yêu cầu được phép cho URL.
- {{HTTPHeader("Access-Control-Max-Age")}}
  - : Các quyền trên có thể được lưu trong bộ đệm trong 86.400 giây (1 ngày).

```http
HTTP/1.1 200 OK
Date: Mon, 01 Dec 2008 01:15:39 GMT
Server: Apache/2.0.61 (Unix)
Access-Control-Allow-Origin: https://foo.example
Access-Control-Allow-Methods: POST, GET, OPTIONS
Access-Control-Allow-Headers: X-PINGOTHER, Content-Type
Access-Control-Max-Age: 86400
Vary: Accept-Encoding, Origin
Keep-Alive: timeout=2, max=100
Connection: Keep-Alive
```

> [!NOTE]
> Cả {{HTTPStatus("200", "200 OK")}} và {{HTTPStatus("204", "204 No Content")}} đều là [mã trạng thái được cho phép](https://fetch.spec.whatwg.org/#ref-for-ok-status), nhưng một số trình duyệt hiểu sai rằng `204 No Content` áp dụng cho tài nguyên và không gửi yêu cầu tiếp theo để lấy nó.

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- Tiêu đề {{HTTPHeader("Allow")}}
- [CORS](/en-US/docs/Web/HTTP/Guides/CORS)
