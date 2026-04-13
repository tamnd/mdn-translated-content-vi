---
title: "PushMessageData: phương thức json()"
short-title: json()
slug: Web/API/PushMessageData/json
page-type: web-api-instance-method
browser-compat: api.PushMessageData.json
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers("service")}}

Phương thức **`json()`** của giao diện {{domxref("PushMessageData")}} trích xuất dữ liệu push message bằng cách phân tích nó như một chuỗi [JSON](/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON) và trả về kết quả.

## Cú pháp

```js-nolint
json()
```

### Tham số

Không có.

### Giá trị trả về

Kết quả của việc phân tích dữ liệu sự kiện push dưới dạng JSON. Giá trị này có thể là bất cứ thứ gì có thể biểu diễn bằng JSON - object, mảng, chuỗi, số...

## Ví dụ

```js
self.addEventListener("push", (event) => {
  const myData = event.data.json();

  // làm gì đó với dữ liệu của bạn
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
