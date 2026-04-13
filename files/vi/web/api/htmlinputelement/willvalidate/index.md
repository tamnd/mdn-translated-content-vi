---
title: "HTMLInputElement: thuộc tính willValidate"
short-title: willValidate
slug: Web/API/HTMLInputElement/willValidate
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.willValidate
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`willValidate`** của giao diện {{domxref("HTMLInputElement")}} cho biết liệu phần tử {{htmlelement("input")}} có phải là ứng viên cho [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) hay không. Nó là `false` nếu bất kỳ điều kiện nào ngăn nó kiểm tra ràng buộc, bao gồm:

- {{domxref("HTMLInputElement.type", "type")}} của nó là một trong `hidden`, `reset` hoặc `button`;
- Nó có tổ tiên là {{HTMLElement("datalist")}};
- Thuộc tính {{domxref("HTMLInputElement.disabled", "disabled")}} của nó là `true`.

## Giá trị

Một giá trị boolean.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.checkValidity()")}}
- {{HTMLElement("input")}}
- {{HTMLElement("form")}}
- [Learn: Kiểm tra biểu mẫu phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Guide: Kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
