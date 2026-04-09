---
title: startOffset
slug: Web/SVG/Reference/Attribute/startOffset
page-type: svg-attribute
browser-compat: svg.elements.textPath.startOffset
sidebar: svgref
---

Thuộc tính **`startOffset`** xác định một độ lệch từ đầu đường dẫn cho vị trí văn bản hiện tại ban đầu dọc theo đường dẫn sau khi chuyển đường dẫn sang hệ tọa độ của phần tử {{SVGElement("textPath")}}.

Bạn có thể dùng thuộc tính này với phần tử SVG sau:

- {{SVGElement("textPath")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 220 100" xmlns="http://www.w3.org/2000/svg">
  <path
    id="path1"
    fill="none"
    stroke="red"
    d="M10,90 Q90,90 90,45 Q90,10 50,10 Q10,10 10,40 Q10,70 45,70 Q70,70 75,50" />
  <path
    id="path2"
    fill="none"
    stroke="red"
    d="M130,90 Q210,90 210,45 Q210,10 170,10 Q130,10 130,40 Q130,70 165,70 Q190,70 195,50" />

  <text>
    <textPath href="#path1" startOffset="0">
      Quick brown fox jumps over the lazy dog.
    </textPath>
  </text>

  <text>
    <textPath href="#path2" startOffset="40">
      Quick brown fox jumps over the lazy dog.
    </textPath>
  </text>
</svg>
```

{{EmbedLiveSample("Example", 400, 200)}}

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
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<length-percentage>`
  - : Một độ dài biểu diễn khoảng cách dọc theo đường dẫn được đo trong hệ tọa độ người dùng hiện tại cho phần tử {{SVGElement("textPath")}}.

    Nếu cung cấp phần trăm, thì độ lệch bắt đầu biểu thị một khoảng cách phần trăm dọc theo toàn bộ đường dẫn. Vì vậy, `0%` chỉ điểm bắt đầu của đường dẫn và `100%` chỉ điểm kết thúc của đường dẫn.

- `<number>`
  - : Giá trị này biểu thị một khoảng cách dọc theo đường dẫn được đo trong hệ tọa độ người dùng hiện tại cho phần tử `<textPath>`.

> [!NOTE]
> Các giá trị âm và các giá trị lớn hơn chiều dài đường dẫn, chẳng hạn `150%`, đều được phép.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
