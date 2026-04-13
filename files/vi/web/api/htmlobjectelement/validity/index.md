---
title: "HTMLObjectElement: validity property"
short-title: validity
slug: Web/API/HTMLObjectElement/validity
page-type: web-api-instance-property
browser-compat: api.HTMLObjectElement.validity
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`validity`** của giao diện {{domxref("HTMLObjectElement")}} trả về một đối tượng {{domxref("ValidityState")}} đại diện cho các trạng thái hợp lệ mà phần tử này đang trong. Mặc dù các phần tử {{HTMLElement("object")}} không bao giờ là ứng cử viên cho [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation), trạng thái hợp lệ vẫn có thể không hợp lệ nếu đã đặt thông báo hợp lệ tùy chỉnh.

## Giá trị

Một đối tượng {{domxref("ValidityState")}}.

## Ví dụ

Ví dụ sau minh họa rằng một phần tử `<object>` ở trạng thái không hợp lệ khi đặt {{domxref("ValidityState/customError", "customError")}}; trong trạng thái này, {{domxref("HTMLObjectElement/checkValidity", "checkValidity()")}} trả về `true` trong khi thuộc tính `validity` của `validityState` là `false`.

```js
const objectElem = document.getElementById("myObjectElm");
objectElem.setCustomValidity("This object element is invalid.");
const validityState = objectElem.validity;
console.log(validityState.valid); // false
console.log(validityState.customError); // true
console.log(objectElem.checkValidity()); // true
```

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
