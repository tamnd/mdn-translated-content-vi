---
title: "HTMLObjectElement: checkValidity() method"
short-title: checkValidity()
slug: Web/API/HTMLObjectElement/checkValidity
page-type: web-api-instance-method
browser-compat: api.HTMLObjectElement.checkValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`checkValidity()`** của giao diện {{domxref("HTMLObjectElement")}} kiểm tra xem phần tử có hợp lệ hay không, nhưng luôn trả về true vì các phần tử {{HTMLElement("object")}} không bao giờ là ứng cử viên cho [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation).

## Cú pháp

```js-nolint
checkValidity()
```

### Tham số

Không có.

### Giá trị trả về

Một giá trị boolean, `true`.

## Ví dụ

Trong ví dụ sau, gọi `checkValidity()` sẽ trả về `true`.

```js
const element = document.getElementById("myObjectElement");
console.log(element.checkValidity());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLObjectElement.reportValidity()")}}
- {{HTMLElement("object")}}
- {{HTMLElement("form")}}
- [Học: Xác thực form phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
