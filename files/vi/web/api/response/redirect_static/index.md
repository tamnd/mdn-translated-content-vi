---
title: "Response: phương thức tĩnh redirect()"
short-title: redirect()
slug: Web/API/Response/redirect_static
page-type: web-api-static-method
browser-compat: api.Response.redirect_static
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức tĩnh **`redirect()`** của giao diện {{domxref("Response")}} trả về một `Response` dẫn tới chuyển hướng đến URL đã chỉ định.

> [!NOTE]
> Phương thức này có thể dùng cùng [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API).
> Một service worker đang điều khiển có thể chặn yêu cầu của trang và chuyển hướng nó theo ý muốn.
> Điều này thực sự sẽ dẫn tới một chuyển hướng thật nếu service worker gửi nó lên upstream.

## Cú pháp

```js-nolint
Response.redirect(url)
Response.redirect(url, status)
```

### Tham số

- `url`
  - : URL mà phản hồi mới sẽ xuất phát từ đó.
- `status` {{optional_inline}}
  - : Một số tùy chọn cho biết mã trạng thái của phản hồi: một trong {{HTTPStatus("301", "301")}}, {{HTTPStatus("302", "302")}}, {{HTTPStatus("303", "303")}}, {{HTTPStatus("307", "307")}}, hoặc {{HTTPStatus("308", "308")}}. Nếu bỏ qua, mặc định là {{HTTPStatus("302", "302 Found")}}.

### Giá trị trả về

Một đối tượng {{domxref("Response")}}.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Status đã chỉ định không phải là status chuyển hướng.
- {{jsxref("TypeError")}}
  - : URL đã chỉ định không hợp lệ.

## Ví dụ

```js
Response.redirect("https://www.example.com", 302);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
