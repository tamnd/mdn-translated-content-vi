---
title: Cấu hình chính sách referrer
short-title: Chính sách referrer
slug: Web/Security/Practical_implementation_guides/Referrer_policy
page-type: guide
sidebar: security
---

Tiêu đề [`Referrer-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Referrer-Policy) cung cấp khả năng kiểm soát chi tiết về cách và thời điểm trình duyệt gửi tiêu đề [`Referer`](/en-US/docs/Web/HTTP/Reference/Headers/Referer).

## Vấn đề

Khi người dùng điều hướng tới một trang web qua một liên kết, hoặc khi một website tải một tài nguyên bên ngoài, trình duyệt sẽ thông báo cho trang đích biết nguồn gốc của các yêu cầu thông qua tiêu đề HTTP `Referer` (sic). Mặc dù điều này có thể hữu ích cho nhiều mục đích, nó cũng có thể gây ra rủi ro đối với quyền [riêng tư](/en-US/docs/Web/Privacy) của người dùng.

Ví dụ, nếu một trang tại `https://example.com/page.html` chứa HTML sau:

```html
<img src="https://not.example.com/image.jpg" />
```

Trình duyệt sẽ gửi một yêu cầu như sau:

```http
GET /image.jpg HTTP/1.1
Host: not.example.com
Referer: https://example.com/page.html
```

`not.example.com` giờ biết yêu cầu đó đến từ đâu. Ngay cả lượng thông tin nhỏ như vậy cũng tạo ra rủi ro riêng tư.

Các trường hợp khác có thể khiến trình duyệt truyền các URL chỉ dùng nội bộ, mà có thể nó không có ý định tiết lộ, hoặc các tham số URL chứa thông tin nhạy cảm.

## Giải pháp

Dùng [`Referrer-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Referrer-Policy) để giới hạn thông tin có trong tiêu đề `Referer` hoặc để ngăn tiêu đề `Referer` được gửi đi hoàn toàn.

Các directive hữu ích nhất của `Referrer-Policy` được liệt kê dưới đây theo thứ tự giảm dần về độ nghiêm ngặt. Hãy chọn directive nghiêm ngặt nhất mà vẫn cho phép trang web của bạn hoạt động bình thường:

- `no-referrer`: Không bao giờ gửi tiêu đề `Referer`.
- `same-origin`: Gửi tiêu đề `Referrer`, nhưng chỉ trên các yêu cầu cùng origin.
- `strict-origin`: Gửi tiêu đề `Referrer` tới mọi origin, nhưng chỉ bao gồm URL mà không có đường dẫn (ví dụ: `https://example.com/`).
- `strict-origin-when-cross-origin`: Gửi tiêu đề `Referrer` đầy đủ trên các yêu cầu cùng origin và chỉ URL không có đường dẫn trên các yêu cầu cross-origin. Đây là giá trị mặc định.

Mặc dù còn có các directive `Referrer-Policy` khác, chúng không bảo vệ quyền riêng tư người dùng hoặc hạn chế mức độ lộ thông tin hiệu quả như các tùy chọn nêu trên. Trong các phiên bản Firefox và Safari gần đây, các directive "không an toàn" (`no-referrer-when-downgrade`, `origin-when-cross-origin`, và `unsafe-url`) hoạt động như `strict-origin-when-cross-origin`.

Nếu bạn không thể dùng tiêu đề `Referrer-Policy`, bạn có thể thay vào đó đặt chính sách cho toàn trang bằng phần tử [`<meta http-equiv="Referrer-Policy" content="…">`](/en-US/docs/Web/HTML/Reference/Elements/meta/http-equiv). Đây nên là phần tử {{htmlelement("meta")}} đầu tiên xuất hiện trong {{htmlelement("head")}} của tài liệu. Bạn cũng có thể đặt chính sách trên từng phần tử riêng lẻ bằng thuộc tính HTML [`referrerpolicy`](/en-US/docs/Web/HTML/Reference/Elements/a#referrerpolicy) và trên từng yêu cầu [fetch](/en-US/docs/Web/API/Window/fetch) bằng thuộc tính {{domxref("Request.referrerPolicy")}}.

## Ví dụ

Trên `example.com`, chỉ gửi tiêu đề `Referer` khi tải hoặc liên kết tới các tài nguyên `example.com` khác:

```http
Referrer-Policy: same-origin
```

Gửi referrer rút gọn trên các yêu cầu cross-origin và referrer đầy đủ trên các yêu cầu cùng origin:

```http
Referrer-Policy: strict-origin-when-cross-origin
```

Tắt referrer cho các trình duyệt không hỗ trợ `strict-origin-when-cross-origin`; dùng `strict-origin-when-cross-origin` cho các trình duyệt có hỗ trợ:

```http
Referrer-Policy: no-referrer, strict-origin-when-cross-origin
```

Làm tương tự, nhưng với phần tử `<meta>`:

```html
<meta
  http-equiv="Referrer-Policy"
  content="no-referrer, strict-origin-when-cross-origin" />
```

Thuộc tính `referrerpolicy` không hỗ trợ nhiều giá trị, vì vậy chỉ đặt `no-referrer`:

```html
<a href="https://example.org/" referrerpolicy="no-referrer"> My link </a>
```

## Xem thêm

- [Tiêu đề Referer: các vấn đề về quyền riêng tư và bảo mật](/en-US/docs/Web/Privacy/Guides/Referer_header:_privacy_and_security_concerns)
