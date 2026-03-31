---
title: 418 I'm a teapot
slug: Web/HTTP/Reference/Status/418
page-type: http-status-code
spec-urls:
  - https://www.rfc-editor.org/rfc/rfc2324#section-2.3.2
  - https://www.rfc-editor.org/rfc/rfc9110#name-418-unused
sidebar: http
---

Mã trạng thái phản hồi HTTP **`418 I'm a teapot`** cho biết máy chủ từ chối pha cà phê vì nó vĩnh viễn là một chiếc ấm trà.
Một bình pha cà phê/trà kết hợp tạm thời hết cà phê nên trả về {{HTTPStatus("503")}} thay thế.
Lỗi này là tham chiếu đến Hyper Text Coffee Pot Control Protocol được định nghĩa trong các trò đùa Ngày Cá Tháng Tư năm 1998 và 2014.

Mặc dù ban đầu được định nghĩa trong [RFC 2324](https://www.rfc-editor.org/rfc/rfc2324) như một trò đùa Ngày Cá Tháng Tư, mã trạng thái này đã được chính thức dành riêng trong [RFC 9110](https://www.rfc-editor.org/rfc/rfc9110) do việc triển khai rộng rãi như một trò đùa, vì vậy nó không thể được gán bất kỳ ngữ nghĩa phi hài hước nào trong tương lai gần.

Một số trang web sử dụng phản hồi này cho các yêu cầu mà họ không muốn xử lý, chẳng hạn như các truy vấn tự động.

## Trạng thái

```http
418 I'm a teapot
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Wikipedia: Hyper Text Coffee Pot Control Protocol](https://en.wikipedia.org/wiki/Hyper_Text_Coffee_Pot_Control_Protocol)
