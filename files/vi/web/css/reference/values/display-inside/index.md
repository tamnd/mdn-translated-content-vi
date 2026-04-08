---
title: <display-inside>
slug: Web/CSS/Reference/Values/display-inside
page-type: css-type
browser-compat:
  - css.properties.display.flow-root
  - css.properties.display.table
  - css.properties.display.flex
  - css.properties.display.grid
  - css.properties.display.ruby
spec-urls: https://drafts.csswg.org/css-display/#typedef-display-inside
sidebar: cssref
---

Các từ khóa này chỉ định kiểu {{CSSxRef("display")}} bên trong của phần tử, định nghĩa kiểu ngữ cảnh định dạng sắp xếp nội dung của nó (giả sử đó là phần tử không phải phần tử thay thế). Các từ khóa này được dùng làm giá trị của thuộc tính `display`, và có thể được dùng cho mục đích kế thừa như một từ khóa đơn, hoặc như được định nghĩa trong thông số kỹ thuật Cấp 3 cùng với một giá trị từ các từ khóa {{CSSxRef("&lt;display-outside&gt;")}}.

## Cú pháp

Các giá trị `<display-inside>` hợp lệ:

- `flow`
  - : Phần tử sắp xếp nội dung của mình bằng bố cục dòng (bố cục khối và inline).

    Nếu kiểu hiển thị ngoài của nó là `inline`, và nó đang tham gia vào ngữ cảnh định dạng khối hoặc inline, thì nó tạo ra một hộp inline. Ngược lại, nó tạo ra một hộp container khối.

    Tùy thuộc vào giá trị của các thuộc tính khác (như {{CSSxRef("position")}}, {{CSSxRef("float")}}, hoặc {{CSSxRef("overflow")}}) và liệu nó có đang tham gia vào ngữ cảnh định dạng khối hoặc inline, nó hoặc thiết lập một [ngữ cảnh định dạng khối](/vi/docs/Web/CSS/Guides/Display/Block_formatting_context) (BFC) mới cho nội dung hoặc tích hợp nội dung vào ngữ cảnh định dạng của phần tử cha.

- `flow-root`
  - : Phần tử tạo ra một hộp phần tử khối thiết lập một [ngữ cảnh định dạng khối](/vi/docs/Web/CSS/Guides/Display/Block_formatting_context) mới, xác định nơi gốc định dạng nằm.
- `table`
  - : Các phần tử này hoạt động như các phần tử HTML {{HTMLElement("table")}}. Nó định nghĩa một hộp cấp khối.
- `flex`
  - : Phần tử hoạt động như một phần tử khối và sắp xếp nội dung của mình theo [mô hình flexbox](/vi/docs/Web/CSS/Guides/Flexible_box_layout).
- `grid`
  - : Phần tử hoạt động như một phần tử khối và sắp xếp nội dung của mình theo [mô hình lưới](/vi/docs/Web/CSS/Guides/Grid_layout/Basic_concepts).
- `ruby`
  - : Phần tử hoạt động như một phần tử inline và sắp xếp nội dung của mình theo mô hình định dạng ruby. Nó hoạt động như các phần tử HTML {{HTMLElement("ruby")}} tương ứng.

> [!NOTE]
> Các trình duyệt hỗ trợ cú pháp hai giá trị, khi chỉ tìm thấy giá trị bên trong, chẳng hạn khi `display: flex` hoặc `display: grid` được chỉ định, sẽ đặt giá trị ngoài của chúng thành `block`. Điều này sẽ dẫn đến hành vi như mong đợi; ví dụ nếu bạn chỉ định một phần tử là `display: grid`, bạn sẽ mong đợi rằng hộp được tạo ra trên container lưới sẽ là hộp cấp khối.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

Trong ví dụ này, hộp cha đã được đặt thành `display: flow-root` và do đó thiết lập một BFC mới và chứa phần tử float.

### HTML

```html
<div class="box">
  <div class="float">Tôi là hộp float!</div>
  <p>Tôi là nội dung bên trong container.</p>
</div>
```

### CSS

```css
.box {
  background-color: rgb(224 206 247);
  border: 5px solid rebeccapurple;
  display: flow-root;
}

.float {
  float: left;
  width: 200px;
  height: 150px;
  background-color: white;
  border: 1px solid black;
  padding: 10px;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 180)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("display")}}
  - {{CSSxRef("&lt;display-outside&gt;")}}
  - {{CSSxRef("&lt;display-listitem&gt;")}}
  - {{CSSxRef("&lt;display-internal&gt;")}}
  - {{CSSxRef("&lt;display-box&gt;")}}
  - {{CSSxRef("&lt;display-legacy&gt;")}}

- [Các khái niệm cơ bản về flexbox](/vi/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Các khái niệm cơ bản về bố cục lưới](/vi/docs/Web/CSS/Guides/Grid_layout/Basic_concepts)
