---
title: text-overflow
slug: Web/SVG/Reference/Attribute/text-overflow
page-type: svg-attribute
browser-compat: svg.global_attributes.text-overflow
sidebar: svgref
---

Thuộc tính SVG **`text-overflow`** chỉ định cách các phần tử khối nội dung văn bản hiển thị khi văn bản tràn ra ngoài các dòng. Điều này có thể xảy ra, ví dụ, khi thuộc tính {{SVGAttr("white-space")}} hoặc thuộc tính CSS {{CSSxref("white-space")}} có giá trị `nowrap`. Thuộc tính này không áp dụng cho văn bản được định dạng sẵn hoặc văn bản nằm trên một đường dẫn.

Trong SVG, `text-overflow` có tác dụng nếu có một vùng ngắt dòng được chỉ định hợp lệ, bất kể giá trị tính toán của thuộc tính {{CSSxref("overflow")}} trên phần tử khối nội dung văn bản là gì. Hiệu ứng này hoàn toàn mang tính trực quan: văn bản bị cắt không bị xóa khỏi DOM, và bất kỳ dấu ba chấm nào, nếu được hiển thị, cũng không tự nó trở thành một phần của DOM. Với mọi phương thức DOM, cứ như thể `text-overflow` không được áp dụng, và vùng ngắt dòng không ràng buộc văn bản.

> [!NOTE]
> Là một thuộc tính trình bày, `text-overflow` cũng có một thuộc tính CSS tương ứng: {{cssxref("text-overflow")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>clip</code> | <code>ellipses</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>clip</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `clip`
  - : Bất kỳ văn bản nào tràn ra ngoài vùng ngắt dòng sẽ bị cắt. Các ký tự có thể bị hiển thị một phần. Đây là giá trị mặc định.
- `ellipsis`
  - : Nếu văn bản cần hiển thị tràn ra ngoài vùng ngắt dòng, văn bản sẽ bị cắt và một dấu ba chấm sẽ được hiển thị sao cho nó vừa trong vùng đã cho.

Để biết thêm thông tin, hãy tham khảo thuộc tính CSS [`text-overflow`](/en-US/docs/Web/CSS/Reference/Properties/text-overflow#values).

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính CSS {{cssxref("text-overflow")}}
