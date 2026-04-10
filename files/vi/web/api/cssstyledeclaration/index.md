---
title: CSSStyleDeclaration
slug: Web/API/CSSStyleDeclaration
page-type: web-api-interface
browser-compat: api.CSSStyleDeclaration
---

{{APIRef("CSSOM")}}

Giao diện **`CSSStyleDeclaration`** là lớp cơ sở cho các đối tượng đại diện cho khối khai báo CSS với các tập hợp thông tin kiểu CSS được hỗ trợ khác nhau:

- {{domxref("CSSStyleProperties")}} — Các kiểu CSS được khai báo trong bảng kiểu ({{domxref("CSSStyleRule.style")}}), kiểu nội tuyến cho một phần tử như {{DOMxRef("HTMLElement/style","HTMLElement")}}, {{domxref("SVGElement/style","SVGElement")}}, và {{domxref("MathMLElement/style","MathMLElement")}}, hoặc kiểu đã tính toán cho một phần tử được trả về bởi {{DOMxRef("Window.getComputedStyle()")}}.
- {{domxref("CSSPageDescriptors")}} — Các kiểu cho [at-rules](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) CSS.

Giao diện này hiển thị thông tin kiểu và các phương thức cũng như thuộc tính liên quan đến kiểu khác nhau.
Ví dụ, nó cung cấp {{DOMxRef("CSSStyleDeclaration/getPropertyValue","getPropertyValue()" )}} để lấy giá trị của một thuộc tính CSS có gạch nối, chẳng hạn như `border-top`, không thể truy cập trực tiếp bằng ký hiệu dấu chấm do các dấu gạch nối trong tên của nó.

> [!NOTE]
> Các phiên bản trước của đặc tả kỹ thuật sử dụng `CSSStyleDeclaration` để đại diện cho tất cả các khối khai báo CSS, và một số trình duyệt cùng các phiên bản trình duyệt có thể vẫn làm như vậy (kiểm tra bảng tương thích trình duyệt cho các API ở trên).
> Nhìn chung, cùng một mã trang web sẽ hoạt động trong cả phiên bản cũ và mới, nhưng một số thuộc tính được trả về trong `CSSStyleDeclaration` có thể không phù hợp trong một ngữ cảnh cụ thể.

## Thuộc tính

- {{DOMxRef("CSSStyleDeclaration.cssText")}}
  - : Biểu diễn dạng văn bản của khối khai báo, nếu và chỉ khi nó được hiển thị thông qua {{DOMxRef("HTMLElement.style")}}.
    Việc thiết lập thuộc tính này sẽ thay đổi kiểu nội tuyến.
    Nếu bạn muốn biểu diễn dạng văn bản của một khối khai báo đã tính toán, bạn có thể lấy nó bằng `JSON.stringify()`.
- {{DOMxRef("CSSStyleDeclaration.length")}} {{ReadOnlyInline}}
  - : Số lượng thuộc tính.
    Xem phương thức {{DOMxRef("CSSStyleDeclaration.item()", 'item()')}} bên dưới.
- {{DOMxRef("CSSStyleDeclaration.parentRule")}} {{ReadOnlyInline}}
  - : {{DOMxRef("CSSRule")}} chứa.

### Thuộc tính CSS

- {{DOMxRef("CSSStyleDeclaration.cssFloat", "CSSStyleDeclaration.cssFloat")}} {{deprecated_inline}}
  - : Bí danh đặc biệt cho thuộc tính CSS {{CSSxRef("float")}}.
- Thuộc tính đặt tên `CSSStyleDeclaration`
  - : Các thuộc tính có gạch nối và camel-case cho tất cả các thuộc tính CSS được hỗ trợ.

## Phương thức instance

- {{DOMxRef("CSSStyleDeclaration.getPropertyPriority()")}}
  - : Trả về độ ưu tiên tùy chọn, "important".
- {{DOMxRef("CSSStyleDeclaration.getPropertyValue()")}}
  - : Trả về giá trị thuộc tính khi được cung cấp một tên thuộc tính.
- {{DOMxRef("CSSStyleDeclaration.item()")}}
  - : Trả về một tên thuộc tính CSS theo chỉ mục của nó, hoặc chuỗi rỗng nếu chỉ mục nằm ngoài phạm vi.
- {{DOMxRef("CSSStyleDeclaration.removeProperty()")}}
  - : Xóa một thuộc tính khỏi khối khai báo CSS.
- {{DOMxRef("CSSStyleDeclaration.setProperty()")}}
  - : Sửa đổi một thuộc tính CSS hiện có hoặc tạo một thuộc tính CSS mới trong khối khai báo.
- {{DOMxRef("CSSStyleDeclaration.getPropertyCSSValue()")}} {{deprecated_inline}}
  - : **Chỉ được hỗ trợ thông qua getComputedStyle trong Firefox.** Trả về giá trị thuộc tính dưới dạng {{DOMxRef("CSSPrimitiveValue")}} hoặc `null` cho [các thuộc tính shorthand](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties).

## Ví dụ

```js
const styleObj = document.styleSheets[0].cssRules[0].style;
console.log(styleObj.cssText);

for (let i = styleObj.length; i--; ) {
  const nameString = styleObj[i];
  styleObj.removeProperty(nameString);
}

console.log(styleObj.cssText);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
