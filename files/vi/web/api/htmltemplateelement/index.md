---
title: HTMLTemplateElement
slug: Web/API/HTMLTemplateElement
page-type: web-api-interface
browser-compat: api.HTMLTemplateElement
---

{{APIRef("Web Components")}}

Giao diện **`HTMLTemplateElement`** cho phép truy cập vào nội dung của một phần tử HTML {{HTMLElement("template")}}.

> [!NOTE]
> Một bộ phân tích cú pháp HTML có thể tạo ra `HTMLTemplateElement` hoặc {{domxref("ShadowRoot")}} khi nó phân tích một phần tử {{HTMLElement("template")}}, tùy theo các thuộc tính `<template>`.
> Nếu tạo ra `HTMLTemplateElement`, các thuộc tính "shadow" sẽ được phản ánh từ template.
> Tuy nhiên, chúng không hữu ích vì `HTMLTemplateElement` không phải là một shadow root và sau đó không thể được chuyển đổi thành shadow root.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Giao diện này kế thừa các thuộc tính của {{domxref("HTMLElement")}}._

- {{domxref("HTMLTemplateElement.content", "content")}} {{ReadOnlyInline}}
  - : Một {{domxref("DocumentFragment")}} chỉ đọc, chứa cây DOM đại diện cho nội dung template của phần tử {{HTMLElement("template")}}.
- {{domxref("HTMLTemplateElement.shadowRootMode", "shadowRootMode")}}
  - : Một chuỗi phản ánh giá trị của thuộc tính [`shadowrootmode`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootmode) của phần tử `<template>` liên kết.
- {{domxref("HTMLTemplateElement.shadowRootDelegatesFocus", "shadowRootDelegatesFocus")}}
  - : Một giá trị logic phản ánh giá trị của thuộc tính [`shadowrootdelegatesfocus`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootdelegatesfocus) của phần tử `<template>` liên kết.
- {{domxref("HTMLTemplateElement.shadowRootClonable", "shadowRootClonable")}}
  - : Một giá trị logic phản ánh giá trị của thuộc tính [`shadowrootclonable`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootclonable) của phần tử `<template>` liên kết.
- {{domxref("HTMLTemplateElement.shadowRootCustomElementRegistry", "shadowRootCustomElementRegistry")}}
  - : Một chuỗi phản ánh giá trị của thuộc tính [`shadowrootcustomelementregistry`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootcustomelementregistry) của phần tử `<template>` liên kết, cho biết shadow root khai báo sẽ dùng một {{domxref("CustomElementRegistry")}} theo phạm vi.
- {{domxref("HTMLTemplateElement.shadowRootSerializable", "shadowRootSerializable")}}
  - : Một giá trị logic phản ánh giá trị của thuộc tính [`shadowrootserializable`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootserializable) của phần tử `<template>` liên kết.

## Phương thức thể hiện

_Giao diện này kế thừa các phương thức của {{domxref("HTMLElement")}}._

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}
