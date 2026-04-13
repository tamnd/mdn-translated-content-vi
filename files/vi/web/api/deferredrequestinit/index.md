---
title: DeferredRequestInit
slug: Web/API/DeferredRequestInit
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Window.fetchLater
---

{{DefaultAPISidebar("Fetch API")}}{{SeeCompatTable}}

Dictionary **`DeferredRequestInit`** của [Fetch API](/en-US/docs/Web/API/Fetch_API) đại diện cho tập hợp các tùy chọn có thể được sử dụng để cấu hình yêu cầu fetch bị trì hoãn.

Đối tượng `DeferredRequestInit` được truyền trực tiếp vào lời gọi hàm {{domxref("window.fetchLater()")}} như là đối số thứ hai.

## Thuộc tính phiên bản

Dictionary này mở rộng dictionary {{domxref("RequestInit")}} với việc thêm các thuộc tính sau:

- `activateAfter` {{optional_inline}}
  - : {{ domxref("DOMHighResTimeStamp") }} cho biết khoảng thời gian chờ tính bằng mili giây sau đó yêu cầu fetch nên được gửi. Fetch có thể được gửi sớm hơn khi điều hướng đi. _Thời gian_ gửi thực tế không được biết, vì trình duyệt có thể đợi lâu hơn hoặc ngắn hơn, ví dụ để tối ưu hóa việc gộp các deferred fetch. Nếu thuộc tính `activateAfter` không được cung cấp, deferred fetch sẽ chờ đến cuối lần truy cập trang (bao gồm cả việc vào [bfcache](/en-US/docs/Glossary/bfcache)).

### Ngoại lệ

- `RangeError` {{domxref("DOMException")}}
  - : Phát sinh khi giá trị `activateAfter` âm được cung cấp.

## Ví dụ

### Trì hoãn yêu cầu `GET` cho đến khi trang bị hủy hoặc vào bfcache

Trong ví dụ này, không có đối tượng `DeferredRequestInit` nào được cung cấp và không sử dụng khoảng thời gian chờ:

```js
fetchLater("/send_beacon");
```

### Trì hoãn yêu cầu `POST` trong khoảng 1 phút

Trong ví dụ này, chúng ta tạo {{domxref("Request")}} và cung cấp giá trị `activateAfter` để trì hoãn gửi yêu cầu trong 60,000 mili giây (hoặc một phút):

```js
fetchLater("/send_beacon", {
  method: "POST",
  body: getBeaconData(),
  activateAfter: 60000, // 1 minute
});
```

> [!NOTE]
> Thời gian gửi thực tế không được biết, vì trình duyệt có thể đợi lâu hơn hoặc ngắn hơn, ví dụ để tối ưu hóa việc gộp các deferred fetch.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
