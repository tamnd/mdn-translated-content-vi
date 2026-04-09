---
title: word-spacing
slug: Web/SVG/Reference/Attribute/word-spacing
page-type: svg-attribute
browser-compat: svg.global_attributes.word-spacing
sidebar: svgref
---

Thuộc tính **`word-spacing`** chỉ định hành vi khoảng cách giữa các từ.

Nếu một {{cssxref("length")}} được cung cấp mà không có định danh đơn vị (ví dụ, một số không kèm đơn vị như 128), trình duyệt sẽ xử lý \<length> đó như một giá trị chiều rộng trong hệ tọa độ người dùng hiện tại.

Nếu một \<length> được cung cấp với một trong các định danh đơn vị (ví dụ, .25em hoặc 1%), thì trình duyệt sẽ chuyển đổi \<length> đó thành một giá trị tương ứng trong hệ tọa độ người dùng hiện tại.

> [!NOTE]
> Là một thuộc tính trình bày, `word-spacing` cũng có một thuộc tính CSS tương ứng: {{cssxref("word-spacing")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

## Phần tử

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("text")}}
- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>normal</code> | {{cssxref("length")}}</td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>normal</code></td>
    </tr>
  </tbody>
</table>

Để có mô tả về các giá trị, vui lòng tham khảo thuộc tính [CSS `letter-spacing`](/en-US/docs/Web/CSS/Reference/Properties/letter-spacing#values).

## Ví dụ

Ví dụ này bao gồm hai phần tử {{SVGElement("text")}} với các giá trị `word-spacing` khác nhau.

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 250 50" xmlns="http://www.w3.org/2000/svg">
  <text y="20" word-spacing="4">Khoảng cách giữa các từ lớn hơn</text>
  <text x="0" y="40" word-spacing="-0.5">Khoảng cách giữa các từ nhỏ hơn</text>
</svg>
```

{{EmbedLiveSample("Examples", "250", "100")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("word-spacing")}}
