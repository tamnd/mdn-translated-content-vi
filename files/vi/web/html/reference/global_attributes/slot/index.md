---
title: HTML slot global attribute
short-title: slot
slug: Web/HTML/Reference/Global_attributes/slot
page-type: html-attribute
browser-compat: html.global_attributes.slot
sidebar: htmlsidebar
---

Thuộc tính [toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) **`slot`** gán một slot trong shadow tree của [shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM) cho một phần tử: Một phần tử có thuộc tính `slot` được gán cho slot được tạo bởi phần tử {{HTMLElement("slot")}} có giá trị thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/slot#name) khớp với giá trị thuộc tính `slot` đó. Bạn có thể có nhiều phần tử được gán cho cùng một slot bằng cách sử dụng cùng tên slot. Các phần tử không có thuộc tính `slot` được gán cho slot không có tên (unnamed slot), nếu có.

Để xem ví dụ, hãy xem hướng dẫn [Sử dụng template và slot](/en-US/docs/Web/API/Web_components/Using_templates_and_slots) của chúng tôi.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) HTML
- Phần tử HTML {{HTMLElement("slot")}}
- Phần tử HTML {{HTMLElement("template")}}
- Phần tử giả CSS {{CSSXref("::slotted")}}
- Mô-đun [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping)
- [Web components](/en-US/docs/Web/API/Web_components)
