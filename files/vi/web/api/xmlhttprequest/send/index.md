---
title: "XMLHttpRequest: phương thức send()"
short-title: send()
slug: Web/API/XMLHttpRequest/send
page-type: web-api-instance-method
browser-compat: api.XMLHttpRequest.send
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Phương thức {{domxref("XMLHttpRequest")}} **`send()`** gửi yêu cầu đến máy chủ.

Nếu yêu cầu là không đồng bộ (mặc định), phương thức này trả về ngay khi yêu cầu được gửi và kết quả được phân phối bằng cách sử dụng các sự kiện. Nếu yêu cầu là đồng bộ, phương thức này sẽ không trả về cho đến khi phản hồi đến nơi.

`send()` chấp nhận một tham số tùy chọn cho phép bạn chỉ định phần thân của yêu cầu; điều này chủ yếu được sử dụng cho các yêu cầu như {{HTTPMethod("PUT")}}. Nếu phương thức yêu cầu là {{HTTPMethod("GET")}} hoặc {{HTTPMethod("HEAD")}}, tham số `body` bị bỏ qua và phần thân yêu cầu được đặt thành `null`.

Nếu không có tiêu đề {{HTTPHeader("Accept")}} nào được thiết lập bằng cách sử dụng {{domxref("XMLHttpRequest.setRequestHeader", "setRequestHeader()")}}, một tiêu đề `Accept` với loại `"*/*"` (bất kỳ loại nào) sẽ được gửi.

## Cú pháp

```js-nolint
send()
send(body)
```

### Tham số

- `body` {{optional_inline}}
  - : Một khối dữ liệu để gửi trong yêu cầu XHR. Đây có thể là:
    - Một {{domxref("Document")}}, trong trường hợp đó nó được tuần tự hóa trước khi gửi.
    - Một `XMLHttpRequestBodyInit`, [theo đặc tả Fetch](https://fetch.spec.whatwg.org/#typedefdef-xmlhttprequestbodyinit) có thể là một {{domxref("Blob")}}, một {{jsxref("ArrayBuffer")}}, một {{jsxref("TypedArray")}}, một {{jsxref("DataView")}}, một {{domxref("FormData")}}, một {{domxref("URLSearchParams")}}, hoặc một chuỗi.
    - `null`

    Nếu không có giá trị nào được chỉ định cho body, giá trị mặc định `null` được sử dụng.

Cách tốt nhất để gửi nội dung nhị phân (ví dụ: trong tải tệp lên) là sử dụng một đối tượng {{jsxref("TypedArray")}}, {{jsxref("DataView")}} hoặc {{domxref("Blob")}} kết hợp với phương thức `send()`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu `send()` đã được gọi cho yêu cầu, và/hoặc yêu cầu đã hoàn tất.
- `NetworkError` {{domxref("DOMException")}}
  - : Được ném nếu loại tài nguyên cần tải là một Blob, và phương thức không phải là `GET`.

## Ví dụ: GET

```js
const xhr = new XMLHttpRequest();
xhr.open("GET", "/server", true);

xhr.onload = () => {
  // Yêu cầu đã hoàn tất. Xử lý tại đây.
};

xhr.send(null);
// xhr.send('string');
// xhr.send(new Blob());
// xhr.send(new Int8Array());
// xhr.send(document);
```

## Ví dụ: POST

```js
const xhr = new XMLHttpRequest();
xhr.open("POST", "/server", true);

// Gửi thông tin tiêu đề phù hợp cùng với yêu cầu
xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

xhr.onreadystatechange = () => {
  // Gọi một hàm khi trạng thái thay đổi.
  if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
    // Yêu cầu đã hoàn tất. Xử lý tại đây.
  }
};
xhr.send("foo=bar&lorem=ipsum");
// xhr.send(new Int8Array());
// xhr.send(document);
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
- [HTML trong XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/HTML_in_XMLHttpRequest)
