---
title: "Request: phương thức formData()"
short-title: formData()
slug: Web/API/Request/formData
page-type: web-api-instance-method
browser-compat: api.Request.formData
---

{{APIRef("Fetch API")}}{{AvailableInWorkers}}

Phương thức **`formData()`** của giao diện {{domxref("Request")}} đọc body của request và trả về nó dưới dạng một promise giải quyết với một đối tượng {{domxref("FormData")}}.

## Cú pháp

```js-nolint
formData()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} giải quyết với một đối tượng {{domxref("FormData")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra vì một trong các lý do sau:
    - Body của request là [disturbed hoặc locked](/en-US/docs/Web/API/Fetch_API/Using_Fetch#locked_and_disturbed_streams).
    - Có lỗi khi giải mã nội dung body, ví dụ do header {{httpheader("Content-Encoding")}} không đúng.
    - Kiểu {{glossary("MIME")}} của body không thể xác định từ các header {{httpheader("Content-Type")}} trong request, hoặc không phải `application/x-www-form-urlencoded` hoặc `multipart/form-data`.
    - Body không thể được phân tích thành đối tượng `FormData`.

## Ví dụ

```js
const formData = new FormData();
const fileField = document.querySelector('input[type="file"]');

formData.append("username", "abc123");
formData.append("avatar", fileField.files[0]);

const request = new Request("/myEndpoint", {
  method: "POST",
  body: formData,
});

request.formData().then((data) => {
  // làm gì đó với formdata được gửi trong request
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Response.formData()")}}
