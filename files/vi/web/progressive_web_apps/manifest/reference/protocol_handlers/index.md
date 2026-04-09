---
title: protocol_handlers
slug: Web/Progressive_web_apps/Manifest/Reference/protocol_handlers
page-type: web-manifest-member
status:
  - experimental
browser-compat: manifests.webapp.protocol_handlers
sidebar: pwasidebar
---

{{SeeCompatTable}}

Member `protocol_handlers` chỉ định một mảng các đối tượng là những giao thức mà ứng dụng web này có thể đăng ký và xử lý. Protocol handler đăng ký ứng dụng trong các tùy chọn ứng dụng của hệ điều hành; việc đăng ký này gắn một ứng dụng cụ thể với scheme giao thức đã cho. Ví dụ, khi dùng protocol handler `mailto://` trên một trang web, các ứng dụng email đã đăng ký sẽ mở ra.

Sau khi đăng ký một ứng dụng web làm protocol handler, khi người dùng nhấp vào một siêu liên kết có scheme cụ thể như `mailto://` hoặc `web+music://` từ trình duyệt hoặc ứng dụng gốc, PWA đã đăng ký sẽ mở ra và nhận URL.

## Giá trị

Đối tượng protocol handler có thể chứa các giá trị sau:

- `protocol` {{experimental_inline}}
  - : Một chuỗi bắt buộc chứa protocol cần được xử lý; ví dụ: `mailto`, `ms-word`, `web+jngl`.

- `url` {{experimental_inline}}
  - : URL HTTPS bắt buộc nằm trong [`scope`](/en-US/docs/Web/Progressive_web_apps/Manifest/Reference/scope) của ứng dụng, nơi sẽ xử lý protocol.
    Token `%s` sẽ được thay thế bằng URL bắt đầu với scheme của protocol handler. Nếu `url` là một URL tương đối, URL cơ sở sẽ là URL của manifest.

## Ví dụ

Trong ví dụ này, manifest của ứng dụng web khai báo rằng ứng dụng nên được đăng ký để xử lý các protocol `web+jngl` và `web+jnglstore`.

```json
{
  "protocol_handlers": [
    {
      "protocol": "web+jngl",
      "url": "/lookup?type=%s"
    },
    {
      "protocol": "web+jnglstore",
      "url": "/shop?for=%s"
    }
  ]
}
```

Nhà phát triển có thể thêm một trường trong manifest.json để khai báo những protocol mà ứng dụng web có thể xử lý. Như thấy trong ví dụ trên, khóa được đặt tên là `protocol_handlers` và nó chứa một mảng các đối tượng khai báo protocol handler.

Việc đăng ký ứng dụng để xử lý scheme URL phụ thuộc vào hệ điều hành. Sự liên kết này thường được thực hiện trong quá trình cài đặt ứng dụng nhưng cũng có thể được làm sau đó từ một ứng dụng đã cài đặt.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
