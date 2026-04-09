---
title: textLength
slug: Web/SVG/Reference/Attribute/textLength
page-type: svg-attribute
browser-compat:
  - svg.elements.text.textLength
  - svg.elements.textPath.textLength
  - svg.elements.tspan.textLength
sidebar: svgref
---

Thuộc tính **`textLength`**, có trên các phần tử SVG {{SVGElement("text")}} và {{SVGElement("tspan")}}, cho phép bạn chỉ định chiều rộng của không gian mà văn bản sẽ được vẽ vào. {{glossary("user agent")}} sẽ đảm bảo văn bản không kéo dài quá khoảng cách đó, bằng cách dùng phương thức hoặc các phương thức được chỉ định bởi thuộc tính {{SVGAttr("lengthAdjust")}}. Theo mặc định, chỉ khoảng cách giữa các ký tự được điều chỉnh, nhưng kích thước glyph cũng có thể được điều chỉnh nếu bạn thay đổi `lengthAdjust`.

Bằng cách dùng `textLength`, bạn có thể đảm bảo văn bản SVG của mình hiển thị cùng một chiều rộng bất kể các điều kiện như web font không tải được (hoặc chưa tải xong).

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 200 60" xmlns="http://www.w3.org/2000/svg">
  <text y="20" textLength="6em">Small text length</text>
  <text y="40" textLength="120%">Big text length</text>
</svg>
```

{{EmbedLiveSample("Example", "200", "100")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        {{cssxref("length-percentage")}} |
        {{cssxref("number")}}
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td>None</td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<length-percentage>`
  - : Giá trị này chỉ định chiều rộng của không gian mà văn bản sẽ được điều chỉnh để chiếm, dưới dạng độ dài tuyệt đối hoặc phần trăm.
- `<number>`
  - : Một giá trị số biểu thị một độ dài, tham chiếu đến các đơn vị của hệ tọa độ hiện tại.

## Ví dụ tương tác

Ví dụ này trình bày văn bản mà bạn có thể thay đổi kích thước bằng một phần tử {{HTMLElement("input")}} kiểu [`"range"`](/en-US/docs/Web/HTML/Reference/Elements/input/range).

### CSS

```css
.controls {
  font:
    16px "Open Sans",
    "Arial",
    sans-serif;
}
```

### SVG

Hãy bắt đầu với SVG. Nó khá cơ bản, với một không gian 1000 x 300 pixel được ánh xạ vào một khung 10 cm x 3 cm.

```html
<svg
  width="10cm"
  height="3cm"
  viewBox="0 0 1000 300"
  xmlns="http://www.w3.org/2000/svg">
  <rect
    x="1"
    y="1"
    width="998"
    height="298"
    fill="none"
    stroke="green"
    stroke-width="2" />

  <text
    id="hello"
    x="10"
    y="150"
    font-family="sans-serif"
    font-size="60"
    fill="green">
    Hello world!
  </text>
</svg>
```

Trước tiên, một phần tử {{SVGElement("rect")}} được dùng để tạo và tô viền một hình chữ nhật bao quanh văn bản. Sau đó {{SVGElement("text")}} được dùng để tạo chính phần tử văn bản, với {{SVGAttr("id")}} là `"hello"`.

### HTML

HTML bao gồm hai phần tử hiển thị được đặt trong một {{HTMLElement("div")}} nhóm:

```html
<div class="controls">
  <input type="range" id="widthSlider" min="80" max="978" />
  <span id="widthDisplay"></span>
</div>
```

Phần tử {{HTMLElement("input")}}, kiểu `"range"`, được dùng để tạo bộ điều khiển trượt mà người dùng sẽ thao tác để thay đổi chiều rộng của văn bản. Một phần tử {{HTMLElement("span")}} có ID `"widthDisplay"` được cung cấp để hiển thị giá trị chiều rộng hiện tại.

### JavaScript

Cuối cùng, hãy xem mã JavaScript. Nó bắt đầu bằng việc lưu tham chiếu tới các phần tử mà nó sẽ cần truy cập, dùng {{domxref("Document.getElementById()")}}:

```js
const widthSlider = document.getElementById("widthSlider");
const widthDisplay = document.getElementById("widthDisplay");
const textElement = document.getElementById("hello");
const baseLength = Math.floor(textElement.textLength.baseVal.value);

widthSlider.value = baseLength;

widthSlider.addEventListener("input", (event) => {
  textElement.textLength.baseVal.newValueSpecifiedUnits(
    SVGLength.SVG_LENGTHTYPE_PX,
    widthSlider.valueAsNumber,
  );
  widthDisplay.innerText = widthSlider.value;
});

widthSlider.dispatchEvent(new Event("input"));
```

Sau khi lấy các tham chiếu phần tử, một trình nghe sự kiện được thiết lập bằng cách gọi {{domxref("EventTarget.addEventListener", "addEventListener()")}} trên bộ điều khiển trượt để nhận mọi sự kiện {{domxref("Element/input_event", "input")}} xảy ra. Những sự kiện này sẽ được gửi mỗi khi giá trị của thanh trượt thay đổi, kể cả khi người dùng chưa dừng thao tác, vì vậy chúng ta có thể điều chỉnh chiều rộng văn bản một cách phản hồi.

Khi một sự kiện `"input"` xảy ra, chúng ta gọi `newValueSpecifiedUnits()` để đặt giá trị của `textLength` thành giá trị mới của thanh trượt, dùng kiểu đơn vị `SVG_LENGTHTYPE_PX` của giao diện `SVGLength` để chỉ ra rằng giá trị đó biểu thị pixel. Lưu ý rằng chúng ta phải đi vào `textLength` để lấy thuộc tính `baseVal` của nó; `textLength` được lưu dưới dạng đối tượng {{domxref("SVGLength")}}, nên chúng ta không thể xem nó như một số thuần.

Sau khi cập nhật chiều rộng văn bản, nội dung của hộp `widthDisplay` cũng được cập nhật theo giá trị mới, và chúng ta hoàn tất.

### Kết quả

Đây là cách ví dụ trông như thế nào. Hãy thử kéo thanh trượt để cảm nhận nó hoạt động ra sao.

{{EmbedLiveSample("Interactive_example", 650, 160)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn SVG: [Texts](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Texts)
- {{domxref("SVGAnimatedLength")}} và {{domxref("SVGLength")}}
- {{SVGElement("text")}}
