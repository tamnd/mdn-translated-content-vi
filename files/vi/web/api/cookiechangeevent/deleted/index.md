---
title: "CookieChangeEvent: thuộc tính deleted"
short-title: deleted
slug: Web/API/CookieChangeEvent/deleted
page-type: web-api-instance-property
browser-compat: api.CookieChangeEvent.deleted
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}

Thuộc tính chỉ đọc **`deleted`** của giao diện {{domxref("CookieChangeEvent")}} trả về một mảng các cookie đã bị xóa bởi thể hiện `CookieChangeEvent` đã cho.

Lưu ý rằng mảng này sẽ bao gồm các cookie được tạo với ngày hết hạn trong quá khứ, vì các cookie đó sẽ bị xóa ngay lập tức.

## Giá trị

Một mảng các đối tượng chứa (các) cookie đã bị xóa. Mỗi đối tượng chứa các thuộc tính sau:

- `name`
  - : Một chuỗi chứa tên của cookie.
- `value`
  - : Một chuỗi chứa giá trị của cookie.
- `domain`
  - : Một chuỗi chứa miền của cookie.
- `path`
  - : Một chuỗi chứa đường dẫn của cookie.
- `expires`
  - : Một dấu thời gian, được cho dưới dạng {{glossary("Unix time")}} tính bằng mili giây, chứa ngày hết hạn của cookie.
- `secure`
  - : Một {{jsxref("boolean")}} cho biết cookie có chỉ được dùng trong ngữ cảnh an toàn (HTTPS thay vì HTTP) hay không.
- `sameSite`
  - : Một trong các giá trị [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) sau:
    - `"strict"`
      - : Cookie sẽ chỉ được gửi trong ngữ cảnh bên thứ nhất và không được gửi kèm các yêu cầu do website bên thứ ba khởi tạo.
    - `"lax"`
      - : Cookie không được gửi trong các yêu cầu phụ cross-site thông thường (ví dụ để tải ảnh hoặc frame vào một site bên thứ ba), nhưng sẽ được gửi khi người dùng điều hướng trong site gốc (tức là khi theo một liên kết).
    - `"none"`
      - : Cookie sẽ được gửi trong mọi ngữ cảnh.

- `partitioned`
  - : Một boolean cho biết cookie có phải là cookie phân vùng (`true`) hay không (`false`). Xem [Cookies Having Independent Partitioned State (CHIPS)](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Partitioned_cookies) để biết thêm thông tin.

## Ví dụ

Trong ví dụ này, khi cookie bị xóa, bộ lắng nghe sự kiện sẽ ghi phần tử đầu tiên trong thuộc tính `CookieChangeEvent.deleted` ra bảng điều khiển. Nó chứa một đối tượng đại diện cho cookie vừa bị xóa.

```js
cookieStore.addEventListener("change", (event) => {
  console.log(event.deleted[0]);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
