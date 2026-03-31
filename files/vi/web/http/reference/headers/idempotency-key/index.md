---
title: Idempotency-Key header
short-title: Idempotency-Key
slug: Web/HTTP/Reference/Headers/Idempotency-Key
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Idempotency-Key
spec-urls: https://datatracker.ietf.org/doc/draft-ietf-httpapi-idempotency-key-header/
sidebar: http
---

{{SeeCompatTable}}

Tiêu đề HTTP **`Idempotency-Key`** {{glossary("request header")}} có thể được sử dụng để làm cho các yêu cầu {{HTTPMethod("POST")}} và {{HTTPMethod("PATCH")}} trở thành {{glossary("idempotent")}}.

Điều này cho phép máy khách gửi lại các yêu cầu chưa được xác nhận mà không cần lo lắng rằng yêu cầu đã được máy chủ nhận và xử lý.

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
Idempotency-Key: <key>
```

## Chỉ thị

- `<key>`
  - : Khóa duy nhất cho một yêu cầu cụ thể.
    Định dạng được xác định bởi máy chủ.

## Mô tả

Các phương thức HTTP {{HTTPMethod("GET")}}, {{HTTPMethod("HEAD")}}, {{HTTPMethod("PUT")}}, {{HTTPMethod("DELETE")}} và {{HTTPMethod("OPTIONS")}} là idempotent.
Điều này có nghĩa là bạn có thể gửi thông điệp với các phương thức này bất kỳ số lần nào và trạng thái của máy chủ sẽ không thay đổi, hoặc sẽ thay đổi theo cùng một cách mỗi lần nhận được thông điệp.
Ví dụ, nếu bạn gửi cùng một thông điệp `PUT` nhiều lần, nó sẽ cập nhật cùng một tài nguyên trên máy chủ mỗi lần, với cùng một giá trị.

Các phương thức {{HTTPMethod("POST")}} và {{HTTPMethod("PATCH")}} không phải là idempotent, có nghĩa là trạng thái máy chủ có thể thay đổi mỗi lần nhận được thông điệp.
Không giống thông điệp `PUT`, nếu bạn gửi cùng một yêu cầu `POST` nhiều lần, máy chủ có thể tạo một tài nguyên mới cho mỗi yêu cầu thành công.
Tương tự, `PATCH` phản ánh một sự thay đổi liên quan đến một trạng thái cụ thể, và trạng thái đó thay đổi mỗi lần áp dụng bản vá.

Tính idempotency rất quan trọng trong các trường hợp máy khách không nhận được phản hồi, vì nó có nghĩa là máy khách có thể an toàn gửi lại yêu cầu mà không cần lo lắng về các tác dụng phụ có thể xảy ra.

Tiêu đề HTTP `Idempotency-Key` cho phép máy khách làm cho các yêu cầu `POST` và `PATCH` trở thành idempotent bằng cách cung cấp cho chúng một định danh duy nhất (một khóa).
Máy khách sau đó có thể gửi lại cùng một yêu cầu nhiều lần, và máy chủ có thể biết rằng nó chỉ nên thực hiện hành động một lần.

### Trách nhiệm của máy khách

JavaScript máy khách nên đính kèm tiêu đề `Idempotency-Key` trong các yêu cầu fetch cho các endpoint yêu cầu nó, với một khóa tuân thủ các yêu cầu được máy chủ công bố.

Một khóa duy nhất phải được sử dụng cho mỗi yêu cầu mới được gửi, và khóa tương tự nên được sử dụng nếu yêu cầu đó được gửi lại.

### Trách nhiệm của máy chủ

Các máy chủ hỗ trợ tiêu đề `Idempotency-Key` được kỳ vọng ghi lại và công bố hỗ trợ của mình, bao gồm các endpoint yêu cầu tiêu đề và bất kỳ yêu cầu nào về khóa (chẳng hạn như độ dài, phương pháp tính toán và hết hạn).

Lưu ý rằng máy chủ có thể chọn hết hạn các khóa đã nhận theo thời gian; hành vi hết hạn khóa phải được xác định và ghi lại để máy khách có thể thực hiện các yêu cầu tuân thủ.

#### Dấu vân tay idempotency

Một khóa duy nhất được kỳ vọng sử dụng trong mỗi yêu cầu.

Để bảo vệ chống lại việc máy khách tái sử dụng các khóa cho các yêu cầu mới, máy chủ có thể tạo và lưu trữ một "dấu vân tay idempotency" của yêu cầu cùng với khóa.
Đây là hash của toàn bộ hoặc một phần của yêu cầu có thể được so sánh với các yêu cầu khác có cùng khóa.

Nếu dấu vân tay idempotency được hỗ trợ, máy chủ có thể gửi phản hồi lỗi nếu cùng một khóa có dấu vân tay khác.

#### Xử lý yêu cầu

Khi nhận được yêu cầu `POST` hoặc `PATCH` với `Idempotency-Key` trên một endpoint yêu cầu nó, máy chủ nên kiểm tra xem nó đã nhận được yêu cầu với khóa đó chưa.

- Nếu chưa, máy chủ nên thực hiện thao tác và phản hồi, sau đó lưu trữ khóa.
- Nếu đã có, nó không nên thực hiện thao tác, nhưng nên phản hồi như thể đã làm.

Các máy chủ đang sử dụng dấu vân tay idempotency cũng sẽ tạo và lưu trữ dấu vân tay cho mỗi yêu cầu mới.
Điều này sẽ được sử dụng để phản hồi với lỗi nếu khóa và dấu vân tay tiếp theo không khớp.

Nếu nhận được yêu cầu không có `Idempotency-Key` trên một endpoint yêu cầu nó, máy chủ nên phản hồi với lỗi.

#### Phản hồi lỗi của máy chủ

Máy chủ nên cung cấp phản hồi lỗi trong các trường hợp sau:

- {{HTTPStatus("400", "400 Bad Request")}}: Tiêu đề bị bỏ qua cho một endpoint được ghi lại là yêu cầu nó.
- {{HTTPStatus("409", "409 Conflict")}}: Một yêu cầu có cùng khóa đang/vẫn đang được xử lý.
- {{HTTPStatus("422", "422 Unprocessable Content")}}: Khóa đang được sử dụng cho một payload yêu cầu khác (nếu dấu vân tay idempotency được hỗ trợ).

Trong trường hợp phản hồi `409 Conflict`, máy khách sẽ cần chờ trước khi thử lại.
Đối với tất cả các lỗi khác, máy khách sẽ cần sửa đổi các yêu cầu trước khi gửi lại.

Thông số kỹ thuật không bắt buộc định dạng cho payload phản hồi lỗi, nhưng các lỗi nên chứa liên kết đến tài liệu cụ thể của việc triển khai giải thích lỗi.
Định dạng payload JSON được phác thảo trong {{rfc(9457, "Problem Details for HTTP APIs")}} là một lựa chọn.
Ví dụ, phản hồi sau có thể được sử dụng cho khóa bị thiếu:

```http
HTTP/1.1 400 Bad Request
Content-Type: application/problem+json
Content-Language: en

