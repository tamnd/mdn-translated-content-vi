---
title: CustomElementRegistry
slug: Web/API/CustomElementRegistry
page-type: web-api-interface
browser-compat: api.CustomElementRegistry
---

{{APIRef("Web Components")}}

Giao diện **`CustomElementRegistry`** cung cấp các phương thức để đăng ký custom element và truy vấn các element đã đăng ký. Để lấy một thể hiện của nó, hãy dùng thuộc tính {{domxref("window.customElements")}}. Để tạo một scoped registry, hãy dùng hàm tạo {{domxref("CustomElementRegistry.CustomElementRegistry()", "CustomElementRegistry()")}}.

## Hàm tạo

- {{domxref("CustomElementRegistry.CustomElementRegistry()", "CustomElementRegistry()")}}
  - : Tạo một đối tượng `CustomElementRegistry` mới, dùng trong phạm vi cục bộ.

## Phương thức thể hiện

- {{domxref("CustomElementRegistry.define()")}}
  - : Định nghĩa một [custom element](/en-US/docs/Web/API/Web_components/Using_custom_elements) mới.
- {{domxref("CustomElementRegistry.get()")}}
  - : Trả về constructor cho custom element có tên đã cho, hoặc {{jsxref("undefined")}} nếu custom element đó chưa được định nghĩa.
- {{domxref("CustomElementRegistry.getName()")}}
  - : Trả về tên của custom element đã được định nghĩa trước đó, hoặc `null` nếu custom element đó chưa được định nghĩa.
- {{domxref("CustomElementRegistry.upgrade()")}}
  - : Nâng cấp trực tiếp một custom element, ngay cả trước khi nó được kết nối với shadow root của nó.
- {{domxref("CustomElementRegistry.initialize()")}}
  - : Gắn một scoped registry với một cây con DOM, đặt custom element registry trên từng hậu duệ bao hàm và nâng cấp mọi custom element.
- {{domxref("CustomElementRegistry.whenDefined()")}}
  - : Trả về một {{jsxref("Promise")}} rỗng sẽ được giải quyết khi một custom element trở thành đã định nghĩa với tên đã cho. Nếu custom element đó đã được định nghĩa sẵn, promise trả về sẽ được hoàn thành ngay lập tức.

## Ví dụ

Xem phần [Ví dụ](/en-US/docs/Web/API/Web_components/Using_custom_elements#examples) trong [hướng dẫn sử dụng custom element](/en-US/docs/Web/API/Web_components/Using_custom_elements) của chúng tôi.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
