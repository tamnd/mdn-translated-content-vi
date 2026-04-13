---
title: "Document: thuộc tính implementation"
short-title: implementation
slug: Web/API/Document/implementation
page-type: web-api-instance-property
browser-compat: api.Document.implementation
---

{{ ApiRef("DOM") }}

Thuộc tính **`Document.implementation`** trả về một đối tượng {{domxref("DOMImplementation")}} được liên kết với tài liệu hiện tại.

## Giá trị

Một đối tượng {{domxref("DOMImplementation")}}.

## Ví dụ

```js
const modName = "HTML";
const modVer = "2.0";
const conformTest = document.implementation.hasFeature(modName, modVer);

console.log(`DOM ${modName} ${modVer} được hỗ trợ?: ${conformTest}`);

// Log: "DOM HTML 2.0 được hỗ trợ?: true" (hasFeature luôn trả về true)
```

> [!WARNING]
> Không sử dụng cái này để phát hiện tính năng. Phương thức `hasFeature()` luôn trả về true.

## Ghi chú

Đặc tả DOM Level 1 của W3C chỉ chỉ định phương thức `hasFeature`, là một cách để xác định xem một mô-đun DOM có được trình duyệt hỗ trợ hay không (xem ví dụ trên và [Trình duyệt của bạn tuyên bố hỗ trợ gì?](https://www.w3.org/2003/02/06-dom-support.html)). Nếu có sẵn, các phương thức `DOMImplementation` khác cung cấp dịch vụ để kiểm soát những thứ bên ngoài một tài liệu duy nhất. Ví dụ: giao diện `DOMImplementation` bao gồm phương thức `createDocumentType` với đó DTD có thể được tạo cho một hoặc nhiều tài liệu được quản lý bởi việc triển khai.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
