---
title: "HTMLFieldSetElement: thuộc tính validity"
short-title: validity
slug: Web/API/HTMLFieldSetElement/validity
page-type: web-api-instance-property
browser-compat: api.HTMLFieldSetElement.validity
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`validity`** của giao diện {{domxref("HTMLFieldSetElement")}} trả về một đối tượng {{domxref("ValidityState")}} đại diện cho các trạng thái hợp lệ mà phần tử này đang có. Mặc dù các phần tử {{HTMLElement("fieldset")}} không bao giờ là ứng viên cho [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation), trạng thái hợp lệ vẫn có thể không hợp lệ nếu một thông báo lỗi tùy chỉnh đã được đặt.

> [!NOTE]
> Các lớp giả CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}} được áp dụng cho các phần tử `<fieldset>` dựa trên tính hợp lệ của các điều khiển form con cháu của chúng, không phải dựa trên bản thân fieldset.

## Giá trị

Một đối tượng {{domxref("ValidityState")}}.

## Ví dụ

Ví dụ sau minh họa rằng một `<fieldset>` ở trạng thái không hợp lệ khi một {{domxref("ValidityState/customError", "customError")}} được đặt; ở trạng thái này, {{domxref("HTMLFieldSetElement/checkValidity", "checkValidity()")}} trả về `true` trong khi thuộc tính `valid` của `validityState` là `false`.

```js
const fieldSet = document.getElementById("myFieldSet");
fieldSet.setCustomValidity("Fieldset này không hợp lệ.");
const validityState = fieldSet.validity;
console.log(validityState.valid); // false
console.log(validityState.customError); // true
console.log(fieldSet.checkValidity()); // true
```

> [!NOTE]
> Các lớp giả CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}} được áp dụng cho các phần tử `<fieldset>` dựa trên tính hợp lệ của các điều khiển form con cháu của chúng, không phải dựa trên bản thân fieldset.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLFieldSetElement.checkValidity()")}}
- {{HTMLElement("fieldset")}}
- {{HTMLElement("form")}}
- [Learn: Xác thực form phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
