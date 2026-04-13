---
title: "HTMLObjectElement: reportValidity() method"
short-title: reportValidity()
slug: Web/API/HTMLObjectElement/reportValidity
page-type: web-api-instance-method
browser-compat: api.HTMLObjectElement.reportValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`reportValidity()`** của giao diện {{domxref("HTMLObjectElement")}} thực hiện các bước kiểm tra hợp lệ giống như phương thức {{domxref("HTMLObjectElement.checkValidity", "checkValidity()")}}. Nó luôn trả về true vì các phần tử {{HTMLElement("object")}} không bao giờ là ứng cử viên cho [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation).

## Cú pháp

```js-nolint
reportValidity()
```

### Tham số

Không có.

### Giá trị trả về

Một giá trị boolean, `true`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLObjectElement.checkValidity()")}}
- {{HTMLElement("object")}}
- {{HTMLElement("form")}}
- [Học: Xác thực form phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
