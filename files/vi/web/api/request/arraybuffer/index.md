---
title: "Request: phương thức arrayBuffer()"
short-title: arrayBuffer()
slug: Web/API/Request/arrayBuffer
page-type: web-api-instance-method
browser-compat: api.Request.arrayBuffer
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`arrayBuffer()`** của giao diện {{domxref("Request")}} đọc body của request và trả về nó dưới dạng một promise giải quyết với một {{jsxref("ArrayBuffer")}}.

## Cú pháp

```js-nolint
arrayBuffer()
```

### Tham số

Không có.

### Giá trị trả về

Một promise giải quyết với một {{jsxref("ArrayBuffer")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra vì một trong các lý do sau:
    - Body của request là [disturbed hoặc locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - Có lỗi khi giải mã nội dung body, ví dụ do header {{httpheader("Content-Encoding")}} không đúng.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu có vấn đề khi tạo `ArrayBuffer` liên kết, ví dụ dữ liệu quá lớn.

## Ví dụ

```js
const myArray = new Uint8Array(10);

const request = new Request("/myEndpoint", {
  method: "POST",
  body: myArray,
});

request.arrayBuffer().then((buffer) => {
  // làm gì đó với buffer được gửi trong request
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Response.arrayBuffer()")}}
