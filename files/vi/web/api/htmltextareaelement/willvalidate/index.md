---
title: "HTMLTextAreaElement: willValidate property"
short-title: willValidate
slug: Web/API/HTMLTextAreaElement/willValidate
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.willValidate
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`willValidate`** của giao diện {{domxref("HTMLTextAreaElement")}} cho biết phần tử {{htmlelement("textarea")}} có phải là ứng viên cho [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) hay không. Nó là `false` nếu có điều kiện nào ngăn nó bị xác thực ràng buộc, chẳng hạn khi thuộc tính {{domxref("HTMLTextAreaElement.disabled", "disabled")}} hoặc {{domxref("HTMLTextAreaElement.readOnly", "readOnly")}} là `true`.

## Giá trị

Một giá trị logic.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTextAreaElement.checkValidity()")}}
- {{HTMLElement("textarea")}}
- {{HTMLElement("form")}}
- [Học: Xác thực biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
