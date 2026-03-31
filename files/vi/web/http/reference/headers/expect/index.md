---
title: Expect header
short-title: Expect
slug: Web/HTTP/Reference/Headers/Expect
page-type: http-header
spec-urls: https://www.rfc-editor.org/rfc/rfc9110#field.expect
sidebar: http
---

Tiêu đề HTTP **`Expect`** {{Glossary("request header")}} chỉ báo rằng có những kỳ vọng cần được máy chủ đáp ứng để xử lý thành công toàn bộ yêu cầu.

Khi yêu cầu có tiêu đề `Expect: 100-continue`, máy chủ gửi phản hồi {{HTTPStatus("100", "100 Continue")}} để chỉ báo rằng máy chủ sẵn sàng hoặc có khả năng nhận phần còn lại của nội dung yêu cầu.
Việc chờ phản hồi `100` có thể hữu ích nếu máy khách dự đoán rằng lỗi có thể xảy ra, ví dụ: khi gửi các thao tác thay đổi trạng thái mà không có thông tin xác thực được xác minh trước.

Phản hồi {{HTTPStatus("417", "417 Expectation Failed")}} được trả về nếu máy chủ không thể đáp ứng kỳ vọng, hoặc bất kỳ trạng thái nào khác (ví dụ: trạng thái [4XX](/en-US/docs/Web/HTTP/Reference/Status#client_error_responses) cho lỗi máy khách, hoặc trạng thái [2XX](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) nếu yêu cầu có thể được giải quyết thành công mà không cần xử lý thêm).

Không có trình duyệt phổ biến nào gửi tiêu đề `Expect`, nhưng một số máy khách (công cụ dòng lệnh) thực hiện theo mặc định.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Expect: 100-continue
```

## Chỉ thị

Chỉ có một kỳ vọng được xác định:

- `100-continue`
  - : Thông báo cho người nhận rằng máy khách sắp gửi một thân thông báo (có lẽ lớn) trong yêu cầu này và muốn nhận phản hồi tạm thời {{HTTPStatus("100", "100 Continue")}}.

## Ví dụ

### Thân thông báo lớn

Máy khách gửi yêu cầu với tiêu đề `Expect` và chờ máy chủ phản hồi trước khi gửi thân thông báo.

```http
PUT /somewhere/fun HTTP/1.1
Host: origin.example.com
Content-Type: video/h264
Content-Length: 1234567890987
Expect: 100-continue
```

Máy chủ kiểm tra các tiêu đề và tạo phản hồi, trong đó {{HTTPStatus("100", "100 Continue")}} hướng dẫn máy khách gửi thân thông báo:

```http
HTTP/1.1 100 Continue
```

Máy khách hoàn thành yêu cầu bằng cách gửi dữ liệu thực tế:

```http
[Video data as content for PUT request]
```

## Đặc tả

{{Specifications}}

## Xem thêm

- {{HTTPStatus("417", "417 Expectation Failed")}}
- {{HTTPStatus("100", "100 Continue")}}
