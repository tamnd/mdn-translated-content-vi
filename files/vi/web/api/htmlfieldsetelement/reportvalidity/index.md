---
title: "HTMLFieldSetElement: phương thức reportValidity()"
short-title: reportValidity()
slug: Web/API/HTMLFieldSetElement/reportValidity
page-type: web-api-instance-method
browser-compat: api.HTMLFieldSetElement.reportValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`reportValidity()`** của giao diện {{domxref("HTMLFieldSetElement")}} thực hiện các bước kiểm tra tính hợp lệ giống như phương thức {{domxref("HTMLFieldSetElement.checkValidity", "checkValidity()")}}. Nó luôn trả về true vì các phần tử {{HTMLElement("fieldset")}} không bao giờ là ứng viên cho [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation).

## Cú pháp

```js-nolint
reportValidity()
```

### Tham số

Không có.

### Giá trị trả về

Một giá trị logic, `true`.

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
