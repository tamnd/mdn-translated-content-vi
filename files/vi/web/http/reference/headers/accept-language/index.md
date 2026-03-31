---
title: Accept-Language header
short-title: Accept-Language
slug: Web/HTTP/Reference/Headers/Accept-Language
page-type: http-header
browser-compat: http.headers.Accept-Language
sidebar: http
---

Tiêu đề HTTP **`Accept-Language`** {{Glossary("request header", "yêu cầu")}} chỉ ra ngôn ngữ tự nhiên và địa phương mà máy khách ưa thích.
Máy chủ sử dụng [thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation) để chọn một trong các đề xuất và thông báo cho máy khách về lựa chọn với tiêu đề phản hồi {{HTTPHeader("Content-Language")}}.
Các trình duyệt đặt các giá trị bắt buộc cho tiêu đề này theo ngôn ngữ giao diện người dùng đang hoạt động của chúng.
Người dùng cũng có thể cấu hình các ngôn ngữ ưa thích bổ sung thông qua cài đặt trình duyệt.

Tiêu đề `Accept-Language` thường liệt kê các ngôn ngữ địa phương giống như thuộc tính {{domxref("navigator.languages")}}, với các giá trị `q` ([giá trị chất lượng](/en-US/docs/Glossary/Quality_values)) giảm dần. Một số trình duyệt, như Chrome và Safari, thêm thẻ ngôn ngữ dự phòng chỉ có ngôn ngữ trong `Accept-Language`. Ví dụ, `en-US,en;q=0.9,zh-CN;q=0.8,zh;q=0.7` khi `navigator.languages` là `["en-US", "zh-CN"]`. Vì mục đích bảo mật (giảm {{Glossary("fingerprinting")}}), cả `Accept-Language` và `navigator.languages` có thể không bao gồm danh sách đầy đủ các tùy chọn của người dùng. Ví dụ, trong Safari (luôn luôn) và chế độ ẩn danh của Chrome, chỉ có một ngôn ngữ được liệt kê.

Tiêu đề này đóng vai trò là gợi ý khi máy chủ không thể xác định ngôn ngữ nội dung đích theo cách khác (ví dụ, sử dụng URL cụ thể phụ thuộc vào quyết định rõ ràng của người dùng).
Máy chủ không bao giờ nên ghi đè lên lựa chọn ngôn ngữ rõ ràng của người dùng. Nội dung của `Accept-Language` thường nằm ngoài sự kiểm soát của người dùng (khi đi du lịch, chẳng hạn).
Người dùng cũng có thể muốn truy cập trang bằng ngôn ngữ khác với ngôn ngữ giao diện người dùng.

Máy chủ có thể gửi lại mã lỗi {{HTTPStatus("406", "406 Not Acceptable")}} khi không thể phục vụ nội dung bằng ngôn ngữ phù hợp, nhưng điều này hiếm khi được triển khai.
Các máy chủ thường bỏ qua tiêu đề `Accept-Language` trong những trường hợp đó và gửi phản hồi thành công với tài nguyên phù hợp nhất để có trải nghiệm người dùng tốt hơn.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header", "Tiêu đề yêu cầu")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted request header")}}
      </th>
      <td>
        Có*
      </td>
    </tr>
  </tbody>
</table>

\* Giá trị chỉ có thể là `0-9`, `A-Z`, `a-z`, dấu cách, hoặc các ký tự `*,-.;=`.

## Cú pháp

```http
Accept-Language: <language>
Accept-Language: *

// Nhiều kiểu, có trọng số với cú pháp giá trị chất lượng:
Accept-Language: fr-CH, fr;q=0.9, en;q=0.8, de;q=0.7, *;q=0.5
```

## Chỉ thị

- `<language>`
  - : Một thẻ ngôn ngữ (đôi khi được gọi là "mã định danh địa phương"). Bao gồm thẻ ngôn ngữ cơ sở 2-3 chữ cái chỉ ra một ngôn ngữ, tùy chọn tiếp theo bởi các thẻ con bổ sung được phân tách bằng `-`. Thông tin thêm phổ biến nhất là biến thể quốc gia hoặc vùng (như `en-US` hoặc `fr-CA`) hoặc loại bảng chữ cái để sử dụng (như `sr-Latn`). Các biến thể khác, như loại chính tả (`de-DE-1996`), thường không được sử dụng trong ngữ cảnh của tiêu đề này.
- `*` (ký tự đại diện)
  - : Bất kỳ ngôn ngữ nào không khớp với bất kỳ ngôn ngữ nào khác có trong trường `Accept-Language`.
- `;q=` (q-factor weighting)
  - : Bất kỳ giá trị nào được đặt theo thứ tự ưu tiên được biểu thị bằng {{Glossary("Quality values", "giá trị chất lượng")}} tương đối gọi là _trọng số_. Giá trị chất lượng mặc định là `1`.

## Ví dụ

### Sử dụng tiêu đề Accept-Language

Yêu cầu sau đây có ưu tiên cho tiếng Đức sử dụng ngôn ngữ cơ sở `de`:

```http
Accept-Language: de
```

### Sử dụng giá trị chất lượng trong Accept-Language

Yêu cầu sau cho thấy sự ưa thích mạnh hơn đối với tiếng Đan Mạch, nhưng chấp nhận tiếng Anh Anh và các loại tiếng Anh khác ở mức độ ưu tiên thấp hơn:

```http
Accept-Language: da, en-gb;q=0.8, en;q=0.7
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- HTTP [thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation)
- Tiêu đề với kết quả thương lượng nội dung: {{HTTPHeader("Content-Language")}}
- Các tiêu đề tương tự khác: {{HTTPHeader("TE")}}, {{HTTPHeader("Accept-Encoding")}}, {{HTTPHeader("Accept")}}
