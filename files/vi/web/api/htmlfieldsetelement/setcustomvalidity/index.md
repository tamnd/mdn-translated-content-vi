---
title: "HTMLFieldSetElement: phương thức setCustomValidity()"
short-title: setCustomValidity()
slug: Web/API/HTMLFieldSetElement/setCustomValidity
page-type: web-api-instance-method
browser-compat: api.HTMLFieldSetElement.setCustomValidity
---

{{ APIRef("HTML DOM") }}

Phương thức **`setCustomValidity()`** của giao diện {{DOMxRef("HTMLFieldSetElement")}} đặt thông báo lỗi tùy chỉnh cho phần tử {{htmlelement("fieldset")}}. Sử dụng chuỗi rỗng để cho biết phần tử _không_ có lỗi tùy chỉnh.

Phần tử `<fieldset>` không phải là ứng viên cho xác thực ràng buộc. Phương thức {{DOMxRef("HTMLFieldSetElement.reportValidity()", "reportValidity()")}} sẽ không khiến thông báo lỗi tùy chỉnh được hiển thị cho người dùng, nhưng đặt thuộc tính {{DOMxRef("ValidityState.customError", "customError")}} của đối tượng {{DOMxRef("ValidityState")}} của phần tử thành `true` và thuộc tính {{DOMxRef("ValidityState.valid", "valid")}} thành `false`.

## Cú pháp

```js-nolint
setCustomValidity(string)
```

### Tham số

- `string`
  - : Chuỗi chứa thông báo lỗi. Chuỗi rỗng sẽ xóa bỏ mọi lỗi tùy chỉnh.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const errorFieldSet = document.getElementById("checkErrors");
const errors = issuesToReport();
if (errors) {
  errorFieldSet.setCustomValidity("Có một lỗi");
} else {
  errorFieldSet.setCustomValidity("");
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLelement("fieldset")}}
- {{domxref("HTMLFieldSetElement")}}
- {{domxref("HTMLFieldSetElement.validity")}}
- {{domxref("HTMLFieldSetElement.checkValidity()")}}
- {{domxref("HTMLFieldSetElement.reportValidity()")}}
- [Xác thực form](/en-US/docs/Web/HTML/Guides/Constraint_validation).
- [Learn: Xác thực form phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- Các lớp giả CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}}
