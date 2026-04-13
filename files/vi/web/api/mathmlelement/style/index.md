---
title: "MathMLElement: thuộc tính style"
short-title: style
slug: Web/API/MathMLElement/style
page-type: web-api-instance-property
browser-compat: api.MathMLElement.style
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`style`** của giao diện {{domxref("MathMLElement")}} trả về kiểu [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) _nội tuyến_ của phần tử dưới dạng đối tượng {{domxref("CSSStyleProperties")}} trực tiếp. Đối tượng này có thể được sử dụng để lấy và đặt các kiểu nội tuyến của phần tử.

## Giá trị

Một đối tượng {{domxref("CSSStyleProperties")}} trực tiếp.

> [!NOTE]
> Các phiên bản trước của thông số kỹ thuật trả về {{domxref("CSSStyleDeclaration")}} (từ đó {{domxref("CSSStyleProperties")}} được kế thừa). Xem bảng [tương thích trình duyệt](#browser_compatibility) để biết thông tin hỗ trợ của trình duyệt.

Mặc dù thuộc tính `style` tự nó là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSStyleProperties`, bạn vẫn có thể gán cho thuộc tính `style` trực tiếp, điều này tương đương với việc gán cho thuộc tính {{domxref("CSSStyleDeclaration/cssText", "cssText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `CSSStyleProperties` bằng các phương thức {{domxref("CSSStyleDeclaration/setProperty", "setProperty()")}} và {{domxref("CSSStyleDeclaration/removeProperty", "removeProperty()")}}.

## Mô tả

Các giá trị của các kiểu nội tuyến được đặt trong thuộc tính [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) của phần tử được phản ánh bởi các thuộc tính tương ứng của đối tượng {{domxref("CSSStyleProperties")}} được trả về.

> [!NOTE]
> {{domxref("CSSStyleProperties")}} có các thuộc tính tên có gạch nối và tên {{Glossary("camel_case", "camelCase")}} tương ứng cho **tất cả** [thuộc tính CSS](/en-US/docs/Web/CSS/Reference/Properties) được trình duyệt hỗ trợ (không chỉ những thuộc tính có kiểu nội tuyến). Các thuộc tính không có kiểu nội tuyến tương ứng được đặt thành `""`.

Các thuộc tính CSS viết tắt của phần tử được mở rộng thành các thuộc tính dài tương ứng.

Thuộc tính `style` là chỉ đọc, nghĩa là không thể gán đối tượng {{domxref("CSSStyleProperties")}} cho nó. Tuy nhiên, có thể đặt kiểu nội tuyến bằng cách gán _chuỗi_ trực tiếp cho thuộc tính. Trong trường hợp này, chuỗi có thể được đọc từ {{domxref("CSSStyleDeclaration.cssText","cssText")}}. Sử dụng `style` theo cách này sẽ ghi đè hoàn toàn tất cả các kiểu nội tuyến trên phần tử.

Để thêm các kiểu cụ thể vào phần tử mà không làm thay đổi các giá trị kiểu khác, thông thường tốt hơn là đặt các thuộc tính riêng lẻ trên đối tượng {{domxref("CSSStyleProperties")}}. Ví dụ, bạn có thể viết `element.style.backgroundColor = "red"`. Khai báo kiểu được đặt lại bằng cách đặt nó thành `null` hoặc chuỗi rỗng, ví dụ: `element.style.color = null`.

## Ví dụ

### Liệt kê thông tin kiểu

Ví dụ này minh họa cách chúng ta có thể liệt kê các thuộc tính tên có gạch nối của {{domxref("CSSStyleProperties")}}.

#### HTML

```html
<math>
  <mrow>
    <mi>f</mi>
    <mo stretchy="false">(</mo>
    <mi class="parameter" style="color: red; border-bottom: 1px solid">x</mi>
    <mo stretchy="false">)</mo>
    <mo>=</mo>
    <mi>x</mi>
  </mrow>
</math>
<pre id="log"></pre>
```

```css hidden
#log {
  height: 80px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

Đoạn mã sau lặp lại các thuộc tính có thể liệt kê của `CSSStyleProperties` và ghi lại kết quả.

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const element = document.querySelector(".parameter");
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

Kết quả được hiển thị bên dưới. Lưu ý rằng chỉ các thuộc tính CSS dài của phần tử mới là các giá trị có thể liệt kê (thuộc tính viết tắt nội tuyến không được liệt kê).

{{EmbedLiveSample("Enumerating style information", "100", "150")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng thông tin kiểu động](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
- {{domxref("HTMLElement.style")}}
- {{domxref("SVGElement.style")}}
- {{domxref("MathMLElement.attributeStyleMap")}}
