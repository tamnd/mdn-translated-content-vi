---
title: CookieStore
slug: Web/API/CookieStore
page-type: web-api-interface
browser-compat: api.CookieStore
---

{{securecontext_header}}{{APIRef("Cookie Store API")}}{{AvailableInWorkers("window_and_service")}}

Giao diện **`CookieStore`** của {{domxref("Cookie Store API", "", "", "nocode")}} cung cấp các phương thức để lấy và đặt cookie một cách bất đồng bộ từ trang hoặc service worker.

`CookieStore` được truy cập thông qua các thuộc tính trong phạm vi toàn cục ở ngữ cảnh {{domxref("Window")}} hoặc {{domxref("ServiceWorkerGlobalScope")}}. Vì vậy không có hàm khởi tạo nào.

{{InheritanceDiagram}}

## Phương thức thể hiện

- {{domxref("CookieStore.delete()")}}
  - : Phương thức `delete()` xóa một cookie khớp với `name` hoặc đối tượng `options` đã cho.
    Nó trả về một {{jsxref("Promise")}} được giải quyết khi việc xóa hoàn tất hoặc khi không có cookie nào khớp.
- {{domxref("CookieStore.get()")}}
  - : Phương thức `get()` lấy một cookie duy nhất khớp với `name` hoặc đối tượng `options` đã cho.
    Nó trả về một {{jsxref("Promise")}} được giải quyết với thông tin của một cookie duy nhất.
- {{domxref("CookieStore.getAll()")}}
  - : Phương thức `getAll()` lấy tất cả cookie phù hợp.
    Nó trả về một {{jsxref("Promise")}} được giải quyết với một danh sách cookie.
- {{domxref("CookieStore.set()")}}
  - : Phương thức `set()` đặt một cookie với `name` và `value` hoặc đối tượng `options` đã cho.
    Nó trả về một {{jsxref("Promise")}} được giải quyết khi cookie được đặt xong.

## Sự kiện

- {{domxref("CookieStore.change_event", "change")}}
  - : Sự kiện `change` được kích hoạt khi có thay đổi đối với bất kỳ cookie nào.

## Ví dụ

Các ví dụ dưới đây có thể được kiểm tra bằng cách sao chép mã vào một test harness rồi chạy với [máy chủ cục bộ](/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server), hoặc triển khai lên một website như GitHub Pages.

<!-- The examples don't work as live examples in MDN environment (due to unknown errors) -->

### Đặt cookie

Ví dụ này cho thấy cách đặt cookie bằng cách truyền `name` và `value`, cũng như bằng cách đặt giá trị `options`.

Phương thức `cookieTest()` đặt một cookie với các thuộc tính `name` và `value`, và một cookie khác với các thuộc tính `name`, `value`, và `expires`.
Sau đó chúng ta dùng phương thức {{domxref("CookieStore.get()")}} để lấy từng cookie, rồi ghi chúng ra log.

```js
async function cookieTest() {
  // Set cookie: passing name and value
  try {
    await cookieStore.set("cookie1", "cookie1-value");
  } catch (error) {
    console.log(`Error setting cookie1: ${error}`);
  }

  // Set cookie: passing options
  const day = 24 * 60 * 60 * 1000;

  try {
    await cookieStore.set({
      name: "cookie2",
      value: "cookie2-value",
      expires: Date.now() + day,
      partitioned: true,
    });
  } catch (error) {
    log(`Error setting cookie2: ${error}`);
  }

  // Get named cookies and log their properties
  const cookie1 = await cookieStore.get("cookie1");
  console.log(cookie1);

  const cookie2 = await cookieStore.get("cookie2");
  console.log(cookie2);
}

cookieTest();
```

> [!NOTE]
> Trong [các trình duyệt hỗ trợ](/en-US/docs/Web/API/CookieStore/set#browser_compatibility), bạn có thể đặt thời hạn hết hạn của cookie bằng `maxAge` thay cho `expires`.

### Lấy cookie

Ví dụ này cho thấy cách bạn có thể lấy một cookie cụ thể bằng {{domxref("CookieStore.get()")}} hoặc lấy tất cả cookie bằng {{domxref("CookieStore.getAll()")}}.

Mã ví dụ trước tiên đặt ba cookie để dùng minh họa cho các phương thức lấy.
Đầu tiên, nó tạo `cookie1` và `cookie2` bằng phương thức {{domxref("CookieStore.set()")}}.
Sau đó, nó tạo cookie thứ ba bằng thuộc tính đồng bộ cũ hơn {{domxref("Document.cookie")}} để cho thấy rằng các cookie này cũng được lấy bởi các phương thức `get()` và `getAll()`.

Sau đó, đoạn mã dùng {{domxref("CookieStore.get()")}} để lấy "cookie1" và ghi các thuộc tính của nó ra log, và dùng {{domxref("CookieStore.getAll()")}} (không có đối số) để lấy toàn bộ cookie trong ngữ cảnh hiện tại.

```js
async function cookieTest() {
  // Set a cookie passing name and value
  try {
    await cookieStore.set("cookie1", "cookie1-value");
  } catch (error) {
    console.log(`Error setting cookie1: ${error}`);
  }

  // Set a cookie passing an options object
  const day = 24 * 60 * 60 * 1000;
  try {
    await cookieStore.set({
      name: "cookie2",
      value: `cookie2-value`,
      expires: Date.now() + day,
      partitioned: true,
    });
  } catch (error) {
    console.log(`Error setting cookie2: ${error}`);
  }

  // Set cookie using document.cookie
  // (to demonstrate these are are fetched too)
  document.cookie = "favorite_food=tripe; SameSite=None; Secure";

  // Get named cookie and log properties
  const cookie1 = await cookieStore.get("cookie1");
  console.log(cookie1);

  // Get all cookies and log each
  const cookies = await cookieStore.getAll();
  if (cookies.length > 0) {
    console.log(`getAll(): ${cookies.length}:`);
    cookies.forEach((cookie) => console.log(cookie));
  } else {
    console.log("Cookies not found");
  }
}

cookieTest();
```

Ví dụ này sẽ ghi riêng "cookie1" và cả ba cookie.
Một điều cần lưu ý là cookie được tạo bằng {{domxref("Document.cookie")}} có thể có đường dẫn khác với các cookie được tạo bằng {{domxref("CookieStore.set()","set()")}} (mặc định là `/`).

### Xóa một cookie theo tên

Ví dụ này cho thấy cách xóa một cookie theo tên bằng phương thức {{domxref("CookieStore.delete()","delete()")}}.

Đoạn mã đầu tiên đặt hai cookie và ghi chúng ra console.
Sau đó chúng ta xóa một trong các cookie, rồi liệt kê lại toàn bộ cookie.
Cookie đã bị xóa ("cookie1") có trong mảng log đầu tiên, nhưng không còn trong mảng thứ hai.

```js
async function cookieTest() {
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
  let cookieNames = (await cookieStore.getAll())
    .map((cookie) => cookie.name)
    .join(" ");
  console.log(`Initial cookies: ${cookieNames}`);

  // Delete cookie1
  await cookieStore.delete("cookie1");

  // Log cookies again (to show cookie1 deleted)
  cookieNames = (await cookieStore.getAll())
    .map((cookie) => cookie.name)
    .join(" ");
  console.log(
    `Cookies remaining after attempted deletions (cookie1 should be deleted): ${cookieNames}`,
  );
}

cookieTest();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
