---
title: "FormData: phương thức has()"
short-title: has()
slug: Web/API/FormData/has
page-type: web-api-instance-method
browser-compat: api.FormData.has
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers}}

Phương thức **`has()`** của giao diện {{domxref("FormData")}} trả về việc một đối tượng `FormData` có chứa một khóa nhất định hay không.

## Cú pháp

```js-nolint
has(name)
```

### Tham số

- `name`
  - : Một chuỗi biểu thị tên của khóa bạn muốn kiểm tra.

### Giá trị trả về

`true` nếu một khóa của `FormData` khớp với `name` đã chỉ định. Nếu không, `false`.

## Ví dụ

Đoạn mã sau cho thấy kết quả kiểm tra xem `username` có tồn tại trong một đối tượng `FormData` hay không, trước và sau khi thêm giá trị `username` vào đó bằng {{domxref("FormData.append", "append()")}}:

```js
formData.has("username"); // Returns false
formData.append("username", "Chris");
formData.has("username"); // Returns true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)
- {{HTMLElement("Form")}}
