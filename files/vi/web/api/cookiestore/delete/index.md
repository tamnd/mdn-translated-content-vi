---
title: "CookieStore: phương thức delete()"
short-title: delete()
slug: Web/API/CookieStore/delete
page-type: web-api-instance-method
browser-compat: api.CookieStore.delete
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}{{AvailableInWorkers("window_and_service")}}

Phương thức **`delete()`** của giao diện {{domxref("CookieStore")}} xóa một cookie khớp với `name` hoặc đối tượng `options` đã cho.
Phương thức này làm cho cookie hết hạn bằng cách đổi ngày của nó thành một thời điểm trong quá khứ.

Lưu ý rằng sẽ không có lỗi nếu không thể khớp được cookie: promise được trả về sẽ hoàn thành khi cookie khớp bị xóa hoặc khi không có cookie nào khớp.

## Cú pháp

```js-nolint
delete(name)
delete(options)
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
    - `domain` {{Optional_Inline}}
      - : Một chuỗi chứa miền của cookie. Mặc định là `null`.
    - `path` {{Optional_Inline}}
      - : Một chuỗi chứa đường dẫn. Mặc định là `/`.
    - `partitioned` {{Optional_Inline}}
      - : Một giá trị boolean mặc định là `false`. Đặt thành `true` chỉ định rằng cookie cần xóa sẽ là cookie được phân vùng. Xem [Cookies Having Independent Partitioned State (CHIPS)](/en-US/docs/Web/Privacy/Guides/Privacy_sandbox/Partitioned_cookies) để biết thêm thông tin.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với {{jsxref("undefined")}} khi thao tác xóa hoàn tất hoặc khi không có cookie nào khớp.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu origin không thể được {{glossary("Serialization", "tuần tự hóa")}} thành một URL.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu một cookie khớp với `name` hoặc `options` đã cho không thể bị xóa.

## Ví dụ

<!-- The examples don't work as live examples in MDN environment (due to unknown errors) -->

### Xóa một cookie theo tên

Ví dụ này cho thấy cách một cookie có thể bị xóa bằng cách truyền tên của nó vào phương thức `delete()`.

Điều này sẽ hoạt động nếu cookie cần xóa khớp với tên cookie và các giá trị mặc định của [`options`](#options) ở trên.
Đây sẽ là trường hợp nếu cookie được {{domxref("CookieStore/set","set()")}} chỉ bằng tên và giá trị, nhưng có thể không đúng nếu cookie được tạo bằng các tùy chọn hoặc bằng {{domxref("Document.cookie")}}.

Đoạn mã đầu tiên định nghĩa `setTestCookies()`, hàm này tạo một số cookie thử nghiệm và ghi tên của chúng ra log.

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

  // Log cookie names
  const cookieNames = (await cookieStore.getAll())
    .map((cookie) => cookie.name)
    .join(" ");
  console.log(`Initial cookies: ${cookieNames}`);
}
```

Phương thức `cookieTest()` gọi `setTestCookies()`.
Sau đó nó xóa "cookie1" mà chúng ta vừa tạo, rồi liệt kê lại toàn bộ tên cookie.

```js
async function cookieTest() {
  // Create our test cookies
  await setTestCookies();

  // Delete cookie1
  try {
    await cookieStore.delete("cookie1");
  } catch (error) {
    console.log(`Error deleting cookie1: ${error}`);
  }

  // Log cookie names again (to show cookie1 deleted)
  const cookieNames = (await cookieStore.getAll())
    .map((cookie) => cookie.name)
    .join(" ");
  console.log(
    `Cookies remaining after attempting to delete cookie1: ${cookieNames}`,
  );
}

cookieTest();
```

Khi chạy, log trong console ban đầu sẽ cho thấy cả cookie1 và cookie2 đều hiện diện, nhưng cookie1 sẽ không còn được liệt kê sau khi bị xóa.

### Xóa cookie bằng tùy chọn

Ví dụ này gần như giống hệt ví dụ trước, ngoại trừ việc nó minh họa rằng các tùy chọn phải khớp với cookie cần xóa.

Đoạn mã đầu tiên định nghĩa `setTestCookies()`.
Hàm này tạo hai cookie với thuộc tính `partitioned` được đặt thành `true`, rồi ghi tên của chúng ra log.

```js
async function setTestCookies() {
  // Set two cookies
  try {
    await cookieStore.set({
      name: "cookie1",
      value: `cookie1-value`,
      partitioned: true,
    });
  } catch (error) {
    console.log(`Error setting cookie1: ${error}`);
  }

  try {
    await cookieStore.set({
      name: "cookie2",
      value: `cookie2-value`,
      partitioned: true,
    });
  } catch (error) {
    console.log(`Error setting cookie2: ${error}`);
  }

  // Log cookie names
  const cookieNames = (await cookieStore.getAll())
    .map((cookie) => cookie.name)
    .join(" ");
  console.log(`Initial cookies: ${cookieNames}`);
}
```

