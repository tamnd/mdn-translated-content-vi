---
title: "Response: thuộc tính redirected"
short-title: redirected
slug: Web/API/Response/redirected
page-type: web-api-instance-property
browser-compat: api.Response.redirected
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`redirected`** của giao diện {{domxref("Response")}} cho biết phản hồi có phải là kết quả của một yêu cầu mà bạn gửi và đã bị chuyển hướng hay không.

> [!NOTE]
> Không nên kiểm tra `redirected` để ngăn chuyển hướng, vì tới lúc nhận được phản hồi thì việc chuyển hướng đã xảy ra rồi, và bạn có thể đã gửi yêu cầu tới một đích không mong muốn, có thể làm lộ thông tin nhạy cảm.
> Thay vào đó, bạn nên lọc ngay khi gọi {{domxref("Window/fetch", "fetch()")}}.
> Xem ví dụ [Disallowing redirects](#disallowing_redirects), trong đó điều này được thực hiện.

## Giá trị

Một giá trị boolean là `true` nếu phản hồi cho biết yêu cầu của bạn đã bị chuyển hướng.

## Ví dụ

### Phát hiện chuyển hướng

Kiểm tra xem phản hồi có đến từ một yêu cầu đã bị chuyển hướng hay không chỉ đơn giản là kiểm tra cờ này trên đối tượng {{domxref("Response")}}.
Trong đoạn mã dưới đây, một thông báo văn bản được chèn vào một phần tử khi có chuyển hướng xảy ra trong quá trình fetch.
Tuy nhiên, cách này không an toàn bằng việc từ chối chuyển hướng ngay khi chúng không mong muốn, như mô tả trong [Disallowing redirects](#disallowing_redirects) bên dưới.

Thuộc tính {{domxref("Response.url", "url")}} trả về URL cuối cùng sau các chuyển hướng.

```js
fetch("awesome-picture.jpg")
  .then((response) => {
    const elem = document.getElementById("warning-message-box");
    elem.textContent = response.redirected ? "Unexpected redirect" : "";
    // URL cuối cùng thu được sau các chuyển hướng
    console.log(response.url);
    return response.blob();
  })
  .then((imageBlob) => {
    const imgObjectURL = URL.createObjectURL(imageBlob);
    document.getElementById("img-element-id").src = imgObjectURL;
  });
```

### Không cho phép chuyển hướng

Kiểm tra `redirected` là cách tệ để ngăn chuyển hướng, vì việc chuyển hướng đã xảy ra rồi. Thay vào đó, bạn nên đặt chế độ redirect thành `"error"` trong tham số `options` khi gọi {{domxref("Window/fetch", "fetch()")}}, như sau:

```js
fetch("awesome-picture.jpg", { redirect: "error" })
  .then((response) => response.blob())
  .then((imageBlob) => {
    const imgObjectURL = URL.createObjectURL(imageBlob);
    document.getElementById("img-element-id").src = imgObjectURL;
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
