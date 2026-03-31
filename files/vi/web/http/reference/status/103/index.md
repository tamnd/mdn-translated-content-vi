---
title: 103 Early Hints
slug: Web/HTTP/Reference/Status/103
page-type: http-status-code
browser-compat: http.status.103
sidebar: http
---

Mã trạng thái [phản hồi thông tin](/en-US/docs/Web/HTTP/Reference/Status#informational_responses) HTTP **`103 Early Hints`** có thể được máy chủ gửi trong khi vẫn đang chuẩn bị phản hồi, cùng với các gợi ý về các trang và tài nguyên mà máy chủ dự kiến phản hồi cuối cùng sẽ liên kết đến.
Điều này cho phép trình duyệt [kết nối trước (preconnect)](/en-US/docs/Web/HTML/Reference/Attributes/rel/preconnect) đến các trang hoặc bắt đầu [tải trước (preloading)](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) tài nguyên ngay cả trước khi máy chủ đã chuẩn bị và gửi phản hồi cuối cùng.
Các tài nguyên được tải trước do gợi ý sớm sẽ được client tìm nạp ngay khi nhận được các gợi ý.

Phản hồi gợi ý sớm chủ yếu được dùng với tiêu đề {{HTTPHeader("Link")}}, chỉ ra các tài nguyên cần tải.
Nó cũng có thể chứa tiêu đề [`Content-Security-Policy`](/en-US/docs/Web/HTTP/Guides/CSP) được thực thi trong khi xử lý gợi ý sớm.

Máy chủ có thể gửi nhiều phản hồi `103`, ví dụ sau khi chuyển hướng.
Trình duyệt chỉ xử lý phản hồi gợi ý sớm đầu tiên, và phản hồi này phải bị loại bỏ nếu yêu cầu dẫn đến chuyển hướng qua nguồn gốc khác.

> [!NOTE]
> Vì lý do tương thích và bảo mật, nên [chỉ gửi các phản hồi HTTP `103 Early Hints` qua HTTP/2 trở lên](https://www.rfc-editor.org/rfc/rfc8297#section-3) trừ khi client được biết là xử lý các phản hồi thông tin đúng cách.
>
> Hầu hết các trình duyệt giới hạn hỗ trợ cho HTTP/2 trở lên vì lý do này. Xem [tương thích trình duyệt](#browser_compatibility) bên dưới.
> Mặc dù vậy, các ví dụ dưới đây sử dụng ký hiệu theo phong cách HTTP/1.1 như theo quy ước thông thường.

## Cú pháp

```http
103 Early Hints
```

## Ví dụ

### Ví dụ về Preconnect

Phản hồi gợi ý sớm `103` sau đây cho thấy phản hồi gợi ý sớm trong đó máy chủ cho biết client có thể muốn kết nối trước đến một nguồn gốc cụ thể (`https://cdn.example.com`).
Giống như thuộc tính HTML [`rel=preconnect`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preconnect), đây là gợi ý rằng trang có khả năng cần tài nguyên từ nguồn gốc của tài nguyên mục tiêu, và trình duyệt có thể cải thiện trải nghiệm người dùng bằng cách khởi tạo kết nối đến nguồn gốc đó trước.

```http
103 Early Hint
Link: <https://cdn.example.com>; rel=preconnect, <https://cdn.example.com>; rel=preconnect; crossorigin
```

Ví dụ này kết nối trước đến `https://cdn.example.com` hai lần:

- Kết nối đầu tiên sẽ được dùng để tải các tài nguyên có thể được tìm nạp mà không cần CORS, chẳng hạn như hình ảnh.
- Kết nối thứ hai bao gồm thuộc tính [`crossorigin`](/en-US/docs/Web/HTML/Reference/Attributes/crossorigin) và sẽ được dùng để tải các tài nguyên được bảo vệ bởi [CORS](/en-US/docs/Web/HTTP/Guides/CORS), chẳng hạn như phông chữ.

Các tài nguyên được bảo vệ bởi CORS phải được tìm nạp qua một kết nối hoàn toàn riêng biệt. Nếu bạn chỉ cần một loại tài nguyên từ một nguồn gốc thì bạn chỉ cần kết nối trước một lần.

Sau đó máy chủ gửi phản hồi cuối cùng.
Phản hồi này bao gồm tải trước phông chữ crossorigin và một `<img>` được tải từ nguồn gốc bổ sung.

```http
200 OK
Content-Type: text/html

<!doctype html>
...
<link rel="preload" href="https://cdn.example.com/fonts/my-font.woff2" as="font" type="font/woff2" crossorigin>
...
<img src="https://cdn.example.com/images/image.jpg" alt="">
...
```

### Ví dụ về Preload

Phản hồi gợi ý sớm `103` sau đây cho biết stylesheet `style.css` có thể được cần bởi phản hồi cuối cùng.

```http
103 Early Hint
Link: </style.css>; rel=preload; as=style
```

Sau đó máy chủ gửi phản hồi cuối cùng.
Phản hồi này bao gồm liên kết đến stylesheet, có thể đã được tải trước từ gợi ý sớm.

```http
200 OK
Content-Type: text/html

<!doctype html>
...
<link rel="stylesheet" rel="preload" href="style.css" />
...
```

### Phản hồi gợi ý sớm với CSP

Ví dụ sau đây cho thấy cùng phản hồi gợi ý sớm nhưng có tiêu đề `Content-Security-Policy` được bao gồm.

```http
103 Early Hint
Content-Security-Policy: style-src: self;
Link: </style.css>; rel=preload; as=style
```

Phản hồi sớm giới hạn việc tải trước chỉ với cùng nguồn gốc của yêu cầu.
Stylesheet sẽ được tải trước nếu nguồn gốc khớp.

Phản hồi cuối cùng có thể đặt CSP thành `none`, như hiển thị bên dưới.
Stylesheet đã được tải trước, nhưng sẽ không được sử dụng khi hiển thị trang.

```http
200 OK
Content-Security-Policy: style-src: none;
Content-Type: text/html

<!doctype html>
...
<link rel="stylesheet" rel="preload" href="style.css" />
...
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Link")}}
- [Chia sẻ tài nguyên qua nguồn gốc (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [Chính sách bảo mật nội dung (CSP)](/en-US/docs/Web/HTTP/Guides/CSP)
- [`rel="preconnect"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preconnect) (thuộc tính {{htmlelement("link")}})
- [`rel="preload"`](/en-US/docs/Web/HTML/Reference/Attributes/rel/preload) (thuộc tính {{htmlelement("link")}})
- [`fetchpriority`](/en-US/docs/Web/HTML/Reference/Elements/link#fetchpriority) (thuộc tính {{htmlelement("link")}})
- [Cập nhật Early Hints: Cách Cloudflare, Google và Shopify đang hợp tác để xây dựng Internet nhanh hơn cho mọi người](https://blog.cloudflare.com/early-hints-performance/) từ blog Cloudflare
