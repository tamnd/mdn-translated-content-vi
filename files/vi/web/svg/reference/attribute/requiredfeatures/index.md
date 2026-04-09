---
title: requiredFeatures
slug: Web/SVG/Reference/Attribute/requiredFeatures
page-type: svg-attribute
status:
  - deprecated
browser-compat: svg.global_attributes.requiredFeatures
sidebar: svgref
---

{{Deprecated_Header}}

Thuộc tính **`requiredFeatures`** nhận một danh sách các chuỗi tính năng, với từng chuỗi được ngăn cách bằng khoảng trắng. Nó xác định liệu tất cả các tính năng được nêu có được trình duyệt hỗ trợ hay không; nếu tất cả đều được hỗ trợ, thuộc tính sẽ đánh giá thành `true` và phần tử sẽ được hiển thị; ngược lại, thuộc tính sẽ đánh giá thành `false` và phần tử hiện tại cùng các phần tử con của nó sẽ bị bỏ qua, do đó sẽ không được hiển thị. Điều này cung cấp một cách để thiết kế SVG có thể tự động hạ cấp một cách mềm dẻo khi tính năng không có sẵn.

Nếu thuộc tính không hiện diện, giá trị đánh giá ngầm định của nó là `true`. Nếu giá trị của `requiredFeatures` là chuỗi null hoặc chuỗi rỗng, thuộc tính sẽ đánh giá thành `false`.

`requiredFeatures` thường được dùng cùng với phần tử {{SVGElement("switch")}}. Nếu `requiredFeatures` được dùng trong các tình huống khác, nó biểu thị một công tắc đơn giản trên phần tử đó để quyết định có hiển thị phần tử hay không.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("a")}}
- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("circle")}}
- {{SVGElement("clipPath")}}
- {{SVGElement("defs")}}
- {{SVGElement("ellipse")}}
- {{SVGElement("foreignObject")}}
- {{SVGElement("g")}}
- {{SVGElement("image")}}
- {{SVGElement("line")}}
- {{SVGElement("mask")}}
- {{SVGElement("path")}}
- {{SVGElement("pattern")}}
- {{SVGElement("polygon")}}
- {{SVGElement("polyline")}}
- {{SVGElement("rect")}}
- {{SVGElement("set")}}
- {{SVGElement("svg")}}
- {{SVGElement("switch")}}
- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}
- {{SVGElement("use")}}

## Example

```css hidden
html,
body,
svg {
  height: 100%;
}

text {
  fill: white;
}
```

```html
<svg viewBox="0 0 250 45" xmlns="http://www.w3.org/2000/svg">
  <g>
    <rect fill="forestgreen" x="10" y="10" height="25" width="230" />
    <text x="20" y="27">requiredFeatures supported</text>
  </g>
  <g requiredFeatures="">
    <rect fill="crimson" x="10" y="10" height="25" width="230" />
    <text x="20" y="27">requiredFeatures not supported</text>
  </g>
</svg>
```

{{EmbedLiveSample("Example", "250", "100")}}

## Usage notes

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Value</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#list-of-ts"
            >&#x3C;list-of-features></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Default value</th>
      <td>
        <code>true</code> if not defined, <code>false</code> if null or empty
        string as value
      </td>
    </tr>
    <tr>
      <th scope="row">Animatable</th>
      <td>No</td>
    </tr>
  </tbody>
</table>

