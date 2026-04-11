---
title: "HTMLButtonElement: thuộc tính willValidate"
short-title: willValidate
slug: Web/API/HTMLButtonElement/willValidate
page-type: web-api-instance-property
browser-compat: api.HTMLButtonElement.willValidate
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`willValidate`** của giao diện {{domxref("HTMLButtonElement")}} cho biết phần tử {{htmlelement("button")}} có phải là ứng viên cho [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) hay không. Nó là `false` nếu bất kỳ điều kiện nào ngăn nó xác thực ràng buộc, bao gồm:

- {{domxref("HTMLButtonElement.type", "type")}} của nó là `reset` hoặc `button`;
- Nó có một phần tử tổ tiên {{HTMLElement("datalist")}};
- Thuộc tính {{domxref("HTMLButtonElement.disabled", "disabled")}} là `true`.

## Giá trị

Một giá trị boolean.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLButtonElement.checkValidity()")}}
- {{HTMLElement("button")}}
- {{HTMLElement("form")}}
- [Learn: Client-side form validation](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Guide: Constraint validation](/en-US/docs/Web/HTML/Guides/Constraint_validation)
