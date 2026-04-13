---
title: "HTMLTemplateElement: thuộc tính shadowRootMode"
short-title: shadowRootMode
slug: Web/API/HTMLTemplateElement/shadowRootMode
page-type: web-api-instance-property
browser-compat: api.HTMLTemplateElement.shadowRootMode
---

{{APIRef("Web Components")}}

Thuộc tính **`shadowRootMode`** của giao diện {{domxref("HTMLTemplateElement")}} phản ánh giá trị của thuộc tính [`shadowrootmode`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootmode) của phần tử [`<template>`](/en-US/docs/Web/HTML/Reference/Elements/template) liên kết.

> [!NOTE]
> Thuộc tính này không hữu ích cho nhà phát triển và chỉ được tài liệu hóa để đầy đủ.
> Nếu một phần tử `<template>` được dùng để tạo khai báo một [`ShadowRoot`](/en-US/docs/Web/API/ShadowRoot), thì đối tượng và thuộc tính này không tồn tại.
> Ngược lại, nếu một `HTMLTemplateElement` được tạo ra, giá trị của thuộc tính này không còn liên quan vì đối tượng không phải là shadow root và sau đó không thể được đổi thành shadow root.

## Giá trị

Phản ánh giá trị của thuộc tính [`shadowrootmode`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootmode) của phần tử [`<template>`](/en-US/docs/Web/HTML/Reference/Elements/template) liên kết.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Thuộc tính [`shadowrootmode`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootmode) của phần tử `<template>`
- {{domxref("ShadowRoot.mode")}}
