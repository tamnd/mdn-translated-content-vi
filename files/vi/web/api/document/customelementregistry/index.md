---
title: "Document: thuộc tính customElementRegistry"
short-title: customElementRegistry
slug: Web/API/Document/customElementRegistry
page-type: web-api-instance-property
browser-compat: api.Document.customElementRegistry
---

{{APIRef("Web Components")}}

Thuộc tính chỉ đọc **`customElementRegistry`** của giao diện {{domxref("Document")}} trả về đối tượng {{domxref("CustomElementRegistry")}} được liên kết với tài liệu này, hoặc `null` nếu chưa được thiết lập.

Đối với các tài liệu được liên kết với một {{domxref("Window")}} (chẳng hạn như tài liệu chính của một trang), đây là `CustomElementRegistry` toàn cầu cũng có thể truy cập được thông qua thuộc tính {{domxref("window.customElements")}}. Các tài liệu được tạo theo chương trình (ví dụ: thông qua {{domxref("DOMImplementation.createHTMLDocument()")}}) có custom element registry là `null` theo mặc định.

Thuộc tính này cũng có sẵn trên các đối tượng {{domxref("ShadowRoot")}} thông qua cùng tên thuộc tính {{domxref("ShadowRoot/customElementRegistry","customElementRegistry")}}.

## Giá trị

Một đối tượng {{domxref("CustomElementRegistry")}}, hoặc `null`.

## Ví dụ

### Truy cập custom element registry của một tài liệu

Ví dụ này cho thấy `customElementRegistry` của tài liệu chính giống như registry toàn cầu có sẵn thông qua {{domxref("window.customElements")}}, trong khi các tài liệu được tạo theo chương trình thông qua {{domxref("DOMImplementation.createHTMLDocument()")}} có registry là `null` theo mặc định.

```js
// The main document's registry is the global one:
console.log(document.customElementRegistry === window.customElements); // true (for Window-associated documents)

// Documents created programmatically have a null registry:
const newDoc = document.implementation.createHTMLDocument("New document");
console.log(newDoc.customElementRegistry); // null
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ShadowRoot.customElementRegistry")}}
- {{domxref("Element.customElementRegistry")}}
- {{domxref("CustomElementRegistry")}}
- {{domxref("window.customElements")}}
- [Sử dụng custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements)
