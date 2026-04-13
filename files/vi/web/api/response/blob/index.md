---
title: "Response: phương thức blob()"
short-title: blob()
slug: Web/API/Response/blob
page-type: web-api-instance-method
browser-compat: api.Response.blob
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`blob()`** của giao diện {{domxref("Response")}} nhận một luồng {{domxref("Response")}} và đọc nó đến hết. Phương thức này trả về một promise giải quyết với một {{domxref("Blob")}}.

## Cú pháp

```js-nolint
blob()
```

### Tham số

Không có.

> [!NOTE]
> Nếu {{domxref("Response")}} có {{domxref("Response.type")}} là `"opaque"`, {{domxref("Blob")}} kết quả sẽ có {{domxref("Blob.size")}} bằng `0` và {{domxref("Blob.type")}} là chuỗi rỗng `""`, khiến nó trở nên _vô dụng_ cho các phương thức như {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}.

### Giá trị trả về

Một promise giải quyết với một {{domxref("Blob")}} có dữ liệu là các byte của body và kiểu media là giá trị của header `Content-Type` của phản hồi.

### Ngoại lệ

- `AbortError` {{domxref("DOMException")}}
  - : Yêu cầu đã bị [hủy](/en-US/docs/Web/API/Fetch_API/Using_Fetch#canceling_a_request).
- {{jsxref("TypeError")}}
  - : Ném ra vì một trong các lý do sau:
    - Body phản hồi bị [disturbed hoặc locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - Có lỗi giải mã nội dung body, ví dụ do header {{httpheader("Content-Encoding")}} không đúng.

## Ví dụ

Trong ví dụ [fetch request](https://github.com/mdn/dom-examples/tree/main/fetch/fetch-request) của chúng tôi ([chạy trực tiếp](https://mdn.github.io/dom-examples/fetch/fetch-request/)), chúng ta tạo một yêu cầu mới bằng constructor {{domxref("Request.Request","Request()")}}, rồi dùng nó để fetch một ảnh JPG. Khi fetch thành công, chúng ta đọc một {{domxref("Blob")}} từ phản hồi bằng `blob()`, đặt nó vào một object URL bằng {{domxref("URL.createObjectURL_static", "URL.createObjectURL()")}}, rồi đặt URL đó làm nguồn của phần tử {{htmlelement("img")}} để hiển thị ảnh.

```js
const myImage = document.querySelector("img");

const myRequest = new Request("flowers.jpg");

fetch(myRequest)
  .then((response) => response.blob())
  .then((myBlob) => {
    const objectURL = URL.createObjectURL(myBlob);
    myImage.src = objectURL;
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
