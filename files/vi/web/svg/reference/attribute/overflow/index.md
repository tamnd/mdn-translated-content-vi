---
title: overflow
slug: Web/SVG/Reference/Attribute/overflow
page-type: svg-attribute
browser-compat: svg.global_attributes.overflow
sidebar: svgref
---

Thuộc tính **`overflow`** đặt cách xử lý khi nội dung của một phần tử quá lớn để vừa trong block formatting context của nó. **Tính năng này hiện vẫn chưa được triển khai rộng rãi**.

Thuộc tính này có cùng giá trị tham số và ý nghĩa như thuộc tính CSS {{cssxref("overflow")}}, tuy nhiên, các điểm bổ sung sau đây được áp dụng:

- Nếu có giá trị `visible`, thuộc tính này không có tác dụng (tức là không tạo hình chữ nhật cắt).
- Nếu thuộc tính `overflow` có giá trị `hidden` hoặc `scroll`, một phép cắt với kích thước chính xác của SVG viewport sẽ được áp dụng.
- Khi `scroll` được chỉ định trên phần tử {{SVGElement("svg")}}, một thanh cuộn hoặc bộ pan thường sẽ được hiển thị cho SVG viewport bất kể nội dung của nó có bị cắt hay không.
- Trong nội dung SVG, giá trị `auto` ngụ ý rằng mọi nội dung được hiển thị cho các phần tử con phải nhìn thấy được, hoặc thông qua cơ chế cuộn, hoặc bằng cách kết xuất không có clip.

> [!NOTE]
> Mặc dù giá trị ban đầu của overflow là `auto`, nó bị ghi đè trong stylesheet của User Agent cho phần tử {{SVGElement("svg")}} khi nó không phải là phần tử gốc của một tài liệu độc lập, phần tử {{SVGElement("pattern")}}, và phần tử {{SVGElement("marker")}} để mặc định bị ẩn.

> [!NOTE]
> Với vai trò là một presentation attribute, `overflow` cũng có thuộc tính CSS tương ứng: {{cssxref("overflow")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("foreignObject")}}
- {{SVGElement("image")}}
- {{SVGElement("marker")}}
- {{SVGElement("pattern")}}
- {{SVGElement("symbol")}}
- {{SVGElement("svg")}}
- {{SVGElement("text")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 200 30" xmlns="http://www.w3.org/2000/svg" overflow="auto">
  <text y="20">
    Văn bản này rộng hơn SVG, vì vậy nên có một thanh cuộn được hiển thị.
  </text>
</svg>
```

{{EmbedLiveSample("Example", "200", "50")}}

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code>visible</code> | <code>hidden</code> | <code>scroll</code> |
        <code>auto</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>visible</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

Để biết mô tả về các giá trị, vui lòng xem thuộc tính CSS {{cssxref("overflow")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("overflow")}}
