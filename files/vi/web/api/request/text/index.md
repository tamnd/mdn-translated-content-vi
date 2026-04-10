---
title: "Request: phương thức text()"
short-title: text()
slug: Web/API/Request/text
page-type: web-api-instance-method
browser-compat: api.Request.text
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`text()`** của giao diện {{domxref("Request")}} đọc body của request và trả về nó dưới dạng một promise giải quyết với một {{jsxref("String")}}. Phản hồi _luôn_ được giải mã bằng UTF-8.

## Cú pháp

```js-nolint
text()
```

### Tham số

Không có.

### Giá trị trả về

Một Promise giải quyết với một {{jsxref("String")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra vì một trong các lý do sau:
    - Body của request là [disturbed hoặc locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - Có lỗi khi giải mã nội dung body, ví dụ do header {{httpheader("Content-Encoding")}} không đúng.

## Ví dụ

```js
const text = "Hello world";

const request = new Request("/myEndpoint", {
  method: "POST",
  body: text,
});

request.text().then((text) => {
  // làm gì đó với văn bản được gửi trong request
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Response.text()")}}
