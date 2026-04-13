---
title: "Response: thuộc tính bodyUsed"
short-title: bodyUsed
slug: Web/API/Response/bodyUsed
page-type: web-api-instance-property
browser-compat: api.Response.bodyUsed
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`bodyUsed`** của giao diện {{domxref("Response")}} là một giá trị boolean cho biết phần thân phản hồi đã được đọc hay chưa.

## Giá trị

Một giá trị boolean.

## Ví dụ

### Kiểm tra `bodyUsed`

Ví dụ này minh họa việc đọc body của một phản hồi sẽ đổi giá trị `bodyUsed` từ `false` sang `true`.

Ví dụ có một hình ảnh trống.

Khi JavaScript của ví dụ chạy, chúng ta fetch một hình ảnh và gán promise trả về cho biến `responsePromise`.

Khi người dùng nhấn "Use response", chúng ta kiểm tra xem phản hồi đã được dùng chưa. Nếu rồi, chúng ta in thông báo. Nếu chưa, chúng ta đọc body phản hồi và dùng nó làm giá trị cho thuộc tính `src` của hình ảnh.

#### HTML

```html
<p><button id="use">Use response</button> <button id="reset">Reset</button></p>
<p><img id="my-image" src="" width="150" /></p>
<pre id="log"></pre>
```

#### JavaScript

```js
const useResponse = document.querySelector("#use");
const reset = document.querySelector("#reset");
const myImage = document.querySelector("#my-image");
const log = document.querySelector("#log");

const responsePromise = fetch(
  "/shared-assets/images/examples/firefox-logo.svg",
);

useResponse.addEventListener("click", async () => {
  const response = await responsePromise;
  if (response.bodyUsed) {
    log.textContent = "Body has already been used!";
  } else {
    const result = await response.blob();
    const objectURL = URL.createObjectURL(result);
    myImage.src = objectURL;
  }
});

reset.addEventListener("click", () => {
  document.location.reload();
});
```

#### Kết quả

Ban đầu hình ảnh không có giá trị. Nếu bạn nhấn "Use response" một lần, `bodyUsed` sẽ là `false`, nên chúng ta đọc phản hồi và đặt hình ảnh. Nếu bạn nhấn "Use response" lần nữa, `bodyUsed` sẽ là `true`, và chúng ta in thông báo.

Nhấn "Reset" để tải lại ví dụ và thử lại.

{{ EmbedLiveSample('Examples', '100%', '300px') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
