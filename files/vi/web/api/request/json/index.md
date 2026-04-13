---
title: "Request: phương thức json()"
short-title: json()
slug: Web/API/Request/json
page-type: web-api-instance-method
browser-compat: api.Request.json
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`json()`** của giao diện {{domxref("Request")}} đọc body của request và trả về nó dưới dạng một promise giải quyết với kết quả phân tích text body thành {{JSxRef("JSON")}}.

Lưu ý rằng mặc dù phương thức có tên là `json()`, kết quả không phải là JSON mà là kết quả của việc lấy JSON làm đầu vào và phân tích nó để tạo ra một object JavaScript.

## Cú pháp

```js-nolint
json()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết thành một object JavaScript. Object này có thể là bất cứ thứ gì JSON biểu diễn được - một object, một mảng, một chuỗi, một số...

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra vì một trong các lý do sau:
    - Body của request là [disturbed hoặc locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - Có lỗi khi giải mã nội dung body, ví dụ do header {{httpheader("Content-Encoding")}} không đúng.
- {{jsxref("SyntaxError")}}
  - : Body của request không thể được phân tích thành JSON.

## Ví dụ

```js
const obj = { hello: "world" };

const request = new Request("/myEndpoint", {
  method: "POST",
  body: JSON.stringify(obj),
});

request.json().then((data) => {
  // làm gì đó với dữ liệu được gửi trong request
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Response.json()")}}
