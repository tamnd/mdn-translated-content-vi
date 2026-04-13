---
title: "FetchEvent: hàm khởi tạo FetchEvent()"
short-title: FetchEvent()
slug: Web/API/FetchEvent/FetchEvent
page-type: web-api-constructor
browser-compat: api.FetchEvent.FetchEvent
---

{{APIRef("Service Workers API")}}{{AvailableInWorkers("service")}}

Hàm khởi tạo **`FetchEvent()`** tạo một đối tượng {{domxref("FetchEvent")}} mới.

## Cú pháp

```js-nolint
new FetchEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt nó thành `fetch`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("ExtendableEvent/ExtendableEvent", "ExtendableEvent()")}}_, có thể có các thuộc tính sau:
    - `request`
      - : Đối tượng {{domxref("Request")}} sẽ kích hoạt trình xử lý sự kiện.
    - `preloadResponse`
      - : Một {{jsxref("Promise")}} trả về phản hồi đã được tải trước cho client.
    - `clientId` {{optional_inline}}
      - : {{domxref("Client")}} mà service worker hiện tại đang kiểm soát. Mặc định là `""`.
    - `isReload` {{deprecated_inline}} {{optional_inline}}
      - : Một giá trị boolean cho biết liệu trang có được tải lại hay không khi sự kiện được gửi. `true` nếu có, và `false` nếu không.
        Thông thường, nhấn nút làm mới trong trình duyệt là tải lại, trong khi nhấp vào liên kết và nhấn nút quay lại thì không. Nếu không có, mặc định là `false`.
    - `replacesClientId` {{optional_inline}}
      - : Một chuỗi xác định client đang được thay thế bởi `resultingClientId`. Mặc định là `""`.
    - `resultingClientId` {{optional_inline}}
      - : Một chuỗi chứa `clientId` mới nếu client thay đổi do tải trang. Mặc định là `""`
    - `handled`
      - : Một promise _đang chờ_ sẽ được thực hiện khi sự kiện đã được xử lý.

### Giá trị trả về

Một đối tượng {{domxref("FetchEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Promise")}}
- [Fetch API](/en-US/docs/Web/API/Fetch_API)