Phương thức `cookieTest()` gọi `setTestCookies()`.
Sau đó nó thử xóa cookie có tên "cookie1" chỉ bằng cách chỉ định tên, và cookie "cookie2" bằng cách chỉ định tên kèm `partitioned: true`.
Cuối cùng phương thức liệt kê lại tên các cookie.

```js
async function cookieTest() {
  // Create our test cookies
  await setTestCookies();

  // Delete cookie1 specifying just the name
  try {
    await cookieStore.delete("cookie1");
  } catch (error) {
    console.log(`Error deleting cookie1: ${error}`);
  }

  // Delete cookie2, setting partitioned to true
  try {
    await cookieStore.delete({
      name: "cookie2",
      partitioned: true,
    });
  } catch (error) {
    console.log(`Error deleting cookie2: ${error}`);
  }

  // Log cookie names again (to show cookie1 deleted)
  cookieNames = (await cookieStore.getAll())
    .map((cookie) => cookie.name)
    .join(" ");
  console.log(
    `Cookies remaining after attempted deletions (cookie2 should be deleted): ${cookieNames}`,
  );
}

cookieTest();
```

Khi chạy, log console sẽ cho thấy ban đầu cả "cookie1" và "cookie2" đều có mặt, nhưng sau đó "cookie2" sẽ không còn được liệt kê.
Cookie tên "cookie1" vẫn còn vì nó không khớp với cookie được chỉ định trong lời gọi `delete()`.

> [!NOTE]
> Việc xóa sẽ thất bại một cách im lặng nếu không có cookie nào khớp.

### Xóa cookie được tạo bằng document.cookies

Việc xóa một cookie được tạo bằng {{domxref("document.cookie")}} có cùng yêu cầu như xóa một cookie được tạo bằng {{domxref("CookieStore.set()")}}: cookie phải khớp với `options` được truyền vào, hoặc khớp với `name` và các tùy chọn mặc định.

> [!NOTE]
> Các cookie được tạo bằng `set()` luôn có [đường dẫn mặc định](/en-US/docs/Web/HTTP/Guides/Cookies#define_where_cookies_are_sent) là `/`, trong khi các cookie được tạo bằng `document.cookie` có đường dẫn mặc định bằng với đường dẫn của tài liệu nơi chúng được tạo.
> Vì vậy khi xóa cookie được tạo bằng `document.cookie`, bạn không thể giả định rằng chúng có đường dẫn `/` (trừ khi nó đã được đặt rõ ràng như vậy), và do đó sẽ khớp với các tùy chọn mặc định của `delete()`.

Đoạn mã dưới đây dùng `document.cookie` để tạo các cookie có tên "doc_cookie1" và "doc_cookie2", với các đường dẫn tương ứng là `/some_path` và `/`, rồi ghi cả hai cookie ra log.
Sau đó đoạn mã xóa cả hai cookie mà không chỉ định tùy chọn khớp `path`, rồi liệt kê lại các cookie.

```js
async function cookieTest() {
  // Create doc_cookie1 with path /some_path
  document.cookie =
    "doc_cookie1=doc_cookie1_name; SameSite=None; Secure; max-age=10; path='/some_path'";

  // Create doc_cookie2 with path / (the CookieStore.set() default)
  document.cookie =
    "doc_cookie2=doc_cookie2_name; SameSite=None; Secure; max-age=10; path=/";

  // Log cookie names
  let cookieNames = (await cookieStore.getAll())
    .map((cookie) => cookie.name)
    .join(" ");
  console.log(`Initial cookies: ${cookieNames}`);

  // Delete doc_cookie1 (should fail)
  try {
    await cookieStore.delete("doc_cookie1");
  } catch (error) {
    console.log(`Error deleting doc_cookie1: ${error}`);
  }

  // Delete doc_cookie2 (should succeed)
  try {
    await cookieStore.delete("doc_cookie2");
  } catch (error) {
    console.log(`Error deleting cookie2: ${error}`);
  }

  // Log cookie names again (to show cookie1 deleted)
  cookieNames = (await cookieStore.getAll())
    .map((cookie) => cookie.name)
    .join(" ");
  console.log(
    `Cookies remaining after attempted deletions (doc_cookie2 should be deleted): ${cookieNames}`,
  );
}

cookieTest();
```

Khi chạy, log đầu tiên sẽ cho thấy cả hai cookie đều hiện diện.
Log thứ hai sẽ không bao gồm "doc_cookie2", vì nó phải khớp và đã bị xóa.
Nó sẽ bao gồm "doc_cookie1" vì `/some_path` không khớp với đường dẫn xóa mặc định (`/`).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
