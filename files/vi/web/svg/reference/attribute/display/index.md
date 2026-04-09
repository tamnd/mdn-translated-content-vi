---
title: display
slug: Web/SVG/Reference/Attribute/display
page-type: svg-attribute
browser-compat: svg.global_attributes.display
sidebar: svgref
---

Thuộc tính **`display`** cho phép bạn kiểm soát việc kết xuất các phần tử đồ họa hoặc phần tử chứa.

Giá trị `display="none"` cho biết phần tử đã cho và các phần tử con của nó sẽ không được hiển thị. Bất kỳ giá trị nào khác `none` hoặc `inherit` đều cho biết phần tử đã cho sẽ được trình duyệt hiển thị.

Khi áp dụng cho một phần tử chứa, đặt `display` thành `none` khiến phần tử chứa và toàn bộ phần tử con của nó trở nên vô hình; vì vậy, nó hoạt động lên các nhóm phần tử như một nhóm. Điều này có nghĩa là bất kỳ phần tử con nào của phần tử có `display="none"` sẽ không bao giờ được hiển thị ngay cả khi phần tử con có giá trị `display` khác `none`.

Khi thuộc tính `display` được đặt thành `none`, phần tử đã cho sẽ không trở thành một phần của cây kết xuất. Nó có ảnh hưởng đến các phần tử {{SVGElement("tspan")}}, xử lý sự kiện, tính toán hộp giới hạn và tính toán đường cắt:

- Nếu `display` được đặt thành `none` trên phần tử {{SVGElement("tspan")}}, thì chuỗi văn bản sẽ bị bỏ qua trong quá trình bố trí văn bản.
- Về sự kiện, nếu `display` được đặt thành `none`, phần tử sẽ không nhận bất kỳ sự kiện nào.
- Hình học của một [phần tử đồ họa](/en-US/docs/Web/SVG/Reference/Element#graphics_elements) với `display` được đặt thành `none` sẽ không được đưa vào tính toán hộp giới hạn và đường cắt.

Thuộc tính `display` chỉ ảnh hưởng đến việc hiển thị trực tiếp của một phần tử cho trước, trong khi nó không ngăn các phần tử khác tham chiếu tới phần tử đó. Ví dụ, đặt nó thành `none` trên một phần tử {{SVGElement("path")}} sẽ ngăn phần tử đó được kết xuất trực tiếp lên canvas, nhưng phần tử {{SVGElement("path")}} vẫn có thể được tham chiếu bởi một phần tử {{SVGElement("textPath")}}; hơn nữa, hình học của nó sẽ vẫn được dùng trong xử lý văn bản trên đường dẫn ngay cả khi {{SVGElement("path")}} có giá trị `display` là `none`.

Thuộc tính này cũng ảnh hưởng đến việc hiển thị trực tiếp vào các canvas ngoài màn hình, chẳng hạn như khi dùng mask hoặc clip path. Vì vậy, đặt `display="none"` trên một phần tử con của {{SVGElement("mask")}} sẽ ngăn phần tử con đó được hiển thị như một phần của mask. Tương tự, đặt `display="none"` trên một phần tử con của phần tử {{SVGElement("clipPath")}} sẽ ngăn phần tử con đó đóng góp vào đường cắt.

> [!NOTE]
> Là một thuộc tính trình bày, `display` cũng có một thuộc tính CSS tương ứng: {{cssxref("display")}}. Khi cả hai được chỉ định, thuộc tính CSS sẽ được ưu tiên.

Bạn có thể dùng thuộc tính này với bất kỳ phần tử SVG nào.

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
  <!-- Here the yellow rectangle is displayed -->
  <rect x="0" y="0" width="100" height="100" fill="skyblue"></rect>
  <rect x="20" y="20" width="60" height="60" fill="yellow"></rect>

  <!-- Here the yellow rectangle is not displayed -->
  <rect x="120" y="0" width="100" height="100" fill="skyblue"></rect>
  <rect
    x="140"
    y="20"
    width="60"
    height="60"
    fill="yellow"
    display="none"></rect>
</svg>
```

{{EmbedLiveSample("Example", "240", "120")}}

## Ghi chú sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>inline</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị</th>
      <td>Xem {{cssxref("display", "", "#formal_syntax")}}</td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

Để mô tả các giá trị, vui lòng tham khảo thuộc tính CSS {{cssxref("display")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{SVGAttr("visibility")}}
- Thuộc tính CSS {{cssxref("display")}}