{
    "type": "https://developer.example.com/idempotency/docs",
    "title": "Idempotency-Key is missing",
    "detail": "This operation is idempotent and requires correct usage of Idempotency Key.",
}
```

## Ví dụ

### Yêu cầu `POST` với khóa

Thông điệp sau hiển thị yêu cầu `POST` để tạo một người dùng mới.
Khóa `9c7d2b4a0e1f6c835a2d1b0f4e3c5a7d` là giá trị duy nhất khớp với các yêu cầu được công bố bởi host (example.com không hỗ trợ tiêu đề này, vì vậy chúng tôi chỉ tạo ra một giá trị).

```http
POST /api/users HTTP/1.1
Host: example.com
Content-Type: application/json
Idempotency-Key: 9c7d2b4a0e1f6c835a2d1b0f4e3c5a7d

{
  "user_id": "12345",
  "name": "Sharma Chow",
  "email": "sharmac@example.com"
}
```

Nếu không nhận được phản hồi, máy khách có thể an toàn gửi lại chính xác cùng một yêu cầu. Nếu máy chủ không nhận được yêu cầu trước, nó sẽ xử lý yêu cầu này; nếu nó đã nhận được yêu cầu trước, yêu cầu thứ hai sẽ bị bỏ qua, nhưng máy chủ sẽ phản hồi như thể nó đã xử lý yêu cầu thứ hai như thường lệ.

Nếu máy khách gửi lại yêu cầu quá nhanh, nó có thể nhận được phản hồi lỗi như thế này.
Lưu ý rằng chỉ mã trạng thái HTTP là bắt buộc, phần còn lại của thông tin được xác định bởi máy chủ.

```http
HTTP/1.1 409 Conflict
Content-Type: application/problem+json
Content-Language: en

{
    "type": "https://example.com/idempotency/docs",
    "title": "Server processing previous request.",
    "detail": "A request with the same key is currently/still being processed.",
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
