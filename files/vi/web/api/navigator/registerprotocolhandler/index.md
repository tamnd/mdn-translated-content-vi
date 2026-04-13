---
title: "Navigator: phương thức registerProtocolHandler()"
short-title: registerProtocolHandler()
slug: Web/API/Navigator/registerProtocolHandler
page-type: web-api-instance-method
browser-compat: api.Navigator.registerProtocolHandler
---

{{APIRef("HTML DOM")}}{{securecontext_header}}

Phương thức **{{domxref("Navigator")}}** **`registerProtocolHandler()`** cho phép các trang web đăng ký khả năng mở hoặc xử lý các lược đồ URL cụ thể (còn được gọi là giao thức).

Ví dụ: API này cho phép các trang webmail mở URL `mailto:` hoặc các trang web VoIP mở URL `tel:`.

Để đăng ký trình xử lý giao thức, trang web gọi `registerProtocolHandler()`, chuyển giao thức để đăng ký và URL mẫu.

Khi người dùng kích hoạt liên kết sử dụng giao thức đã đăng ký, trình duyệt sẽ chèn [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) từ liên kết được kích hoạt vào mẫu URL được cung cấp trong quá trình đăng ký trình xử lý và điều hướng trang hiện tại tới URL kết quả.

Trình duyệt có thể yêu cầu người dùng xác nhận rằng họ muốn trang được phép xử lý giao thức, khi giao thức được đăng ký hoặc khi người dùng kích hoạt liên kết.

## Cú pháp

```js-nolint
registerProtocolHandler(scheme, url)
```

### Thông số

- `scheme`
  - : Một chuỗi chứa lược đồ cho giao thức mà trang web muốn xử lý.

Đây có thể là một lược đồ tùy chỉnh, trong trường hợp đó tên của lược đồ đó: - Bắt đầu với `web+` - Chứa ít nhất một chữ cái sau tiền tố `web+` - Chỉ chứa chữ cái {{Glossary("ASCII")}} viết thường.

Nếu không, sơ đồ phải là một trong những sơ đồ sau: - `bitcoin` - `ftp` - `ftps` - `geo` - `im` - `irc` - `ircs` - `magnet` - `mailto` - `matrix` - `mms` - `news` - `nntp` - `openpgp4fpr` - `sftp` - `sip` - `sms` - `smsto` - `ssh` - `tel` - `urn` - `webcal` - `wtai` - `xmpp`

<!-- This must match: https://html.spec.whatwg.org/multipage/system-state.html#safelisted-scheme -->

- `url`
  - : Một chuỗi chứa URL của trình xử lý.
    URL này phải bao gồm `%s`, làm phần giữ chỗ sẽ được thay thế bằng URL [escaped](/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURIComponent) cần xử lý.

URL trình xử lý phải sử dụng lược đồ `https` và phải có cùng {{glossary("origin")}} với trang web đang cố gắng đăng ký trình xử lý.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Tác nhân người dùng đã chặn đăng ký.
    Điều này có thể xảy ra nếu:
    - Lược đồ (giao thức) đã đăng ký không hợp lệ, chẳng hạn như lược đồ do trình duyệt tự xử lý (`https:`, `about:`, v.v.)
    - {{Glossary("origin")}} của URL xử lý không khớp với nguồn gốc của trang gọi API này.
    - Lược đồ URL của trình xử lý không phải là `https`.

- `SyntaxError` {{domxref("DOMException")}}
  - : Thiếu phần giữ chỗ `%s` trong URL xử lý.

## Ví dụ

### Đăng ký trình xử lý cho giao thức mailto

Việc các trang web liên kết đến các tài nguyên bằng giao thức không phải `https` là điều khá phổ biến. Một ví dụ là giao thức `mailto:`. Tác giả web có thể sử dụng liên kết `mailto` khi họ muốn cung cấp một cách thuận tiện để người dùng gửi email trực tiếp từ trang web:

```html
<a href="mailto:webmaster@example.com">Web Master</a>
```

Khi liên kết được kích hoạt, trình duyệt sẽ khởi chạy ứng dụng máy tính để bàn mặc định để xử lý email. Bạn có thể coi đây là trình xử lý giao thức _desktop-based_.

Trình xử lý giao thức dựa trên web cũng cho phép các ứng dụng dựa trên web tham gia vào quá trình này. Một ứng dụng web email tại `mail.example.org` có thể đăng ký để xử lý các liên kết `mailto` bằng mã như thế này:

```js
navigator.registerProtocolHandler("mailto", "https://mail.example.org/?to=%s");
```

Sau đó, khi người dùng nhấp vào liên kết `mailto` trên bất kỳ trang web nào, trình duyệt sẽ (sau khi có thể yêu cầu trình duyệt xác nhận) điều hướng đến `https://mail.example.org/?to=mailto:webmaster@example.com`. Trang này có thể phân tích tham số URL để trích xuất địa chỉ và sử dụng thông số này để khởi tạo email.

### Đăng ký trình xử lý cho giao thức tùy chỉnh

Trong ví dụ này, một trang đăng ký trình xử lý cho giao thức `web+burger` với mã như sau:

```js
navigator.registerProtocolHandler(
  "web+burger",
  "https://burgers.example.org/?burger=%s",
);
```

Sau đó, người dùng truy cập một trang có chứa liên kết như thế này:

```html
<a href="web+burger:cheeseburger">cheeseburger</a>
```

Nếu người dùng kích hoạt liên kết `web+burger`, trình duyệt sẽ (sau khi có thể yêu cầu người dùng xác nhận) điều hướng đến `https://burgers.example.org/?burger=web+burger:cheeseburger`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
