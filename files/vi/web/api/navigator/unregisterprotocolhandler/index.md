---
title: "Navigator: phương thức unregisterProtocolHandler()"
short-title: unregisterProtocolHandler()
slug: Web/API/Navigator/unregisterProtocolHandler
page-type: web-api-instance-method
browser-compat: api.Navigator.unregisterProtocolHandler
---

{{APIRef("HTML DOM")}}{{securecontext_header}}

Phương thức **{{domxref("Navigator")}}** **`unregisterProtocolHandler()`** loại bỏ trình xử lý giao thức cho một URL nhất định [scheme](#permitted_schemes).

Phương thức này ngược lại với **`registerProtocolHandler()`**.

## Cú pháp

```js-nolint
unregisterProtocolHandler(scheme, url)
```

### Thông số

- `scheme`
  - : Một chuỗi chứa [permitted scheme](#permitted_schemes) trong trình xử lý giao thức sẽ không được đăng ký.
    Ví dụ: bạn có thể hủy đăng ký trình xử lý các liên kết tin nhắn văn bản SMS bằng cách chuyển lược đồ `"sms"`.
- `url`
  - : Một chuỗi chứa URL của trình xử lý.
    **URL này phải khớp với URL đã được sử dụng để đăng ký trình xử lý (ví dụ: URL này phải bao gồm `%s`)**.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Tác nhân người dùng đã chặn việc hủy đăng ký.
    Điều này có thể xảy ra nếu:
    - Lược đồ (giao thức) không hợp lệ, chẳng hạn như lược đồ do trình duyệt tự xử lý (`https:`, `about:`, v.v.)
    - {{Glossary("origin")}} của URL xử lý không khớp với nguồn gốc của trang gọi API này.
    - Trình duyệt yêu cầu chức năng này được gọi từ ngữ cảnh an toàn.
    - Trình duyệt yêu cầu URL của trình xử lý phải qua HTTPS.
- `SyntaxError` {{domxref("DOMException")}}
  - : Thiếu phần giữ chỗ `%s` trong URL xử lý.

## Đề án được phép

Vì lý do bảo mật, `unregisterProtocolHandler()` hạn chế những chương trình nào có thể hủy đăng ký.

**Chương trình tùy chỉnh** có thể bị hủy đăng ký miễn là:

- Tên của lược đồ tùy chỉnh bắt đầu bằng `web+`
- Tên lược đồ tùy chỉnh bao gồm ít nhất 1 chữ cái sau tiền tố `web+`
- Lược đồ tùy chỉnh chỉ có các chữ cái ASCII viết thường trong tên của nó.

Ví dụ: `web+burger`, như được hiển thị trong [Example](#examples) bên dưới.

Nếu không, sơ đồ phải là một trong những sơ đồ sau:

- `bitcoin`
- `ftp`
- `ftps`
- `geo`
- `im`
- `irc`
- `ircs`
- `magnet`
- `mailto`
- `matrix`
- `mms`
- `news`
- `nntp`
- `openpgp4fpr`
- `sftp`
- `sip`
- `sms`
- `smsto`
- `ssh`
- `tel`
- `urn`
- `webcal`
- `wtai`
- `xmpp`

## Ví dụ

Nếu trang web của bạn là `burgers.example.com` và bạn có sơ đồ `web+burger:`, bạn có thể hủy đăng ký trình xử lý cho trang web đó như sau:

```js
navigator.unregisterProtocolHandler(
  "web+burger",
  "https://burgers.example.com/?burger=%s",
);
```

Tập lệnh này phải được chạy từ cùng nguồn gốc với URL trình xử lý (vì vậy, bất kỳ trang nào tại `https://burgers.example.com`) và URL trình xử lý phải là `http` hoặc `https`.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
