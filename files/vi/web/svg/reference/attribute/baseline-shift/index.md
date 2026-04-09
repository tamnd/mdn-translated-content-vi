---
title: baseline-shift
slug: Web/SVG/Reference/Attribute/baseline-shift
page-type: svg-attribute
browser-compat: svg.global_attributes.baseline-shift
sidebar: svgref
---

**`baseline-shift`** cho phép định vị lại đường cơ sở trội tương đối so với đường cơ sở trội của phần tử nội dung văn bản cha. Đối tượng được dịch chuyển có thể là chỉ số dưới hoặc chỉ số trên.

> [!NOTE]
> Là một thuộc tính trình bày, `baseline-shift` cũng có một thuộc tính CSS tương ứng: {{cssxref("baseline-shift")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

> [!NOTE]
> Thuộc tính này sẽ bị loại bỏ trong tương lai và tác giả nên dùng {{cssxref("vertical-align")}} thay thế.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("textPath")}}
- {{SVGElement("tspan")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        {{cssxref("length-percentage")}} | <code>sub</code> |
        <code>super</code>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `sub`
  - : Đường cơ sở trội được dịch chuyển tới vị trí mặc định của chỉ số dưới.
- `super`
  - : Đường cơ sở trội được dịch chuyển tới vị trí mặc định của chỉ số trên.
- `<length-percentage>`
  - : Một giá trị độ dài sẽ nâng lên (giá trị dương) hoặc hạ xuống (giá trị âm) đường cơ sở trội của phần tử nội dung văn bản cha theo độ dài đã chỉ định.

    Một giá trị phần trăm sẽ nâng lên (giá trị dương) hoặc hạ xuống (giá trị âm) đường cơ sở trội của phần tử nội dung văn bản cha theo phần trăm đã chỉ định của {{cssxref("line-height")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
