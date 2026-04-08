---
title: page-break-after
slug: Web/CSS/Reference/Properties/page-break-after
page-type: css-property
status:
  - deprecated
browser-compat: css.properties.page-break-after
sidebar: cssref
---

{{deprecated_header}}

> [!WARNING]
> Thuộc tính này đã được thay thế bởi thuộc tính {{cssxref("break-after")}}.

Thuộc tính **`page-break-after`** [CSS](/en-US/docs/Web/CSS) điều chỉnh các ngắt trang _sau_ phần tử hiện tại.

{{InteractiveExample("CSS Demo: page-break-after")}}

```css interactive-example-choice
page-break-after: auto;
```

```css interactive-example-choice
page-break-after: always;
```

```html interactive-example
<div>
  <p>
    The effect of this property can be noticed when the document is being
    printed or a preview of a print is displayed.
  </p>
  <button id="print-btn">Show Print Preview</button>
  <div class="box-container">
    <div class="box">Content before the property</div>
    <div class="box" id="example-element">Content with 'page-break-after'</div>
    <div class="box">Content after the property</div>
  </div>
</div>
```

```css interactive-example
.box {
  border: solid #5b6dcd 5px;
  background-color: #5b6dcd;
  margin: 10px 0;
  padding: 5px;
}

#example-element {
  border: solid 5px #ffc129;
  background-color: #ffc129;
  color: black;
}
```

```js interactive-example
const btn = document.getElementById("print-btn");

btn.addEventListener("click", () => {
  window.print();
});
```

## Cú pháp

```css
/* Giá trị từ khóa */
page-break-after: auto;
page-break-after: always;
page-break-after: avoid;
page-break-after: left;
page-break-after: right;
page-break-after: recto;
page-break-after: verso;

/* Giá trị toàn cục */
page-break-after: inherit;
page-break-after: initial;
page-break-after: revert;
page-break-after: revert-layer;
page-break-after: unset;
```

Thuộc tính này áp dụng cho các phần tử khối tạo ra một hộp. Nó sẽ không áp dụng cho một `<div>` trống không tạo ra hộp.

### Giá trị

- `auto`
  - : Giá trị khởi tạo. Ngắt trang tự động (không bị ép buộc cũng không bị cấm).
- `always`
  - : Luôn ép ngắt trang sau phần tử.
- `avoid`
  - : Tránh ngắt trang sau phần tử.
- `left`
  - : Ép ngắt trang sau phần tử sao cho trang tiếp theo được định dạng là trang trái. Đây là trang được đặt ở bên trái gáy sách hoặc mặt sau của trang trong in hai mặt.
- `right`
  - : Ép ngắt trang sau phần tử sao cho trang tiếp theo được định dạng là trang phải. Đây là trang được đặt ở bên phải gáy sách hoặc mặt trước của trang trong in hai mặt.
- `recto`
  - : Nếu các trang tiến theo chiều trái sang phải, thì hoạt động giống `right`. Nếu các trang tiến theo chiều phải sang trái, thì hoạt động giống `left`.
- `verso`
  - : Nếu các trang tiến theo chiều trái sang phải, thì hoạt động giống `left`. Nếu các trang tiến theo chiều phải sang trái, thì hoạt động giống `right`.

## Bí danh ngắt trang

Thuộc tính `page-break-after` hiện là thuộc tính kế thừa, được thay thế bởi {{cssxref("break-after")}}.

Để tương thích, `page-break-after` nên được trình duyệt coi là bí danh của `break-after`. Điều này đảm bảo rằng các trang web sử dụng `page-break-after` tiếp tục hoạt động như thiết kế. Một tập hợp con các giá trị nên được đặt bí danh như sau:

| page-break-after | break-after |
| ---------------- | ----------- |
| `auto`           | `auto`      |
| `left`           | `left`      |
| `right`          | `right`     |
| `avoid`          | `avoid`     |
| `always`         | `page`      |

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt ngắt trang sau chú thích

```css
/* chuyển sang trang mới sau phần chú thích */
div.footnotes {
  page-break-after: always;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("break-before")}}, {{cssxref("break-after")}}, {{cssxref("break-inside")}}
- {{cssxref("page-break-before")}}, {{cssxref("page-break-inside")}}
- {{cssxref("orphans")}}, {{cssxref("widows")}}
