---
title: "FormData: phương thức keys()"
short-title: keys()
slug: Web/API/FormData/keys
page-type: web-api-instance-method
browser-compat: api.FormData.keys
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers}}

Phương thức **`FormData.keys()`** trả về một [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) duyệt qua tất cả các khóa có trong {{domxref("FormData")}}. Các khóa là các chuỗi.

## Cú pháp

```js-nolint
keys()
```

### Tham số

Không có.

### Giá trị trả về

Một [`iterator`](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) của các khóa của {{domxref("FormData")}}.

## Ví dụ

```js
const formData = new FormData();
formData.append("key1", "value1");
formData.append("key2", "value2");

// Hiển thị các khóa
for (const key of formData.keys()) {
  console.log(key);
}
```

Kết quả là:

```plain
key1
key2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)
- {{HTMLElement("Form")}}
