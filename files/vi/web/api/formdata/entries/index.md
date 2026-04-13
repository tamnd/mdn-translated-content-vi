---
title: "FormData: phương thức entries()"
short-title: entries()
slug: Web/API/FormData/entries
page-type: web-api-instance-method
browser-compat: api.FormData.entries
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers}}

Phương thức **`FormData.entries()`** trả về một [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) duyệt qua tất cả các cặp khóa/giá trị có trong {{domxref("FormData")}}. Khóa của mỗi cặp là một chuỗi, và giá trị là một chuỗi hoặc một {{domxref("Blob")}}.

## Cú pháp

```js-nolint
entries()
```

### Tham số

Không có.

### Giá trị trả về

Một [iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) của các cặp khóa/giá trị của {{domxref("FormData")}}.

## Ví dụ

```js
formData.append("key1", "value1");
formData.append("key2", "value2");

// Hiển thị các cặp khóa/giá trị
for (const pair of formData.entries()) {
  console.log(pair[0], pair[1]);
}
```

Kết quả là:

```plain
key1 value1
key2 value2
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các đối tượng FormData](/en-US/docs/Web/API/XMLHttpRequest_API/Using_FormData_Objects)
- {{HTMLElement("Form")}}
