---
title: "Response: phương thức tĩnh json()"
short-title: json()
slug: Web/API/Response/json_static
page-type: web-api-static-method
browser-compat: api.Response.json_static
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức tĩnh **`json()`** của giao diện {{domxref("Response")}} trả về một `Response` chứa dữ liệu JSON đã cho làm body, và một header {{HTTPHeader("Content-Type")}} được đặt thành `application/json`.
Mã trạng thái phản hồi, thông báo trạng thái và các header bổ sung cũng có thể được đặt.

Phương thức này giúp dễ dàng tạo đối tượng `Response` để trả về dữ liệu JSON đã mã hóa.
[Service worker](/en-US/docs/Web/API/Service_Worker_API), chẳng hạn, có thể chặn các yêu cầu fetch từ trình duyệt và dùng `json()` để dựng một `Response` từ dữ liệu JSON đã lưu cache để trả về main thread.
Phương thức `json()` cũng có thể được dùng trong mã máy chủ để trả về dữ liệu JSON cho [single-page application](/en-US/docs/Glossary/SPA) và các ứng dụng khác mong đợi phản hồi JSON.

## Cú pháp

```js-nolint
Response.json(data)
Response.json(data, options)
```

### Tham số

- `data`
  - : Dữ liệu JSON được dùng làm body phản hồi.
- `options` {{optional_inline}}
  - : Một object tùy chọn chứa các thiết lập cho phản hồi, bao gồm mã trạng thái, status text và headers.
    Điều này giống với tham số `options` của constructor {{domxref("Response.Response", "Response()")}}.
    - `status`
      - : Mã trạng thái cho phản hồi, chẳng hạn `200`.
    - `statusText`
      - : Thông báo trạng thái gắn với mã trạng thái.
        Với trạng thái `200`, giá trị này có thể là `OK`.
    - `headers`
      - : Bất kỳ header nào bạn muốn thêm vào phản hồi, chứa trong object {{domxref("Headers")}} hoặc object literal của các cặp khóa/giá trị {{jsxref("String")}} (xem [HTTP headers](/en-US/docs/Web/HTTP/Reference/Headers) để tham khảo).

### Giá trị trả về

Một đối tượng {{domxref("Response")}}.

### Ngoại lệ

- `TypeError`
  - : Ném ra nếu `data` không thể được chuyển thành chuỗi JSON.
    Điều này có thể xảy ra nếu dữ liệu là một đối tượng JavaScript có method, có tham chiếu vòng, hoặc object được truyền vào là `undefined`.

## Ví dụ

### Phản hồi với dữ liệu JSON

Ví dụ trực tiếp này cho thấy cách tạo một đối tượng phản hồi JSON và ghi log đối tượng vừa tạo để kiểm tra (mã ghi log bị ẩn vì không liên quan).

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.getElementById("log");
function log(text) {
  logElement.innerText += `${text}\n`;
}

async function logResponse(response) {
  const responseText = await response.text();
  log(`body: ${responseText}`);
  response.headers.forEach((header) => log(`header: ${header}`));
  log(`status: ${response.status}`);
  log(`statusText: ${response.statusText}`);
  log(`type: ${response.type}`);
  log(`url: ${response.url}`);
  log(`ok: ${response.ok}`);
  log(`redirected: ${response.redirected}`);
  log(`bodyUsed: ${response.bodyUsed}`);
}
```

Đoạn mã dưới đây tạo một đối tượng `Response` với body JSON `{ my: "data" }` và header được đặt thành `application/json`.

```js
const jsonResponse = Response.json({ my: "data" });
logResponse(jsonResponse);
```

Đối tượng có các thuộc tính sau.
Lưu ý body và header được đặt đúng như mong đợi, và status mặc định là `200`.

{{EmbedLiveSample('Response with JSON data','100%', '170')}}

### Phản hồi với dữ liệu JSON và tùy chọn

Ví dụ này cho thấy cách tạo một đối tượng phản hồi JSON với các tùy chọn `status` và `statusText`.

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.getElementById("log");
function log(text) {
  logElement.innerText += `${text}\n`;
}

async function logResponse(response) {
  const responseText = await response.text();
  log(`body: ${responseText}`);
  response.headers.forEach((header) => log(`header: ${header}`));
  log(`status: ${response.status}`);
  log(`statusText: ${response.statusText}`);
  log(`type: ${response.type}`);
  log(`url: ${response.url}`);
  log(`ok: ${response.ok}`);
  log(`redirected: ${response.redirected}`);
  log(`bodyUsed: ${response.bodyUsed}`);
}
```

Đoạn mã dưới đây tạo một đối tượng `Response` với body JSON `{ some: "data", more: "information" }` và header được đặt thành `application/json`.
Nó cũng đặt status thành `307` và đặt status text thích hợp ("Temporary Redirect").

```js
const jsonResponse = Response.json(
  { some: "data", more: "information" },
  { status: 307, statusText: "Temporary Redirect" },
);
logResponse(jsonResponse);
```

Đối tượng có các thuộc tính sau, được đặt đúng như mong đợi.
Lưu ý rằng thuộc tính `ok` của phản hồi đổi thành `false` vì giá trị status không nằm trong khoảng 200 đến 299.

{{EmbedLiveSample('Response with JSON data and options','100%', '170')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Service Worker API](/en-US/docs/Web/API/Service_Worker_API)
