---
title: "HTMLFieldSetElement: phương thức checkValidity()"
short-title: checkValidity()
slug: Web/API/HTMLFieldSetElement/checkValidity
page-type: web-api-instance-method
browser-compat: api.HTMLFieldSetElement.checkValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`checkValidity()`** của giao diện {{domxref("HTMLFieldSetElement")}} kiểm tra xem phần tử có hợp lệ không, nhưng luôn trả về true vì các phần tử {{HTMLElement("fieldset")}} không bao giờ là ứng viên cho [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation).

> [!NOTE]
> Các lớp giả CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}} được áp dụng cho các phần tử `<fieldset>` dựa trên tính hợp lệ của các điều khiển form con cháu của chúng, không phải dựa trên bản thân fieldset.

## Cú pháp

```js-nolint
checkValidity()
```

### Tham số

Không có.

### Giá trị trả về

Một giá trị logic, `true`.

## Ví dụ

Trong ví dụ sau, việc gọi `checkValidity()` trả về `true`.

```js
const element = document.getElementById("myFieldSet");
console.log(element.checkValidity());
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLFieldSetElement.reportValidity()")}}
- {{HTMLElement("fieldset")}}
- {{HTMLElement("form")}}
- [Learn: Xác thực form phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
