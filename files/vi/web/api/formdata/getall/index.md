---
title: "FormData: phương thức getAll()"
short-title: getAll()
slug: Web/API/FormData/getAll
page-type: web-api-instance-method
browser-compat: api.FormData.getAll
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers}}

Phương thức **`getAll()`** của giao diện {{domxref("FormData")}} trả về tất cả các giá trị liên kết với một khóa cho trước bên trong đối tượng `FormData`.

## Cú pháp

```js-nolint
getAll(name)
```

### Tham số

- `name`
  - : Một chuỗi biểu thị tên của khóa bạn muốn truy xuất.

### Giá trị trả về

Một mảng gồm các giá trị có khóa khớp với `name` đã chỉ định. Nếu không, trả về một danh sách rỗng.

## Ví dụ

Nếu chúng ta thêm hai giá trị `username` vào một {{domxref("FormData")}} bằng {{domxref("FormData.append", "append()")}}:

```js
formData.append("username", "Chris");
formData.append("username", "Bob");
```

Phương thức `getAll()` sau đây sẽ trả về cả hai giá trị `username` trong một mảng:

```js
formData.getAll("username"); // Returns ["Chris", "Bob"]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)
- {{HTMLElement("Form")}}
