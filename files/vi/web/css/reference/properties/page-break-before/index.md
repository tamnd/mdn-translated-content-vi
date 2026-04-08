---
title: page-break-before
slug: Web/CSS/Reference/Properties/page-break-before
page-type: css-property
status:
  - deprecated
browser-compat: css.properties.page-break-before
sidebar: cssref
---

{{deprecated_header}}

> [!WARNING]
> Thuộc tính này đã được thay thế bởi thuộc tính {{cssxref("break-before")}}.

Thuộc tính **`page-break-before`** [CSS](/en-US/docs/Web/CSS) điều chỉnh các ngắt trang _trước_ phần tử hiện tại.

Thuộc tính này áp dụng cho các phần tử khối tạo ra một hộp. Nó sẽ không áp dụng cho một {{ HTMLElement("div") }} trống không tạo ra hộp.

{{InteractiveExample("CSS Demo: page-break-before")}}

```css interactive-example-choice
page-break-before: auto;
```

```css interactive-example-choice
page-break-before: always;
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
    <div class="box" id="example-element">Content with 'page-break-before'</div>
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
page-break-before: auto;
page-break-before: always;
page-break-before: avoid;
page-break-before: left;
page-break-before: right;
page-break-before: recto;
page-break-before: verso;

/* Giá trị toàn cục */
page-break-before: inherit;
page-break-before: initial;
page-break-before: revert;
page-break-before: revert-layer;
page-break-before: unset;
```

### Giá trị

- `auto`
  - : Giá trị khởi tạo. Ngắt trang tự động (không bị ép buộc cũng không bị cấm).
- `always`
  - : Luôn ép ngắt trang trước phần tử.
- `avoid`
  - : Tránh ngắt trang trước phần tử.
- `left`
  - : Ép ngắt trang trước phần tử sao cho trang tiếp theo được định dạng là trang trái. Đây là trang được đặt ở bên trái gáy sách hoặc mặt sau của trang trong in hai mặt.
- `right`
  - : Ép ngắt trang trước phần tử sao cho trang tiếp theo được định dạng là trang phải. Đây là trang được đặt ở bên phải gáy sách hoặc mặt trước của trang trong in hai mặt.
- `recto`
  - : Nếu các trang tiến theo chiều trái sang phải, thì hoạt động giống `right`. Nếu các trang tiến theo chiều phải sang trái, thì hoạt động giống `left`.
- `verso`
  - : Nếu các trang tiến theo chiều trái sang phải, thì hoạt động giống `left`. Nếu các trang tiến theo chiều phải sang trái, thì hoạt động giống `right`.

## Bí danh ngắt trang

Thuộc tính `page-break-before` hiện là thuộc tính kế thừa, được thay thế bởi {{cssxref("break-before")}}.

Để tương thích, `page-break-before` nên được trình duyệt coi là bí danh của `break-before`. Điều này đảm bảo rằng các trang web sử dụng `page-break-before` tiếp tục hoạt động như thiết kế. Một tập hợp con các giá trị nên được đặt bí danh như sau:

| page-break-before | break-before |
| ----------------- | ------------ |
| `auto`            | `auto`       |
| `left`            | `left`       |
| `right`           | `right`      |
| `avoid`           | `avoid`      |
| `always`          | `page`       |

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tránh ngắt trang trước một phần tử

```css
/* Tránh ngắt trang trước các phần tử div có class note */
div.note {
  page-break-before: avoid;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("break-before")}}, {{cssxref("break-after")}}, {{cssxref("break-inside")}}
- {{cssxref("page-break-after")}}, {{cssxref("page-break-inside")}}
- {{cssxref("orphans")}}, {{cssxref("widows")}}
