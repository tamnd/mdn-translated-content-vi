---
title: "XMLHttpRequest: thuộc tính responseURL"
short-title: responseURL
slug: Web/API/XMLHttpRequest/responseURL
page-type: web-api-instance-property
browser-compat: api.XMLHttpRequest.responseURL
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Thuộc tính chỉ đọc **`XMLHttpRequest.responseURL`** trả về URL đã được tuần tự hóa của phản hồi hoặc chuỗi rỗng nếu URL là `null`. Nếu URL được trả về, bất kỳ đoạn fragment URL nào có trong URL sẽ bị loại bỏ. Giá trị của `responseURL` sẽ là URL cuối cùng thu được sau bất kỳ chuyển hướng nào.

## Ví dụ

```js
const xhr = new XMLHttpRequest();
xhr.open("GET", "http://example.com/test", true);
xhr.onload = () => {
  console.log(xhr.responseURL); // http://example.com/test
};
xhr.send(null);
```

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
