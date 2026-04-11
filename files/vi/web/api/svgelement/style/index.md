---
title: "SVGElement: thuộc tính style"
short-title: style
slug: Web/API/SVGElement/style
page-type: web-api-instance-property
browser-compat: api.SVGElement.style
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`style`** của giao diện {{domxref("SVGElement")}} trả về style [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) _nội tuyến_ của phần tử dưới dạng đối tượng {{domxref("CSSStyleProperties")}} trực tiếp. Đối tượng này có thể được dùng để lấy và đặt style nội tuyến của phần tử.

## Giá trị

Một đối tượng {{domxref("CSSStyleProperties")}} trực tiếp.

> [!NOTE]
> Các phiên bản đặc tả trước trả về {{domxref("CSSStyleDeclaration")}} (mà {{domxref("CSSStyleProperties")}} được kế thừa từ đó). Xem bảng [tương thích trình duyệt](#browser_compatibility) để biết thông tin hỗ trợ của từng trình duyệt.

Mặc dù bản thân thuộc tính `style` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSStyleProperties`, bạn vẫn có thể gán trực tiếp cho thuộc tính `style`, tương đương với việc gán cho thuộc tính {{domxref("CSSStyleDeclaration/cssText", "cssText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `CSSStyleProperties` bằng các phương thức {{domxref("CSSStyleDeclaration/setProperty", "setProperty()")}} và {{domxref("CSSStyleDeclaration/removeProperty", "removeProperty()")}}.

## Mô tả

Các giá trị của style nội tuyến được đặt trong thuộc tính [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) của phần tử được phản ánh bởi các thuộc tính tương ứng của đối tượng {{domxref("CSSStyleProperties")}} được trả về.

> [!NOTE]
> {{domxref("CSSStyleProperties")}} có các thuộc tính tên dấu gạch ngang và tên {{Glossary("camel_case", "camelCase")}} tương ứng cho **tất cả** các [thuộc tính CSS](/en-US/docs/Web/CSS/Reference/Properties) được trình duyệt hỗ trợ (không chỉ những thuộc tính có style nội tuyến). Các thuộc tính không có style nội tuyến tương ứng được đặt thành `""`.

Các thuộc tính CSS viết tắt của phần tử được mở rộng thành các thuộc tính dài tương ứng. Ví dụ, một phần tử với style `"border-top: 1px solid black"` sẽ được biểu diễn trong đối tượng trả về bởi các thuộc tính có tên {{cssxref("border-top")}} và `borderTop`, và các thuộc tính dài tương ứng {{cssxref("border-top-color")}} và `borderTopColor`, {{cssxref("border-top-style")}} và `borderTopStyle`, và {{cssxref("border-top-width")}} và `borderTopWidth`.

Thuộc tính `style` là chỉ đọc, có nghĩa là không thể gán đối tượng {{domxref("CSSStyleProperties")}} cho nó. Tuy nhiên, có thể đặt style nội tuyến bằng cách gán một _chuỗi_ trực tiếp cho thuộc tính. Trong trường hợp này chuỗi có thể được đọc từ {{domxref("CSSStyleDeclaration.cssText","cssText")}}. Sử dụng `style` theo cách này sẽ ghi đè hoàn toàn tất cả style nội tuyến trên phần tử.

Để thêm style cụ thể vào phần tử mà không thay đổi các giá trị style khác, thường nên đặt các thuộc tính riêng lẻ trên đối tượng {{domxref("CSSStyleProperties")}}. Ví dụ, bạn có thể viết `element.style.backgroundColor = "red"`. Một khai báo style được đặt lại bằng cách đặt nó thành `null` hoặc chuỗi rỗng, ví dụ: `element.style.color = null`.

Thuộc tính `style` có cùng mức ưu tiên trong CSS cascade với một khai báo style nội tuyến được đặt qua thuộc tính `style`.

## Ví dụ

### Liệt kê thông tin style

Ví dụ này minh họa cách chúng ta có thể liệt kê các thuộc tính tên dấu gạch ngang của {{domxref("CSSStyleProperties")}}.

#### HTML

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 250 250"
  width="250"
  height="250">
  <circle
    cx="100"
    cy="100"
    r="50"
    id="circle"
    style="fill: red; stroke: black; stroke-width: 2px;" />
</svg>
<pre id="log"></pre>
```

```css hidden
#log {
  height: 70px;
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

Đoạn code sau lặp qua các thuộc tính có thể liệt kê của `CSSStyleProperties` và ghi kết quả.

```js
const element = document.querySelector("circle");
const elementStyle = element.style;

// Loop through all the element's styles using `for...in`
for (const prop in elementStyle) {
  // Check the property belongs to the CSSStyleProperties instance
  // Ensure the property is a numeric index (indicating a dash-named/inline style)
  if (
    Object.hasOwn(elementStyle, prop) &&
    !Number.isNaN(Number.parseInt(prop, 10))
  ) {
    log(
      `${
        elementStyle[prop]
      } = '${elementStyle.getPropertyValue(elementStyle[prop])}'`,
    );
  }
}
```

#### Kết quả

Kết quả hiển thị bên dưới. Lưu ý rằng chỉ các thuộc tính CSS dài của phần tử được liệt kê (thuộc tính viết tắt nội tuyến không được liệt kê).

{{EmbedLiveSample("Enumerating style information", "100", "380")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng thông tin style động](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
- {{domxref("HTMLElement.style")}}
- {{domxref("MathMLElement.style")}}
- {{domxref("SVGElement.attributeStyleMap")}}
