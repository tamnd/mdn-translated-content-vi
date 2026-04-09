---
title: glyph-orientation-vertical
slug: Web/SVG/Reference/Attribute/glyph-orientation-vertical
page-type: svg-attribute
status:
  - deprecated
browser-compat: svg.global_attributes.glyph-orientation-vertical
sidebar: svgref
---

{{Deprecated_Header}}

Thuộc tính **`glyph-orientation-vertical`** ảnh hưởng đến mức độ tiến của vị trí văn bản hiện tại khi mỗi {{Glossary("glyph")}} được hiển thị.

Khi hướng tiến tuyến nội dòng là dọc và `glyph-orientation-vertical` tạo ra một góc định hướng là bội số của 180 độ, vị trí văn bản hiện tại sẽ được tăng theo các chỉ số dọc của glyph. Ngược lại, nếu góc không phải là bội số của 180 độ, vị trí văn bản hiện tại sẽ được tăng theo các chỉ số ngang của glyph.

Thuộc tính này chỉ được áp dụng cho văn bản được viết theo {{SVGAttr("writing-mode")}} dọc.

> [!NOTE]
> Với vai trò là một presentation attribute, `glyph-orientation-vertical` cũng có thuộc tính CSS tương ứng: {{cssxref("glyph-orientation-vertical")}}. Khi cả hai đều được chỉ định, thuộc tính CSS sẽ được ưu tiên.

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
        <code>auto</code> |
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#angle"
            >&#x3C;angle></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>auto</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `auto`
  - : Chữ có độ rộng đầy đủ {{Glossary("ideographic")}} và chữ Latin có độ rộng đầy đủ sẽ được đặt với góc định hướng 0 độ. Dấu câu tượng hình và các ký tự tượng hình khác có dạng ngang và dọc thay thế sẽ dùng dạng dọc của glyph. Văn bản không có độ rộng đầy đủ sẽ được đặt với góc định hướng 90 độ.

    Quy tắc xoay lại này chỉ áp dụng cho văn bản tượng hình ở cấp đầu tiên. Mọi việc lồng thêm chế độ viết hoặc xử lý song hướng sẽ dựa trên phép xoay cấp đầu tiên.

    > [!NOTE]
    > Văn bản được đặt theo cách "xoay" này có thể chứa ligature hoặc các phép ghép và sắp xếp lại glyph khác thường gặp trong ngôn ngữ và chữ viết. (Dạng trình bày này không vô hiệu hóa việc tạo tự động ligature hay các biến thể khác phụ thuộc ngữ cảnh tương tự.)

    Việc xác định ký tự nào nên tự động xoay có thể khác nhau giữa các user agent. Sự xác định này dựa trên sự tương tác phức tạp giữa quốc gia, ngôn ngữ, chữ viết, thuộc tính ký tự, phông chữ và ngữ cảnh ký tự.

- `<angle>`
  - : Giá trị của góc bị giới hạn ở 0, 90, 180, và 270 độ. Nếu chỉ định góc khác, nó sẽ được làm tròn tới giá trị gần nhất trong các giá trị cho phép.
    Giá trị `0deg` cho biết rằng tất cả glyph được đặt với phần đỉnh của glyph hướng về hướng tham chiếu. Giá trị `90deg` cho biết hướng quay 90 độ theo chiều kim đồng hồ từ hướng tham chiếu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
