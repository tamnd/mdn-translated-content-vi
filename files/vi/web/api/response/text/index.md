---
title: "Response: phương thức text()"
short-title: text()
slug: Web/API/Response/text
page-type: web-api-instance-method
browser-compat: api.Response.text
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`text()`** của giao diện {{domxref("Response")}} nhận một luồng {{domxref("Response")}} và đọc nó đến hết.
Phương thức này trả về một promise giải quyết với một {{jsxref("String")}}.
Phản hồi _luôn_ được giải mã bằng UTF-8.

## Cú pháp

```js-nolint
text()
```

### Tham số

Không có.

### Giá trị trả về

Một Promise giải quyết với một {{jsxref("String")}}.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Yêu cầu đã bị [hủy](/en-US/docs/Web/API/Fetch_API/Using_Fetch#canceling_a_request).
- {{jsxref("TypeError")}}
  - : Ném ra vì một trong các lý do sau:
    - Body phản hồi bị [disturbed hoặc locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - Có lỗi giải mã nội dung body, ví dụ do header {{httpheader("Content-Encoding")}} không đúng.

## Ví dụ

Trong ví dụ [fetch text](https://github.com/mdn/dom-examples/tree/main/fetch/fetch-text) của chúng tôi ([chạy trực tiếp](https://mdn.github.io/dom-examples/fetch/fetch-text/)), chúng ta có một phần tử {{htmlelement("article")}} và ba liên kết (được lưu trong mảng `myLinks`.)
Trước hết, chúng ta lặp qua tất cả và gán cho mỗi liên kết một trình xử lý sự kiện `onclick` để hàm `getData()` được chạy - với định danh `data-page` của liên kết được truyền vào làm đối số - khi một liên kết được nhấn.

Khi `getData()` chạy, chúng ta tạo một yêu cầu mới bằng constructor {{domxref("Request.Request","Request()")}}, rồi dùng nó để fetch một file `.txt` cụ thể.
Khi fetch thành công, chúng ta đọc một chuỗi từ phản hồi bằng `text()`, rồi đặt {{domxref("HTMLElement.innerText","innerText")}} của phần tử {{htmlelement("article")}} bằng chính text đó.

```js
const myArticle = document.querySelector("article");
const myLinks = document.querySelectorAll("ul a");

for (const link of myLinks) {
  link.onclick = (e) => {
    e.preventDefault();
    const linkData = e.target.getAttribute("data-page");
    getData(linkData);
  };
}

function getData(pageId) {
  console.log(pageId);
  const myRequest = new Request(`${pageId}.txt`);
  fetch(myRequest)
    .then((response) => {
      if (!response.ok) {
        throw new Error(`HTTP error, status = ${response.status}`);
      }
      return response.text();
    })
    .then((text) => {
      myArticle.innerText = text;
    })
    .catch((error) => {
      myArticle.innerText = `Error: ${error.message}`;
    });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
