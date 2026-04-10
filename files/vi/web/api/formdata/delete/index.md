---
title: "FormData: phương thức delete()"
short-title: delete()
slug: Web/API/FormData/delete
page-type: web-api-instance-method
browser-compat: api.FormData.delete
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers}}

Phương thức **`delete()`** của giao diện {{domxref("FormData")}} xóa một khóa và các giá trị của nó khỏi đối tượng `FormData`.

## Cú pháp

```js-nolint
delete(name)
```

### Tham số

- `name`
  - : Tên của khóa bạn muốn xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Bạn có thể xóa một khóa và các giá trị của nó bằng `delete()`:

```js
formData.delete("username");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)
- {{HTMLElement("Form")}}
