---
title: "CookieChangeEvent: thuộc tính changed"
short-title: changed
slug: Web/API/CookieChangeEvent/changed
page-type: web-api-instance-property
browser-compat: api.CookieChangeEvent.changed
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}

Thuộc tính chỉ đọc **`changed`** của giao diện {{domxref("CookieChangeEvent")}} trả về một mảng các cookie đã thay đổi.

Lưu ý rằng mảng này không bao gồm các cookie được tạo với ngày hết hạn trong quá khứ, vì các cookie đó sẽ bị xóa ngay lập tức.

## Giá trị

Một mảng các đối tượng chứa (các) cookie đã thay đổi. Mỗi đối tượng chứa các thuộc tính sau:

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

Trong ví dụ này, khi cookie được đặt, bộ lắng nghe sự kiện sẽ ghi thuộc tính `changed` ra bảng điều khiển. Phần tử đầu tiên trong mảng đó chứa một đối tượng đại diện cho cookie vừa được đặt.

```js
cookieStore.addEventListener("change", (event) => {
  console.log(event.changed[0]);
});

const oneDay = 24 * 60 * 60 * 1000;
cookieStore.set({
  name: "cookie1",
  value: "cookie1-value",
  expires: Date.now() + oneDay,
  domain: "example.com",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
