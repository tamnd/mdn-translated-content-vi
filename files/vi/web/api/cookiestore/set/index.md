---
title: "CookieStore: phương thức set()"
short-title: set()
slug: Web/API/CookieStore/set
page-type: web-api-instance-method
browser-compat: api.CookieStore.set
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}{{AvailableInWorkers("window_and_service")}}

Phương thức **`set()`** của giao diện {{domxref("CookieStore")}} đặt một cookie với `name` và `value` hoặc đối tượng `options` đã cho.

## Cú pháp

```js-nolint
set(name, value)
set(options)
```

### Tham số

Phương thức này yêu cầu một trong các giá trị sau:

- `name` {{optional_inline}}
  - : Một chuỗi chứa tên của cookie.
- `value` {{optional_inline}}
  - : Một chuỗi chứa giá trị của cookie.

Hoặc

- `options` {{optional_inline}}
  - : Một đối tượng chứa:
    - `domain` {{Optional_Inline}}
      - : Một chuỗi chứa miền của cookie. Mặc định là `null`.
    - `expires` {{Optional_Inline}}
      - : Một dấu thời gian, được cho dưới dạng {{glossary("Unix time")}} tính bằng mili giây, chứa ngày hết hạn của cookie. Mặc định là `null`.
    - `maxAge` {{Optional_Inline}}
      - : Một số biểu diễn số giây còn lại cho đến khi cookie hết hạn. Số không hoặc số âm sẽ làm cookie hết hạn ngay lập tức. Nếu cả `expires` và `maxAge` đều được đặt, lời gọi `set()` sẽ thất bại với `TypeError`. Mặc định là `null`.
    - `name`
      - : Một chuỗi chứa tên của cookie.
    - `partitioned` {{Optional_Inline}}
      - : Một giá trị boolean mặc định là `false`. Nếu đặt thành `true`, cookie được thiết lập sẽ là cookie phân vùng. Xem [Cookies Having Independent Partitioned State (CHIPS)](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Partitioned_cookies) để biết thêm thông tin.
    - `path` {{Optional_Inline}}
      - : Một chuỗi chứa đường dẫn của cookie. Mặc định là `/`.
    - `sameSite` {{Optional_Inline}}
      - : Một trong các giá trị [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) sau: [`"strict"`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#strict), [`"lax"`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#lax), hoặc [`"none"`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#none).
    - `value`
      - : Một chuỗi chứa giá trị của cookie.

> [!NOTE]
> Mặc dù các giá trị có thể được đặt ở đây và sẽ được dùng nội bộ, một số trình duyệt chỉ trả về các tùy chọn `name` và `value` từ {{domxref("CookieStore.get()")}} và {{domxref("CookieStore.getAll()")}}.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với {{jsxref("undefined")}} khi việc đặt cookie hoàn tất.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu origin không thể được {{glossary("Serialization", "tuần tự hóa")}} thành một URL.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu:
    - Cả thuộc tính `expires` và `maxAge` đều được đặt.
    - Việc đặt cookie với `name` và `value` hoặc `options` đã cho thất bại theo bất kỳ cách nào khác.

## Ví dụ

<!-- The examples don't work as live examples in MDN environment (due to unknown errors) -->

### Đặt cookie bằng tên và giá trị

Ví dụ này đặt một cookie bằng cách truyền `name` và `value` lần lượt là "cookie1" và "cookie1-value".
Các thuộc tính khác của cookie được đặt bằng các giá trị mặc định như được định nghĩa trong tham số [`options`](#options).

Đoạn mã đầu tiên chờ cookie được đặt xong: vì thao tác này có thể thất bại, thao tác được thực hiện trong khối `try...catch` và mọi lỗi sẽ được ghi ra console.
Sau đó nó lấy và ghi ra log cookie vừa được đặt.

```js
async function cookieTest() {
  // Set cookie: passing name and value
  try {
    await cookieStore.set("cookie1", "cookie1-value");
  } catch (error) {
    console.log(`Error setting cookie1: ${error}`);
  }

  // Get the cookie and log its values
  const cookie = await cookieStore.get("cookie1");
  console.log(cookie);
}
```

### Đặt cookie bằng tùy chọn

Ví dụ này đặt một cookie bằng cách truyền đối tượng `options` với `name`, `value`, `expires`, và `partitioned`.

Đoạn mã đầu tiên chờ cookie được đặt xong: vì thao tác này có thể thất bại, thao tác được thực hiện trong khối `try...catch` và mọi lỗi sẽ được ghi ra console.
Sau đó nó lấy và ghi ra log cookie vừa được đặt.

```js
async function cookieTest() {
  const day = 24 * 60 * 60 * 1000;
  const cookieName = "cookie2";
  try {
    // Set cookie: passing options
    await cookieStore.set({
      name: cookieName,
      value: `${cookieName}-value`,
      expires: Date.now() + day,
      partitioned: true,
    });
  } catch (error) {
    log(`Error setting ${cookieName}: ${error}`);
    console.log(error);
  }

  // Log the new cookie
  const cookie = await cookieStore.get(cookieName);
  console.log(cookie);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
