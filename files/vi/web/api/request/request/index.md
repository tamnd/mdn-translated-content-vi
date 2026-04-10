---
title: "Request: hàm khởi tạo Request()"
short-title: Request()
slug: Web/API/Request/Request
page-type: web-api-constructor
browser-compat: api.Request.Request
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`Request()`** tạo một đối tượng {{domxref("Request")}} mới.

## Cú pháp

```js-nolint
new Request(input)
new Request(input, options)
```

### Tham số

- `input`
  - : Xác định tài nguyên bạn muốn fetch. Giá trị này có thể là:
    - Một chuỗi chứa URL của tài nguyên muốn fetch. URL có thể là tương đối với base URL, tức {{domxref("Node.baseURI", "baseURI")}} của tài liệu trong ngữ cảnh cửa sổ, hoặc {{domxref("WorkerGlobalScope.location")}} trong ngữ cảnh worker.
    - Một đối tượng {{domxref("Request")}}, về thực chất là tạo một bản sao. Lưu ý các cập nhật hành vi sau để giữ an toàn và giảm khả năng ném ngoại lệ:
      - Nếu đối tượng này thuộc origin khác với lời gọi constructor, {{domxref("Request.referrer")}} sẽ bị loại bỏ.
      - Nếu đối tượng này có {{domxref("Request.mode")}} là `navigate`, giá trị `mode` sẽ được chuyển thành `same-origin`.

- `options` {{optional_inline}}
  - : Một đối tượng {{domxref("RequestInit")}} chứa các thiết lập tùy chỉnh bạn muốn áp dụng cho request.

    Nếu bạn tạo một `Request` mới từ một `Request` có sẵn, mọi tùy chọn bạn đặt trong đối số _options_ của request mới sẽ thay thế các tùy chọn tương ứng trong `Request` gốc. Ví dụ:

    ```js
    const oldRequest = new Request(
      "https://github.com/mdn/content/issues/12959",
      { headers: { From: "webmaster@example.org" } },
    );
    oldRequest.headers.get("From"); // "webmaster@example.org"
    const newRequest = new Request(oldRequest, {
      headers: { From: "developer@example.org" },
    });
    newRequest.headers.get("From"); // "developer@example.org"
    ```

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu:
    - Việc dùng [Topics API](/en-US/docs/Web/API/Topics_API) bị cấm rõ ràng bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{httpheader('Permissions-Policy/browsing-topics','browsing-topics')}}, và `browsingTopics` được đặt là `true`.
    - Việc dùng các thao tác [Private State Token API](/en-US/docs/Web/API/Private_State_Token_API) bị cấm rõ ràng bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) {{httpheader('Permissions-Policy/private-state-token-issuance','private-state-token-issuance')}} hoặc {{httpheader('Permissions-Policy/private-state-token-redemption','private-state-token-redemption')}}, và tùy chọn `privateToken` được chỉ định, bao gồm một kiểu `privateToken.operation` không được phép.
- `TypeError`
  - : Được ném ra nếu:
    - URL có thông tin xác thực, như `http://user:password@example.com`, hoặc không thể phân tích cú pháp.
    - Tùy chọn init `privateToken` được chỉ định, bao gồm kiểu `privateToken.operation` là `send-redemption-record`, và mảng `privateToken.issues` rỗng hoặc không được đặt, hoặc một hay nhiều `issuers` được chỉ định không đáng tin cậy, là các URL HTTPS.

## Ví dụ

Trong [ví dụ Fetch Request](/en-US/docs/Web/API/Request#examples) của chúng tôi, chúng ta tạo một đối tượng `Request` mới bằng constructor rồi fetch nó bằng lời gọi {{domxref("Window/fetch", "fetch()")}}.
Vì chúng ta đang fetch một ảnh, chúng ta chạy {{domxref("Response.blob")}} trên response để gán đúng kiểu MIME, sau đó tạo một Object URL và hiển thị nó trong phần tử {{htmlelement("img")}}.

```js
const myImage = document.querySelector("img");
const myRequest = new Request("flowers.jpg");

fetch(myRequest)
  .then((response) => response.blob())
  .then((response) => {
    const objectURL = URL.createObjectURL(response);
    myImage.src = objectURL;
  });
```

Trong [ví dụ Fetch Request với init](/en-US/docs/Web/API/Request#examples) của chúng tôi, chúng ta làm tương tự nhưng truyền vào một object _options_ khi gọi `fetch()`.
Trong trường hợp này, chúng ta có thể đặt giá trị {{httpheader("Cache-Control")}} để chỉ ra loại phản hồi cache nào là chấp nhận được:

```js
const myImage = document.querySelector("img");
const reqHeaders = new Headers();

// Phản hồi đã cache là chấp nhận được nếu nó chưa quá một tuần.
reqHeaders.set("Cache-Control", "max-age=604800");

const options = {
  headers: reqHeaders,
};

// truyền init như một object "options" cùng với headers của chúng ta
const req = new Request("flowers.jpg", options);

fetch(req).then((response) => {
  // …
});
```

Lưu ý rằng bạn cũng có thể truyền `options` vào lời gọi `fetch` để có hiệu ứng tương tự, ví dụ:

```js
fetch(req, options).then((response) => {
  // …
});
```

Bạn cũng có thể dùng một object literal làm `headers` trong `options`.

```js
const options = {
  headers: {
    "Cache-Control": "max-age=60480",
  },
};

const req = new Request("flowers.jpg", options);
```

Bạn cũng có thể truyền một đối tượng {{domxref("Request")}} vào constructor `Request()` để tạo một bản sao của Request (điều này tương tự với việc gọi phương thức {{domxref("Request.clone","clone()")}}.)

```js
const copy = new Request(req);
```

> [!NOTE]
> Cách dùng cuối cùng này có lẽ chỉ hữu ích trong [ServiceWorkers](/en-US/docs/Web/API/Service_Worker_API).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