- `<list-of-features>`
  - : Đây là danh sách các chuỗi tính năng, được phân tách bằng khoảng trắng. Xác định liệu tất cả các _tính năng_ được nêu có được trình duyệt hỗ trợ hay không. Xem [Feature strings](#feature_strings) bên dưới để biết danh sách các giá trị được phép.

## Feature strings

Dưới đây là các chuỗi tính năng cho thuộc tính `requiredFeatures`. Các chuỗi này cũng áp dụng cho lệnh gọi phương thức [`hasFeature`](/en-US/docs/Web/API/DOMImplementation/hasFeature), vốn là một phần trong khả năng hỗ trợ SVG DOM của giao diện {{domxref("DOMImplementation")}}. Trong một số trường hợp, các chuỗi tính năng ánh xạ trực tiếp tới một nhóm thuộc tính, thuộc tính hay phần tử; trong các trường hợp khác, chúng biểu thị một số chức năng của trình duyệt. Lưu ý rằng định dạng và cách đặt tên của các chuỗi tính năng đã thay đổi từ SVG 1.0 sang SVG 1.1. Các chuỗi tính năng của SVG 1.0 không được liệt kê ở đây; một số trình duyệt vẫn hỗ trợ chúng vì lý do tương thích. Tuy nhiên, các chuỗi tính năng SVG 1.0 được xem là không dùng nữa.

- `http://www.w3.org/TR/SVG11/feature#SVG`
  - : Ít nhất một trong các tính năng sau được hỗ trợ:
    - `http://www.w3.org/TR/SVG11/feature#SVG-static`
    - `http://www.w3.org/TR/SVG11/feature#SVG-animation`
    - `http://www.w3.org/TR/SVG11/feature#SVG-dynamic`
    - `http://www.w3.org/TR/SVG11/feature#SVGDOM`

- `http://www.w3.org/TR/SVG11/feature#SVGDOM`
  - : Ít nhất một trong các tính năng sau được hỗ trợ:
    - `http://www.w3.org/TR/SVG11/feature#SVGDOM-static`
    - `http://www.w3.org/TR/SVG11/feature#SVGDOM-animation`
    - `http://www.w3.org/TR/SVG11/feature#SVGDOM-dynamic`

- `http://www.w3.org/TR/SVG11/feature#SVG-static`
  - : Trình duyệt hỗ trợ tất cả các tính năng sau:
    - `http://www.w3.org/TR/SVG11/feature#CoreAttribute`
    - `http://www.w3.org/TR/SVG11/feature#Structure`
    - `http://www.w3.org/TR/SVG11/feature#ContainerAttribute`
    - `http://www.w3.org/TR/SVG11/feature#ConditionalProcessing`
    - `http://www.w3.org/TR/SVG11/feature#Image`
    - `http://www.w3.org/TR/SVG11/feature#Style`
    - `http://www.w3.org/TR/SVG11/feature#ViewportAttribute`
    - `http://www.w3.org/TR/SVG11/feature#Shape`
    - `http://www.w3.org/TR/SVG11/feature#Text`
    - `http://www.w3.org/TR/SVG11/feature#PaintAttribute`
    - `http://www.w3.org/TR/SVG11/feature#OpacityAttribute`
    - `http://www.w3.org/TR/SVG11/feature#GraphicsAttribute`
    - `http://www.w3.org/TR/SVG11/feature#Marker`
    - `http://www.w3.org/TR/SVG11/feature#ColorProfile`
    - `http://www.w3.org/TR/SVG11/feature#Gradient`
    - `http://www.w3.org/TR/SVG11/feature#Pattern`
    - `http://www.w3.org/TR/SVG11/feature#Clip`
    - `http://www.w3.org/TR/SVG11/feature#Mask`
    - `http://www.w3.org/TR/SVG11/feature#Filter`
    - `http://www.w3.org/TR/SVG11/feature#XlinkAttribute`
    - `http://www.w3.org/TR/SVG11/feature#Font`
    - `http://www.w3.org/TR/SVG11/feature#Extensibility`

- `http://www.w3.org/TR/SVG11/feature#SVGDOM-static`
  - : Trình duyệt hỗ trợ tất cả các giao diện và phương thức DOM tương ứng với các tính năng ngôn ngữ cho `http://www.w3.org/TR/SVG11/feature#SVG-static`.
- `http://www.w3.org/TR/SVG11/feature#SVG-animation`
  - : Trình duyệt hỗ trợ tất cả các tính năng ngôn ngữ từ `http://www.w3.org/TR/SVG11/feature#SVG-static` cộng với tính năng `http://www.w3.org/TR/SVG11/feature#Animation`.
- `http://www.w3.org/TR/SVG11/feature#SVGDOM-animation`
  - : Trình duyệt hỗ trợ tất cả các giao diện và phương thức DOM tương ứng với các tính năng ngôn ngữ cho `http://www.w3.org/TR/SVG11/feature#SVG-animation`.
- `http://www.w3.org/TR/SVG11/feature#SVG-dynamic`
  - : Trình duyệt hỗ trợ tất cả các tính năng ngôn ngữ từ `http://www.w3.org/TR/SVG11/feature#SVG-animation` cộng với các tính năng sau:
    - `http://www.w3.org/TR/SVG11/feature#Hyperlinking`
    - `http://www.w3.org/TR/SVG11/feature#Scripting`
    - `http://www.w3.org/TR/SVG11/feature#View`
    - `http://www.w3.org/TR/SVG11/feature#Cursor`
    - `http://www.w3.org/TR/SVG11/feature#GraphicalEventsAttribute`
    - `http://www.w3.org/TR/SVG11/feature#DocumentEventsAttribute`
    - `http://www.w3.org/TR/SVG11/feature#AnimationEventsAttribute`

- `http://www.w3.org/TR/SVG11/feature#SVGDOM-dynamic`
  - : Trình duyệt hỗ trợ tất cả các giao diện và phương thức DOM tương ứng với các tính năng ngôn ngữ cho `http://www.w3.org/TR/SVG11/feature#SVG-dynamic`.
- `http://www.w3.org/TR/SVG11/feature#CoreAttribute`
  - : Trình duyệt hỗ trợ các thuộc tính {{SVGAttr("id")}}, {{SVGAttr("xml:lang")}} và {{SVGAttr("xml:space")}}
- `http://www.w3.org/TR/SVG11/feature#Structure`
  - : Trình duyệt hỗ trợ các phần tử {{SVGElement("svg")}}, {{SVGElement("g")}}, {{SVGElement("defs")}}, {{SVGElement("desc")}}, {{SVGElement("title")}}, {{SVGElement("metadata")}}, {{SVGElement("symbol")}} và {{SVGElement("use")}}.
- `http://www.w3.org/TR/SVG11/feature#BasicStructure`
  - : Trình duyệt hỗ trợ các phần tử {{SVGElement("svg")}}, {{SVGElement("g")}}, {{SVGElement("defs")}}, {{SVGElement("desc")}}, {{SVGElement("title")}}, {{SVGElement("metadata")}} và {{SVGElement("use")}}.
- `http://www.w3.org/TR/SVG11/feature#ContainerAttribute`
  - : Trình duyệt hỗ trợ thuộc tính `enable-background`
- `http://www.w3.org/TR/SVG11/feature#ConditionalProcessing`
  - : Trình duyệt hỗ trợ phần tử {{SVGElement("switch")}} và các thuộc tính `requiredFeatures`, {{SVGAttr("requiredExtensions")}}, {{SVGAttr("systemLanguage")}}
- `http://www.w3.org/TR/SVG11/feature#Image`
  - : Trình duyệt hỗ trợ phần tử {{SVGElement("image")}}.
- `http://www.w3.org/TR/SVG11/feature#Style`
  - : Trình duyệt hỗ trợ phần tử {{SVGElement("style")}}.
- `http://www.w3.org/TR/SVG11/feature#ViewportAttribute`
  - : Trình duyệt hỗ trợ các thuộc tính {{SVGAttr("clip")}} và {{SVGAttr("overflow")}}.
- `http://www.w3.org/TR/SVG11/feature#Shape`
  - : Trình duyệt hỗ trợ các phần tử {{SVGElement("rect")}}, {{SVGElement("circle")}}, {{SVGElement("line")}}, {{SVGElement("polyline")}}, {{SVGElement("polygon")}}, {{SVGElement("ellipse")}} và {{SVGElement("path")}}.
- `http://www.w3.org/TR/SVG11/feature#Text`
  - : Trình duyệt hỗ trợ các phần tử {{SVGElement("text")}}, {{SVGElement("tspan")}}, `<tref>`, {{SVGElement("textPath")}}, và `<glyphRef>`.
- `http://www.w3.org/TR/SVG11/feature#BasicText`
  - : Trình duyệt hỗ trợ phần tử {{SVGElement("text")}}
- `http://www.w3.org/TR/SVG11/feature#PaintAttribute`
  - : Trình duyệt hỗ trợ các thuộc tính {{SVGAttr("color")}}, {{SVGAttr("fill")}}, {{SVGAttr("fill-rule")}}, {{SVGAttr("stroke")}}, {{SVGAttr("stroke-dasharray")}}, {{SVGAttr("stroke-dashoffset")}}, {{SVGAttr("stroke-linecap")}}, {{SVGAttr("stroke-linejoin")}}, {{SVGAttr("stroke-miterlimit")}}, {{SVGAttr("stroke-width")}}, {{SVGAttr("color-interpolation")}} và `color-rendering`
- `http://www.w3.org/TR/SVG11/feature#BasicPaintAttribute`
  - : Trình duyệt hỗ trợ các thuộc tính {{SVGAttr("color")}}, {{SVGAttr("fill")}}, {{SVGAttr("fill-rule")}}, {{SVGAttr("stroke")}}, {{SVGAttr("stroke-dasharray")}}, {{SVGAttr("stroke-dashoffset")}}, {{SVGAttr("stroke-linecap")}}, {{SVGAttr("stroke-linejoin")}}, {{SVGAttr("stroke-miterlimit")}}, {{SVGAttr("stroke-width")}} và `color-rendering`
- `http://www.w3.org/TR/SVG11/feature#OpacityAttribute`
  - : Trình duyệt hỗ trợ các thuộc tính {{SVGAttr("opacity")}}, {{SVGAttr("stroke-opacity")}} và {{SVGAttr("fill-opacity")}}
- `http://www.w3.org/TR/SVG11/feature#GraphicsAttribute`
  - : Trình duyệt hỗ trợ các thuộc tính {{SVGAttr("display")}}, {{SVGAttr("image-rendering")}}, {{SVGAttr("pointer-events")}}, {{SVGAttr("shape-rendering")}}, {{SVGAttr("text-rendering")}} và {{SVGAttr("visibility")}}
- `http://www.w3.org/TR/SVG11/feature#BasicGraphicsAttribute`
  - : Trình duyệt hỗ trợ các thuộc tính {{SVGAttr("display")}} và {{SVGAttr("visibility")}}
- `http://www.w3.org/TR/SVG11/feature#Marker`
  - : Trình duyệt hỗ trợ phần tử {{SVGElement("marker")}}
- `http://www.w3.org/TR/SVG11/feature#Gradient`
  - : Trình duyệt hỗ trợ các phần tử {{SVGElement("linearGradient")}}, {{SVGElement("radialGradient")}} và {{SVGElement("stop")}}
- `http://www.w3.org/TR/SVG11/feature#Pattern`
  - : Trình duyệt hỗ trợ phần tử {{SVGElement("pattern")}}
- `http://www.w3.org/TR/SVG11/feature#Clip`
  - : Trình duyệt hỗ trợ phần tử {{SVGElement("clipPath")}} và các thuộc tính {{SVGAttr("clip-path")}}, {{SVGAttr("clip-rule")}}
- `http://www.w3.org/TR/SVG11/feature#BasicClip`
  - : Trình duyệt hỗ trợ phần tử {{SVGElement("clipPath")}} và thuộc tính {{SVGAttr("clip-path")}}
- `http://www.w3.org/TR/SVG11/feature#Mask`
  - : Trình duyệt hỗ trợ phần tử {{SVGElement("mask")}}
- `http://www.w3.org/TR/SVG11/feature#Filter`
  - : Trình duyệt hỗ trợ các phần tử {{SVGElement("filter")}}, {{SVGElement("feBlend")}}, {{SVGElement("feColorMatrix")}}, {{SVGElement("feComponentTransfer")}}, {{SVGElement("feComposite")}}, {{SVGElement("feConvolveMatrix")}}, {{SVGElement("feDiffuseLighting")}}, {{SVGElement("feDisplacementMap")}}, {{SVGElement("feFlood")}}, {{SVGElement("feGaussianBlur")}}, {{SVGElement("feImage")}}, {{SVGElement("feMerge")}}, {{SVGElement("feMergeNode")}}, {{SVGElement("feMorphology")}}, {{SVGElement("feOffset")}}, {{SVGElement("feSpecularLighting")}}, {{SVGElement("feTile")}}, {{SVGElement("feDistantLight")}}, {{SVGElement("fePointLight")}}, {{SVGElement("feSpotLight")}}, {{SVGElement("feFuncR")}}, {{SVGElement("feFuncG")}}, {{SVGElement("feFuncB")}} và {{SVGElement("feFuncA")}}
- `http://www.w3.org/TR/SVG11/feature#BasicFilter`
  - : Trình duyệt hỗ trợ các phần tử {{SVGElement("filter")}}, {{SVGElement("feBlend")}}, {{SVGElement("feColorMatrix")}}, {{SVGElement("feComponentTransfer")}}, {{SVGElement("feComposite")}}, {{SVGElement("feFlood")}}, {{SVGElement("feGaussianBlur")}}, {{SVGElement("feImage")}}, {{SVGElement("feMerge")}}, {{SVGElement("feMergeNode")}}, {{SVGElement("feOffset")}}, {{SVGElement("feTile")}}, {{SVGElement("feFuncR")}}, {{SVGElement("feFuncG")}}, {{SVGElement("feFuncB")}} và {{SVGElement("feFuncA")}}
- `http://www.w3.org/TR/SVG11/feature#DocumentEventsAttribute`
  - : Trình duyệt hỗ trợ các thuộc tính sự kiện `onunload`, `onabort`, `onerror`, `onresize`, `onscroll` và `onzoom` [event attributes](/en-US/docs/Web/SVG/Reference/Attribute#event_attributes)
- `http://www.w3.org/TR/SVG11/feature#GraphicalEventsAttribute`
  - : Trình duyệt hỗ trợ các thuộc tính sự kiện `onfocusin`, `onfocusout`, `onactivate`, `onclick`, `onmousedown`, `onmouseup`, `onmouseover`, `onmousemove`, `onmouseout` và `onload` [event attributes](/en-US/docs/Web/SVG/Reference/Attribute#event_attributes)
- `http://www.w3.org/TR/SVG11/feature#AnimationEventsAttribute`
  - : Trình duyệt hỗ trợ các thuộc tính sự kiện `onbegin`, `onend`, `onrepeat` và `onload` [event attributes](/en-US/docs/Web/SVG/Reference/Attribute#event_attributes)

