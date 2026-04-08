---
title: break-after
slug: Web/CSS/Reference/Properties/break-after
page-type: css-property
browser-compat: css.properties.break-after
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`break-after`** đặt cách ngắt trang, cột hay vùng hoạt động sau một hộp được tạo ra. Nếu không có hộp được tạo ra, thuộc tính sẽ bị bỏ qua.

{{InteractiveExample("CSS Demo: break-after")}}

```css interactive-example-choice
break-after: auto;
```

```css interactive-example-choice
break-after: page;
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
    <div class="box" id="example-element">Content with 'break-after'</div>
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
/* Generic break values */
break-after: auto;
break-after: avoid;
break-after: always;
break-after: all;

/* Page break values */
break-after: avoid-page;
break-after: page;
break-after: left;
break-after: right;
break-after: recto;
break-after: verso;

/* Column break values */
break-after: avoid-column;
break-after: column;

/* Region break values */
break-after: avoid-region;
break-after: region;

/* Global values */
break-after: inherit;
break-after: initial;
break-after: revert;
break-after: revert-layer;
break-after: unset;
```

Mỗi điểm ngắt có thể xảy ra (nói cách khác, mỗi ranh giới phần tử) bị ảnh hưởng bởi ba thuộc tính: giá trị `break-after` của phần tử trước, giá trị {{cssxref("break-before")}} của phần tử tiếp theo, và giá trị {{cssxref("break-inside")}} của phần tử chứa.

Để xác định xem có cần thực hiện ngắt hay không, các quy tắc sau được áp dụng:

1. Nếu bất kỳ giá trị nào trong ba giá trị liên quan là _giá trị ngắt bắt buộc_ (`always`, `left`, `right`, `page`, `column` hay `region`), nó sẽ có ưu tiên. Nếu có nhiều hơn một trong số chúng là ngắt như vậy, giá trị của phần tử xuất hiện sau cùng trong luồng sẽ được lấy (tức là giá trị `break-before` có ưu tiên hơn giá trị `break-after`, giá trị này có ưu tiên hơn giá trị `break-inside`).
2. Nếu bất kỳ giá trị nào trong ba giá trị liên quan là _giá trị tránh ngắt_ (`avoid`, `avoid-page`, `avoid-region` hay `avoid-column`), sẽ không có ngắt như vậy được áp dụng tại điểm đó.

Sau khi các ngắt bắt buộc đã được áp dụng, các ngắt mềm có thể được thêm vào nếu cần, nhưng không phải trên ranh giới phần tử có giá trị `avoid` tương ứng.

### Giá trị

#### Giá trị ngắt chung

- `auto`
  - : Cho phép, nhưng không bắt buộc, bất kỳ ngắt nào (trang, cột hay vùng) được chèn ngay sau hộp chính.
- `avoid`
  - : Tránh bất kỳ ngắt nào (trang, cột hay vùng) được chèn ngay sau hộp chính.
- `always`
  - : Buộc ngắt trang ngay sau hộp chính. Loại ngắt này là của ngữ cảnh phân mảnh chứa trực tiếp. Nếu chúng ta ở trong container multicol thì nó sẽ buộc ngắt cột, trong phương tiện phân trang (nhưng không ở trong container multicol) ngắt trang.
- `all`
  - : Buộc ngắt trang ngay sau hộp chính. Ngắt qua tất cả các ngữ cảnh phân mảnh có thể. Vì vậy, ngắt bên trong container multicol, nằm bên trong container trang sẽ buộc ngắt cột và ngắt trang.

#### Giá trị ngắt trang

- `avoid-page`
  - : Tránh bất kỳ ngắt trang nào ngay sau hộp chính.
- `page`
  - : Buộc ngắt trang ngay sau hộp chính.
- `left`
  - : Buộc một hay hai ngắt trang ngay sau hộp chính, tùy theo điều kiện nào sẽ khiến trang tiếp theo trở thành trang trái. Đó là trang được đặt ở bên trái gáy sách hoặc mặt sau của trang trong in hai mặt.
- `right`
  - : Buộc một hay hai ngắt trang ngay sau hộp chính, tùy theo điều kiện nào sẽ khiến trang tiếp theo trở thành trang phải. Đó là trang được đặt ở bên phải gáy sách hoặc mặt trước của trang trong in hai mặt.
- `recto`
  - : Buộc một hay hai ngắt trang ngay sau hộp chính, tùy theo điều kiện nào sẽ khiến trang tiếp theo trở thành trang recto. (Trang recto là trang phải trong trang trải từ trái sang phải hoặc trang trái trong trang trải từ phải sang trái.)
