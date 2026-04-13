---
title: "FormData: phương thức get()"
short-title: get()
slug: Web/API/FormData/get
page-type: web-api-instance-method
browser-compat: api.FormData.get
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers}}

Phương thức **`get()`** của giao diện {{domxref("FormData")}} trả về giá trị đầu tiên liên kết với một khóa cho trước bên trong đối tượng `FormData`. Nếu bạn kỳ vọng có nhiều giá trị và muốn lấy tất cả, hãy dùng phương thức {{domxref("FormData.getAll()","getAll()")}} thay thế.

## Cú pháp

```js-nolint
get(name)
```

### Tham số

- `name`
  - : Một chuỗi biểu thị tên của khóa bạn muốn truy xuất.

### Giá trị trả về

Một giá trị có khóa khớp với `name` đã chỉ định. Nếu không, trả về [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

## Ví dụ

Nếu chúng ta thêm hai giá trị `username` vào một {{domxref("FormData")}} bằng {{domxref("FormData.append", "append()")}}:

```js
formData.append("username", "Chris");
formData.append("username", "Bob");
```

Phương thức `get()` sau đây sẽ chỉ trả về giá trị `username` đầu tiên:

```js
formData.get("username"); // Returns "Chris"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)
- {{HTMLElement("Form")}}
