---
title: "CookieStore: phương thức getAll()"
short-title: getAll()
slug: Web/API/CookieStore/getAll
page-type: web-api-instance-method
browser-compat: api.CookieStore.getAll
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}{{AvailableInWorkers("window_and_service")}}

Phương thức **`getAll()`** của giao diện {{domxref("CookieStore")}} trả về một {{jsxref("Promise")}} được giải quyết thành một mảng các cookie khớp với `name` hoặc `options` được truyền vào.
Nếu không truyền tham số nào, phương thức sẽ trả về tất cả cookie cho ngữ cảnh hiện tại.

## Cú pháp

```js-nolint
getAll()
getAll(name)
getAll(options)
```

### Tham số

- `name` {{optional_inline}}
  - : Một chuỗi chứa tên của cookie.

Hoặc

- `options` {{optional_inline}}
  - : Một đối tượng chứa:
    - `name`
      - : Một chuỗi chứa tên của cookie.
    - `url`
      - : Một chuỗi chứa URL của cookie.

> [!NOTE]
> Tùy chọn `url` cho phép sửa đổi một cookie được đặt phạm vi dưới một URL cụ thể. Service worker có thể lấy các cookie sẽ được gửi tới bất kỳ URL nào trong phạm vi của chúng. Từ một tài liệu, bạn chỉ có thể lấy các cookie tại URL hiện tại, vì vậy URL hợp lệ duy nhất trong ngữ cảnh tài liệu là URL của chính tài liệu đó.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một mảng các đối tượng biểu diễn các cookie khớp với `name` hoặc `options` đã cho.

Mỗi đối tượng chứa các thuộc tính sau:

- `domain`
  - : Một chuỗi chứa miền của cookie.

- `expires`
  - : Một dấu thời gian, được cho dưới dạng [Unix time](/en-US/docs/Glossary/Unix_time) tính bằng mili giây, chứa ngày hết hạn của cookie.

- `name`
  - : Một chuỗi chứa tên của cookie.

- `partitioned`
  - : Một giá trị boolean cho biết cookie có phải là cookie phân vùng (`true`) hay không (`false`). Xem [Cookies Having Independent Partitioned State (CHIPS)](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Partitioned_cookies) để biết thêm thông tin.

- `path`
  - : Một chuỗi chứa đường dẫn của cookie.

- `sameSite`
  - : Một trong các giá trị [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) sau: [`"strict"`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#strict), [`"lax"`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#lax), hoặc [`"none"`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#none).

- `secure`
  - : Một giá trị boolean cho biết cookie chỉ được dùng trong các ngữ cảnh bảo mật (`true`) hay không (`false`).

- `value`
  - : Một chuỗi chứa giá trị của cookie.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu origin không {{glossary("Serialization", "chuyển đổi tuần tự")}} thành một URL.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu:
    - Phương thức được gọi trên luồng chính, và tùy chọn `url` được chỉ định nhưng không khớp với URL của cửa sổ hiện tại.
    - Phương thức được gọi trong worker và tùy chọn `url` được chỉ định, nhưng không khớp với origin của worker.
    - Việc truy vấn các cookie được biểu diễn bởi `name` hoặc `options` đã cho thất bại.

## Ví dụ

<!-- The examples don't work as live examples in MDN environment (due to unknown errors) -->

### Lấy tất cả cookie cho ngữ cảnh này

Ví dụ này cho thấy cách lấy tất cả cookie trong ngữ cảnh hiện tại.

Đầu tiên chúng ta định nghĩa `setTestCookies()`, hàm này tạo các cookie thử nghiệm "cookie1" và "cookie2", đồng thời ghi mọi lỗi ra log.

```js
async function setTestCookies() {
  // Set two cookies
  try {
    await cookieStore.set("cookie1", "cookie1-value");
  } catch (error) {
    console.log(`Error setting cookie1: ${error}`);
  }

  try {
    await cookieStore.set("cookie2", "cookie2-value");
  } catch (error) {
    console.log(`Error setting cookie2: ${error}`);
  }
}
```

Phương thức `cookieTest()` gọi `setTestCookies()` rồi chờ `getAll()`.
Thao tác này trả về một {{jsxref("Promise")}} được giải quyết với tất cả cookie cho ngữ cảnh này dưới dạng một mảng đối tượng, hoặc một mảng rỗng nếu không có cookie nào.
Nếu promise được trả về giải quyết với một mảng có chứa thông tin cookie, chúng ta lặp qua mảng và ghi từng cookie ("cookie1" và "cookie2") ra log.

```js
async function cookieTest() {
  // Set our test cookies
  await setTestCookies();

  // Get all cookies
  const cookies = await cookieStore.getAll();

  // Iterate the cookies, or log that none were found
  if (cookies.length > 0) {
    console.log(`Found cookies: ${cookies.length}:`);
    cookies.forEach((cookie) => console.log(cookie));
  } else {
    console.log("Cookies not found");
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
