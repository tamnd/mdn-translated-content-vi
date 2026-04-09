---
title: glyph-orientation-horizontal
slug: Web/SVG/Reference/Attribute/glyph-orientation-horizontal
page-type: svg-attribute
status:
  - deprecated
browser-compat: svg.global_attributes.glyph-orientation-horizontal
sidebar: svgref
---

{{Deprecated_Header}}

Thuộc tính **`glyph-orientation-horizontal`** ảnh hưởng đến mức độ tiến của vị trí văn bản hiện tại khi mỗi {{Glossary("glyph")}} được hiển thị.

Khi hướng tham chiếu là ngang và `glyph-orientation-horizontal` tạo ra một góc định hướng là bội số của 180 độ, vị trí văn bản hiện tại sẽ được tăng theo các chỉ số ngang của glyph. Ngược lại, nếu giá trị của thuộc tính này không phải là bội số của 180 độ, vị trí văn bản hiện tại sẽ được tăng theo các chỉ số dọc của glyph.

Thuộc tính này chỉ được áp dụng cho văn bản được viết theo {{SVGAttr("writing-mode")}} ngang.

> [!NOTE]
> Với vai trò là một presentation attribute, `glyph-orientation-horizontal` cũng có thuộc tính CSS tương ứng: {{cssxref("glyph-orientation-horizontal")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("textPath")}}
- {{SVGElement("text")}}
- {{SVGElement("tspan")}}

## Lưu ý ngữ cảnh

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#angle"
            >&#x3C;angle></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0deg</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `<angle>`
  - : Giá trị của góc bị giới hạn ở 0, 90, 180, và 270 độ. Nếu chỉ định góc khác, nó sẽ được làm tròn tới giá trị gần nhất trong các giá trị cho phép.
    Giá trị `0deg` cho biết rằng tất cả glyph được đặt với phần đỉnh của glyph hướng về hướng tham chiếu. Giá trị `90deg` cho biết hướng quay 90 độ theo chiều kim đồng hồ từ hướng tham chiếu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
