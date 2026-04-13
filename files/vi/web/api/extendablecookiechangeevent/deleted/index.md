---
title: "ExtendableCookieChangeEvent: deleted property"
short-title: deleted
slug: Web/API/ExtendableCookieChangeEvent/deleted
page-type: web-api-instance-property
browser-compat: api.ExtendableCookieChangeEvent.deleted
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}{{AvailableInWorkers("service")}}

Thuộc tính chỉ đọc **`deleted`** của giao diện {{domxref("ExtendableCookieChangeEvent")}} trả về bất kỳ cookie nào đã được xóa bởi phiên bản `ExtendableCookieChangeEvent` đã cho.

## Giá trị

Mảng các đối tượng chứa các cookie đã bị xóa. Mỗi đối tượng chứa các thuộc tính sau:

- `name`
  - : Chuỗi chứa tên cookie.
- `value`
  - : Chuỗi chứa giá trị cookie.
- `domain`
  - : Chuỗi chứa miền của cookie.
- `path`
  - : Chuỗi chứa đường dẫn của cookie.
- `expires`
  - : Dấu thời gian, được biểu thị dưới dạng [Unix time](/en-US/docs/Glossary/Unix_time) tính bằng mili giây, chứa ngày hết hạn của cookie.
- `secure`
  - : Giá trị {{jsxref("boolean")}} cho biết cookie chỉ được sử dụng trong ngữ cảnh bảo mật (HTTPS thay vì HTTP).
- `sameSite`
  - : Một trong các giá trị [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) sau:
    - `"strict"`
      - : Cookie sẽ chỉ được gửi trong ngữ cảnh bên đầu tiên và không được gửi với các yêu cầu được khởi tạo bởi các trang web bên thứ ba.
    - `"lax"`
      - : Cookie không được gửi trong các yêu cầu phụ qua trang, nhưng được gửi khi người dùng điều hướng trong trang gốc (tức là khi theo dõi một liên kết).
    - `"none"`
      - : Cookie sẽ được gửi trong tất cả các ngữ cảnh.

- `partitioned`
  - : Giá trị boolean cho biết cookie có phải là cookie được phân vùng (`true`) hay không (`false`). Xem [Cookies Having Independent Partitioned State (CHIPS)](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Partitioned_cookies) để biết thêm thông tin.

## Ví dụ

Trong ví dụ này khi cookie bị xóa, trình nghe sự kiện ghi phần tử đầu tiên trong thuộc tính `deleted` vào console. Nó chứa đối tượng đại diện cho cookie vừa bị xóa.

```js
self.addEventListener("cookiechange", (event) => {
  console.log(event.deleted[0]);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