- `verso`
  - : Buộc một hay hai ngắt trang ngay sau hộp chính, tùy theo điều kiện nào sẽ khiến trang tiếp theo trở thành trang verso. (Trang verso là trang trái trong trang trải từ trái sang phải hoặc trang phải trong trang trải từ phải sang trái.)

#### Giá trị ngắt cột

- `avoid-column`
  - : Tránh bất kỳ ngắt cột nào ngay sau hộp chính.
- `column`
  - : Buộc ngắt cột ngay sau hộp chính.

#### Giá trị ngắt vùng

- `avoid-region`
  - : Tránh bất kỳ ngắt vùng nào ngay sau hộp chính.
- `region`
  - : Buộc ngắt vùng ngay sau hộp chính.

## Bí danh ngắt trang

Vì lý do tương thích, thuộc tính cũ {{cssxref("page-break-after")}} nên được trình duyệt xử lý như một bí danh của `break-after`. Điều này đảm bảo rằng các trang sử dụng `page-break-after` tiếp tục hoạt động như được thiết kế. Một tập hợp con các giá trị nên được đặt bí danh như sau:

| page-break-after | break-after |
| ---------------- | ----------- |
| `auto`           | `auto`      |
| `left`           | `left`      |
| `right`          | `right`     |
| `avoid`          | `avoid`     |
| `always`         | `page`      |

> [!NOTE]
> Giá trị `always` của `page-break-*` được trình duyệt triển khai như một ngắt trang, không phải ngắt cột. Do đó, việc đặt bí danh là thành `page`, thay vì giá trị `always` trong đặc tả Level 4.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ngắt thành các cột gọn gàng

Trong ví dụ sau, chúng ta có một container chứa một `<h1>` trải dài trên tất cả các cột (đạt được bằng cách sử dụng `column-span: all`) và một loạt các `<h2>` và đoạn văn được bố trí trong nhiều cột bằng cách sử dụng `column-width: 200px`.

Theo mặc định, các tiêu đề phụ và đoạn văn được bố trí khá lộn xộn vì các tiêu đề không ở vị trí đồng đều. Tuy nhiên, chúng ta đã sử dụng `break-after: column` trên các phần tử `<p>` để buộc ngắt cột sau mỗi phần tử, nghĩa là bạn sẽ có một `<h2>` gọn gàng ở đầu mỗi cột.

#### HTML

```html
<article>
  <h1>Main heading</h1>

  <h2>Subheading</h2>

  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vitae
    fringilla mauris. Quisque commodo eget nisi sed pretium. Mauris luctus nec
    lacus in ultricies. Mauris vitae hendrerit arcu, ac scelerisque lacus.
    Aliquam lobortis in lacus sit amet posuere. Fusce iaculis urna id neque
    dapibus, eu lacinia lectus dictum.
  </p>

  <h2>Subheading</h2>

  <p>
    Praesent condimentum dui dui, sit amet rutrum diam tincidunt eu. Cras
    suscipit porta leo sit amet rutrum. Sed vehicula ornare tincidunt. Curabitur
    a ipsum ac diam mattis volutpat ac ut elit. Nullam luctus justo non
    vestibulum gravida. Morbi metus libero, pharetra non porttitor a, molestie
    nec nisi.
  </p>

  <h2>Subheading</h2>

  <p>
    Vivamus eleifend metus vitae neque placerat, eget interdum elit mattis.
    Donec eu vulputate nibh. Ut turpis leo, malesuada quis nisl nec, volutpat
    egestas tellus.
  </p>

  <h2>Subheading</h2>

  <p>
    In finibus viverra enim vel suscipit. Quisque consequat velit eu orci
    malesuada, ut interdum tortor molestie. Proin sed pellentesque augue. Nam
    risus justo, faucibus non porta a, congue vel massa. Cras luctus lacus nisl,
    sed tincidunt velit pharetra ac. Duis suscipit faucibus dui sed ultricies.
  </p>
</article>
```

#### CSS

```css
html {
  font-family: "Helvetica", "Arial", sans-serif;
}

h1 {
  font-size: 3rem;
  letter-spacing: 2px;
  column-span: all;
}

h2 {
  font-size: 1.2rem;
  color: red;
  letter-spacing: 1px;
}

p {
  line-height: 1.5;
  break-after: column;
}

article {
  column-width: 200px;
  gap: 20px;
}
```

### Kết quả

{{EmbedLiveSample('Breaking_into_neat_columns', '100%', 600)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Learn: Multiple-column Layout](/en-US/docs/Learn_web_development/Core/CSS_layout/Multiple-column_Layout)
- [Breaking Boxes With CSS Fragmentation](https://www.smashingmagazine.com/2019/02/css-fragmentation/)
