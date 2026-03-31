---
title: PATCH request method
short-title: PATCH
slug: Web/HTTP/Reference/Methods/PATCH
page-type: http-method
spec-urls: https://www.rfc-editor.org/rfc/rfc5789
sidebar: http
---

Phương thức HTTP **`PATCH`** áp dụng các sửa đổi một phần cho tài nguyên.

`PATCH` có phần tương tự với khái niệm "cập nhật" trong {{Glossary("CRUD")}} (nói chung, HTTP khác với {{Glossary("CRUD")}}, và hai khái niệm này không nên bị nhầm lẫn).

So với {{HTTPMethod("PUT")}}, `PATCH` đóng vai trò như một tập hợp các hướng dẫn để sửa đổi tài nguyên, trong khi `PUT` đại diện cho việc thay thế hoàn toàn tài nguyên.
Yêu cầu `PUT` luôn có tính {{Glossary("idempotent", "bất biến")}} (lặp đi lặp lại cùng một yêu cầu nhiều lần cho kết quả là tài nguyên vẫn ở trạng thái như nhau), trong khi yêu cầu `PATCH` có thể không phải lúc nào cũng bất biến.
Ví dụ, nếu một tài nguyên có bộ đếm tự tăng, yêu cầu `PUT` sẽ ghi đè bộ đếm (vì nó thay thế toàn bộ tài nguyên), nhưng yêu cầu `PATCH` có thể không làm như vậy.

Giống như {{HTTPMethod("POST")}}, yêu cầu `PATCH` có thể có tác dụng phụ lên các tài nguyên khác.

Máy chủ có thể quảng bá sự hỗ trợ cho `PATCH` bằng cách thêm nó vào danh sách trong tiêu đề phản hồi {{HTTPHeader("Allow")}} hoặc {{HTTPHeader("Access-Control-Allow-Methods")}} (cho [CORS](/en-US/docs/Web/HTTP/Guides/CORS)).
Một dấu hiệu ngầm khác cho thấy `PATCH` được hỗ trợ là tiêu đề {{HTTPHeader("Accept-Patch")}} (thường sau yêu cầu {{HTTPMethod("OPTIONS")}} trên một tài nguyên), liệt kê các kiểu media mà máy chủ có thể hiểu trong yêu cầu `PATCH` cho tài nguyên đó.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Yêu cầu có phần thân</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Phản hồi thành công có phần thân</th>
      <td>Có thể có</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Safe/HTTP", "An toàn")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Idempotent", "Bất biến")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Cacheable", "Có thể lưu đệm")}}</th>
      <td>Chỉ khi có thông tin độ tươi mới</td>
    </tr>
    <tr>
      <th scope="row">
        Cho phép trong <a href="/en-US/docs/Learn_web_development/Extensions/Forms">HTML forms</a>
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
PATCH <request-target>["?"<query>] HTTP/1.1
```

- `<request-target>`
  - : Xác định tài nguyên đích của yêu cầu khi kết hợp với thông tin được cung cấp trong tiêu đề {{HTTPHeader("Host")}}.
    Đây là đường dẫn tuyệt đối (ví dụ: `/path/to/file.html`) trong các yêu cầu đến máy chủ gốc, và là URL tuyệt đối trong các yêu cầu đến proxy (ví dụ: `http://www.example.com/path/to/file.html`).
- `<query>` {{optional_inline}}
  - : Thành phần truy vấn tùy chọn được đặt trước dấu hỏi `?`.
    Thường được dùng để mang thông tin nhận dạng dưới dạng các cặp `key=value`.

## Ví dụ

### Sửa đổi tài nguyên thành công

Giả sử có một tài nguyên trên máy chủ đại diện cho người dùng với ID số là `123` theo định dạng sau:

```json
{
  "firstName": "Example",
  "LastName": "User",
  "userId": 123,
  "signupDate": "2024-09-09T21:48:58Z",
  "status": "active",
  "registeredDevice": {
    "id": 1,
    "name": "personal",
    "manufacturer": {
      "name": "Hardware corp"
    }
  }
}
```

Thay vì gửi một đối tượng JSON để ghi đè hoàn toàn tài nguyên, `PATCH` chỉ sửa đổi các phần cụ thể của tài nguyên.
Yêu cầu này cập nhật trường `status`:

```http
PATCH /users/123 HTTP/1.1
Host: example.com
Content-Type: application/json
Content-Length: 27
Authorization: Bearer ABC123

{
  "status": "suspended"
}
```

Việc diễn giải và xác thực yêu cầu `PATCH` phụ thuộc vào cách triển khai.
Thành công có thể được chỉ ra bởi bất kỳ [mã trạng thái phản hồi thành công](/en-US/docs/Web/HTTP/Reference/Status#successful_responses) nào.
Trong ví dụ này, {{HTTPStatus("204", "204 No Content")}} được sử dụng vì không cần truyền phần thân với ngữ cảnh bổ sung về thao tác.
{{HTTPHeader("ETag")}} được cung cấp để người gọi có thể thực hiện [yêu cầu có điều kiện](/en-US/docs/Web/HTTP/Guides/Conditional_requests) trong tương lai:

```http
HTTP/1.1 204 No Content
Content-Location: /users/123
ETag: "e0023aa4f"
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

Trình duyệt không sử dụng phương thức `PATCH` cho các hành động do người dùng khởi tạo, vì vậy "khả năng tương thích với trình duyệt" không áp dụng ở đây.
Nhà phát triển có thể thiết lập phương thức yêu cầu này bằng [`fetch()`](/en-US/docs/Web/API/Window/fetch).

## Xem thêm

- [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- {{HTTPStatus("204")}}
- Tiêu đề {{HTTPHeader("Allow")}}, {{HTTPHeader("Access-Control-Allow-Methods")}}
- {{HTTPHeader("Accept-Patch")}} – chỉ định các định dạng tài liệu patch được máy chủ chấp nhận
- [JSON Patch Generator](https://jsoning.com/jsonpatch/)
