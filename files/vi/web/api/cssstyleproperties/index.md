---
title: CSSStyleProperties
slug: Web/API/CSSStyleProperties
page-type: web-api-interface
browser-compat: api.CSSStyleProperties
---

{{APIRef("CSSOM")}}

Giao diện **`CSSStyleProperties`** của [CSS Object Model (CSSOM)](/en-US/docs/Web/API/CSS_Object_Model) đại diện cho các kiểu inline hoặc kiểu tính toán có sẵn trên một phần tử, hoặc các kiểu liên kết với quy tắc CSS.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính của lớp cha, {{domxref("CSSStyleDeclaration")}}._

- Các thuộc tính được đặt tên
  - : Các thuộc tính được đặt tên dạng dấu gạch ngang và camelCase cho tất cả các thuộc tính CSS được trình duyệt hỗ trợ.
- {{DOMxRef("CSSStyleProperties.cssFloat", "CSSStyleProperties.cssFloat")}}
  - : Bí danh đặc biệt cho thuộc tính CSS {{CSSxRef("float")}}.

## Phương thức phiên bản

_Giao diện này kế thừa các phương thức của lớp cha, {{domxref("CSSStyleDeclaration")}}._

## Mô tả

Đối tượng của loại này có các thuộc tính được đặt tên dạng dấu gạch ngang cho **tất cả** [thuộc tính CSS](/en-US/docs/Web/CSS/Reference/Properties) được trình duyệt hỗ trợ, bao gồm cả các thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) và dài, và các thuộc tính có tiền tố `-moz` và `-webkit`.
Chúng có thể được truy cập bằng các phương thức kế thừa từ lớp cơ sở {{DOMxRef("CSSStyleDeclaration")}}, như {{DOMxRef("CSSStyleDeclaration/getPropertyValue", "getPropertyValue()")}} và {{DOMxRef("CSSStyleDeclaration/setProperty", "setProperty()")}}.

Ngoài ra, mỗi thuộc tính dạng dấu gạch ngang có thuộc tính tên {{glossary("camel case")}} tương ứng, trong đó tên được tạo bằng cách xóa các dấu gạch ngang và viết hoa mỗi từ sau từ đầu tiên.
Điều này cho phép bạn, ví dụ, truy cập thuộc tính CSS `margin-top` bằng cú pháp `style.marginTop` (trong đó `style` là một `CSSStyleProperties`), thay vì cú pháp rườm rà hơn `style.getPropertyValue("margin-top")` hoặc `style["margin-top"]`.
Thuộc tính CSS `float`, là từ khóa JavaScript được dành riêng, được đại diện bởi thuộc tính `cssFloat`.

Các thuộc tính CSS viết tắt của phần tử được mở rộng thành các thuộc tính dài tương ứng.
Ví dụ, phần tử với kiểu `"border-top: 1px solid black"` sẽ được đại diện trong đối tượng được trả về bởi các thuộc tính có tên {{cssxref("border-top")}} và `borderTop`, cùng với các thuộc tính dài tương ứng {{cssxref("border-top-color")}} và `borderTopColor`, {{cssxref("border-top-style")}} và `borderTopStyle`, và {{cssxref("border-top-width")}} và `borderTopWidth`.

Các thuộc tính không có giá trị xác định mặc định là chuỗi rỗng (`""`).

Các đối tượng `CSSStyleProperties` được hiển thị bằng các API sau:

- {{DOMxRef("HTMLElement.style")}}, {{domxref("SVGElement.style")}}, và {{domxref("MathMLElement.style")}}: Được sử dụng để lấy và đặt _kiểu inline_ của một phần tử đơn.
- {{DOMxRef("Window.getComputedStyle()")}}: Được sử dụng để lấy kiểu tính toán (chỉ đọc) của phần tử.
- {{DOMxRef("CSSStyleRule.style")}}: Được sử dụng để lấy và đặt các kiểu của quy tắc kiểu.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này trình bày cách lấy và đặt kiểu phần tử cục bộ và tính toán bằng cả thuộc tính camelCase và thuộc tính dạng dấu gạch ngang.

#### HTML

HTML xác định {{htmlelement("div")}} với một số kiểu được đặt, được lồng trong một div khác đặt `font-weight` là `bold`.

```html
<div style="font-weight: bold;">
  <div style="border-top: 3px solid blue; color: red;margin:5px;" id="elt">
    Div content.
    <br />
    Inner: "border-top: 3px solid blue; color: red;margin:5px;".
    <br />
    Outer: "font-weight: bold;"
  </div>
</div>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 140px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

Đầu tiên lấy kiểu cục bộ và tính toán cho phần tử có ID `"elt"`.

```js
const element = document.querySelector("#elt");
const elementStyle = element.style;
const computedStyle = window.getComputedStyle(element);
```

Sau đó lấy thuộc tính viết tắt `borderTop` của `CSSStyleProperties` bằng ký hiệu dấu chấm cho cả kiểu cục bộ và tính toán.

```js
// Lấy kiểu bằng ký hiệu dấu chấm
const elemBorderTop = elementStyle.borderTop;
const compBorderTop = computedStyle.borderTop;

log('Format: Style = "Element" / "Computed"');
log(`"borderTop" = "${elemBorderTop}" / "${compBorderTop}"'`);
```

#### Kết quả

{{EmbedLiveSample("Basic usage", "100", "250")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
