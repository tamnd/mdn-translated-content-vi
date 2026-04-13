---
title: "ElementInternals: checkValidity() method"
short-title: checkValidity()
slug: Web/API/ElementInternals/checkValidity
page-type: web-api-instance-method
browser-compat: api.ElementInternals.checkValidity
---

{{APIRef("Web Components")}}

Phương thức **`checkValidity()`** của giao diện {{domxref("ElementInternals")}} kiểm tra xem phần tử có đáp ứng bất kỳ quy tắc [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nào được áp dụng cho nó hay không.

Nếu `checkValidity` trả về `false`, một sự kiện [invalid](/en-US/docs/Web/API/HTMLInputElement/invalid_event) có thể hủy bỏ sẽ được kích hoạt trên phần tử.

## Cú pháp

```js-nolint
checkValidity()
```

### Tham số

Không có.

### Giá trị trả về

Một giá trị boolean, `true` nếu phần tử đáp ứng tất cả các ràng buộc xác thực.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu phần tử không có thuộc tính `formAssociated` được đặt thành `true`.

## Ví dụ

Trong ví dụ sau, {{domxref("ElementInternals.setValidity()")}} được sử dụng để chỉ ra rằng phần tử không đáp ứng các quy tắc xác thực. Gọi `checkValidity()` trả về `false`. Sau khi gọi `setValidity` lần nữa, lần này chỉ ra rằng tất cả các quy tắc đều được đánh dấu là false, `checkValidity()` trả về `true`.

```js
let element = document.getElementById("join-checkbox");
element.internals_.setValidity({ valueMissing: true }, "my message");
console.log(element.internals_.checkValidity()); // false
element.internals_.setValidity({});
console.log(element.internals_.checkValidity()); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
