---
title: "FormData: phương thức values()"
short-title: values()
slug: Web/API/FormData/values
page-type: web-api-instance-method
browser-compat: api.FormData.values
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers}}

Phương thức **`FormData.values()`** trả về một [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) duyệt qua tất cả các giá trị có trong {{domxref("FormData")}}. Các giá trị là các chuỗi hoặc các đối tượng {{domxref("Blob")}}.

## Cú pháp

```js-nolint
values()
```

### Tham số

Không có.

### Giá trị trả về

Một [`iterator`](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) của các giá trị của {{domxref("FormData")}}.

## Ví dụ

```js
const formData = new FormData();
formData.append("key1", "value1");
formData.append("key2", "value2");

// Hiển thị các giá trị
for (const value of formData.values()) {
  console.log(value);
}
```

Kết quả là:

```plain
value1
value2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)
- {{HTMLElement("Form")}}
