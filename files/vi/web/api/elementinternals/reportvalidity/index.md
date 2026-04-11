---
title: "ElementInternals: reportValidity() method"
short-title: reportValidity()
slug: Web/API/ElementInternals/reportValidity
page-type: web-api-instance-method
browser-compat: api.ElementInternals.reportValidity
---

{{APIRef("Web Components")}}

Phương thức **`reportValidity()`** của giao diện {{domxref("ElementInternals")}} kiểm tra xem phần tử có đáp ứng bất kỳ quy tắc [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nào được áp dụng cho nó hay không.

Nếu `reportValidity` trả về `false`, một sự kiện [invalid](/en-US/docs/Web/API/HTMLInputElement/invalid_event) có thể hủy bỏ sẽ được kích hoạt trên phần tử.

Phương thức này hoạt động theo cách tương tự như {{domxref("ElementInternals.checkValidity()")}}, tuy nhiên nó còn gửi thêm giá trị của {{domxref("ElementInternals.validationMessage")}} đến tác nhân người dùng để hiển thị.

## Cú pháp

```js-nolint
reportValidity()
```

### Tham số

Không có.

### Giá trị trả về

Một giá trị boolean, `true` nếu phần tử đáp ứng tất cả các ràng buộc xác thực.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu phần tử không có thuộc tính `formAssociated` được đặt thành `true`.

## Ví dụ

Trong ví dụ sau, {{domxref("ElementInternals.setValidity()")}} được sử dụng để chỉ ra rằng phần tử không đáp ứng các quy tắc xác thực. Gọi `reportValidity()` trả về `false`, và giá trị "my message" được gửi đến tác nhân người dùng để hiển thị.

Sau khi gọi `setValidity` lần nữa, lần này chỉ ra rằng tất cả các quy tắc đều được đánh dấu là false, `reportValidity()` trả về `true`.

```js
let element = document.getElementById("join-checkbox");
element.internals_.setValidity({ valueMissing: true }, "my message");
console.log(element.internals_.reportValidity()); // false
element.internals_.setValidity({});
console.log(element.internals_.reportValidity()); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
