---
title: "CookieStore: phương thức get()"
short-title: get()
slug: Web/API/CookieStore/get
page-type: web-api-instance-method
browser-compat: api.CookieStore.get
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}{{AvailableInWorkers("window_and_service")}}

Phương thức **`get()`** của giao diện {{domxref("CookieStore")}} trả về một {{jsxref("Promise")}} được giải quyết thành một cookie duy nhất khớp với `name` hoặc đối tượng `options` đã cho. Phương thức sẽ trả về cookie khớp đầu tiên.

## Cú pháp

```js-nolint
get(name)
get(options)
```

### Tham số

Phương thức này yêu cầu một trong các giá trị sau:

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

Một {{jsxref("Promise")}} được giải quyết với một đối tượng biểu diễn cookie đầu tiên khớp với `name` hoặc `options` đã gửi, hoặc `null` nếu không có cookie nào khớp.

Đối tượng được trả về khi có kết quả khớp chứa các thuộc tính sau:

- `domain` {{experimental_inline}} {{non-standard_inline}}
  - : Một chuỗi chứa miền của cookie.

- `expires` {{experimental_inline}} {{non-standard_inline}}
  - : Một dấu thời gian, được cho dưới dạng {{glossary("Unix time")}} tính bằng mili giây, chứa ngày hết hạn của cookie.

- `name` {{experimental_inline}} {{non-standard_inline}}
  - : Một chuỗi chứa tên của cookie.

- `partitioned` {{experimental_inline}} {{non-standard_inline}}
  - : Một giá trị boolean cho biết cookie có phải là cookie phân vùng (`true`) hay không (`false`). Xem [Cookies Having Independent Partitioned State (CHIPS)](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Partitioned_cookies) để biết thêm thông tin.

- `path` {{experimental_inline}} {{non-standard_inline}}
  - : Một chuỗi chứa đường dẫn của cookie.

- `sameSite` {{experimental_inline}} {{non-standard_inline}}
  - : Một trong các giá trị [`SameSite`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#samesitesamesite-value) sau: [`"strict"`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#strict), [`"lax"`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#lax), hoặc [`"none"`](/en-US/docs/Web/HTTP/Reference/Headers/Set-Cookie#none).

- `secure` {{experimental_inline}} {{non-standard_inline}}
  - : Một giá trị boolean cho biết cookie chỉ được dùng trong các ngữ cảnh bảo mật (`true`) hay không (`false`).

- `value` {{experimental_inline}} {{non-standard_inline}}
  - : Một chuỗi chứa giá trị của cookie.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu origin không {{glossary("Serialization", "chuyển đổi tuần tự")}} thành một URL.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu:
    - Tham số `options` là một đối tượng rỗng.
    - Phương thức được gọi trên luồng chính, và tùy chọn `url` được chỉ định nhưng không khớp với URL của cửa sổ hiện tại.
    - Phương thức được gọi trong worker và tùy chọn `url` được chỉ định, nhưng không khớp với origin của worker.
    - Việc truy vấn các cookie được biểu diễn bởi `name` hoặc `options` đã cho thất bại.

## Ví dụ

<!-- The examples don't work as live examples in MDN environment (due to unknown errors) -->

### Lấy cookie theo tên

Ví dụ này cho thấy cách lấy một cookie cụ thể theo tên.

Đoạn mã đầu tiên tạo một cookie tên là "cookie1" bằng {{domxref("CookieStore.set()")}}, đồng thời ghi mọi lỗi ra console.
Sau đó nó chờ `get()` để lấy thông tin về chính cookie đó.
Nếu promise được trả về giải quyết với một đối tượng, chúng ta sẽ ghi cookie ra log; nếu không, chúng ta ghi rằng không tìm thấy cookie khớp.

```js
async function cookieTest() {
  // Set test cookie
  try {
    await cookieStore.set("cookie1", "cookie1-value");
  } catch (error) {
    console.log(`Error setting cookie1: ${error}`);
  }

  // Get cookie, specifying name
  const cookie = await cookieStore.get("cookie1");

  if (cookie) {
    console.log(cookie);
  } else {
    console.log("cookie1: Cookie not found");
  }
}

cookieTest();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
