---
title: Access-Control-Allow-Origin header
short-title: Access-Control-Allow-Origin
slug: Web/HTTP/Reference/Headers/Access-Control-Allow-Origin
page-type: http-header
browser-compat: http.headers.Access-Control-Allow-Origin
sidebar: http
---

Tiêu đề HTTP **`Access-Control-Allow-Origin`** {{Glossary("response header", "phản hồi")}} chỉ ra liệu phản hồi có thể được chia sẻ với mã yêu cầu từ {{Glossary("origin", "nguồn gốc")}} đã cho hay không.

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
Access-Control-Allow-Origin: *
Access-Control-Allow-Origin: <origin>
Access-Control-Allow-Origin: null
```

## Chỉ thị

- `*` (ký tự đại diện)
  - : Mã yêu cầu từ bất kỳ nguồn gốc nào được phép truy cập tài nguyên. Đối với các yêu cầu _không có thông tin xác thực_, giá trị chữ `*` có thể được chỉ định làm ký tự đại diện. Cố gắng sử dụng ký tự đại diện với thông tin xác thực [dẫn đến lỗi](/en-US/docs/Web/HTTP/Guides/CORS/Errors/CORSNotSupportingCredentials).
- `<origin>`
  - : Chỉ định một nguồn gốc đơn. Nếu máy chủ hỗ trợ máy khách từ nhiều nguồn gốc, nó phải trả về nguồn gốc cho máy khách cụ thể đang thực hiện yêu cầu.
- `null`
  - : Chỉ định nguồn gốc "null".
    > [!NOTE]
    > Không nên sử dụng giá trị `null`. Có vẻ an toàn khi trả về `Access-Control-Allow-Origin: "null"`; tuy nhiên, nguồn gốc của các tài nguyên sử dụng scheme phi phân cấp (như `data:` hoặc `file:`) và các tài liệu được sandbox được tuần tự hóa là `null`. Nhiều trình duyệt sẽ cấp cho các tài liệu như vậy quyền truy cập vào phản hồi có tiêu đề `Access-Control-Allow-Origin: null`, và bất kỳ nguồn gốc nào cũng có thể tạo tài liệu thù địch với nguồn gốc `null`. Do đó, giá trị `null` cho tiêu đề `Access-Control-Allow-Origin` nên được tránh.

## Ví dụ

Phản hồi cho trình duyệt biết rằng mã từ bất kỳ nguồn gốc nào được phép truy cập tài nguyên sẽ bao gồm:

```http
Access-Control-Allow-Origin: *
```

Phản hồi cho trình duyệt biết rằng mã yêu cầu từ nguồn gốc `https://developer.mozilla.org` được phép truy cập tài nguyên sẽ bao gồm:

```http
Access-Control-Allow-Origin: https://developer.mozilla.org
```

Giới hạn các giá trị `Access-Control-Allow-Origin` có thể có trong một tập hợp các nguồn gốc được phép yêu cầu mã phía máy chủ kiểm tra giá trị của tiêu đề yêu cầu {{HTTPHeader("Origin")}}, so sánh với danh sách các nguồn gốc được phép, và nếu giá trị {{HTTPHeader("Origin")}} nằm trong danh sách, đặt giá trị `Access-Control-Allow-Origin` bằng giá trị {{HTTPHeader("Origin")}}.

### CORS và bộ nhớ đệm

Giả sử máy chủ gửi phản hồi có giá trị `Access-Control-Allow-Origin` với nguồn gốc rõ ràng (thay vì ký tự đại diện `*`). Trong trường hợp đó, phản hồi cũng nên bao gồm tiêu đề phản hồi {{HTTPHeader("Vary")}} với giá trị `Origin` — để chỉ ra cho trình duyệt rằng các phản hồi của máy chủ có thể khác nhau dựa trên giá trị của tiêu đề yêu cầu `Origin`.

```http
Access-Control-Allow-Origin: https://developer.mozilla.org
Vary: Origin
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Origin")}}
- {{HTTPHeader("Vary")}}
- [Cross-Origin Resource Sharing (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- {{HTTPHeader("Cross-Origin-Resource-Policy")}}
