---
title: "Request: phương thức blob()"
short-title: blob()
slug: Web/API/Request/blob
page-type: web-api-instance-method
browser-compat: api.Request.blob
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`blob()`** của giao diện {{domxref("Request")}} đọc body của request và trả về nó dưới dạng một promise giải quyết với một {{domxref("Blob")}}.

## Cú pháp

```js-nolint
blob()
```

### Tham số

Không có.

### Giá trị trả về

Một promise giải quyết với một {{domxref("Blob")}} mà dữ liệu của nó là các byte của body và kiểu media là giá trị của header `Content-Type` của request.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra vì một trong các lý do sau:
    - Body của request là [disturbed hoặc locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - Có lỗi khi giải mã nội dung body, ví dụ do header {{httpheader("Content-Encoding")}} không đúng.

## Ví dụ

```js
const obj = { hello: "world" };
const myBlob = new Blob([JSON.stringify(obj, null, 2)], {
  type: "application/json",
});

const request = new Request("/myEndpoint", {
  method: "POST",
  body: myBlob,
});

request.blob().then((myBlob) => {
  // làm gì đó với blob được gửi trong request
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Response.blob()")}}
