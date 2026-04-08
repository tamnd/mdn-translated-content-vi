---
title: break-before
slug: Web/CSS/Reference/Properties/break-before
page-type: css-property
browser-compat: css.properties.break-before
sidebar: cssref
---

Thuộc tính **`break-before`** trong [CSS](/en-US/docs/Web/CSS) xác định cách các ngắt trang, cột hoặc vùng hoạt động trước một hộp được tạo ra. Nếu không có hộp nào được tạo, thuộc tính này sẽ bị bỏ qua.

{{InteractiveExample("CSS Demo: break-before")}}

```css interactive-example-choice
break-before: auto;
```

```css interactive-example-choice
break-before: page;
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
    <div class="box" id="example-element">Content with 'break-before'</div>
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
/* Giá trị ngắt chung */
break-before: auto;
break-before: avoid;
break-before: always;
break-before: all;

/* Giá trị ngắt trang */
break-before: avoid-page;
break-before: page;
break-before: left;
break-before: right;
break-before: recto;
break-before: verso;

/* Giá trị ngắt cột */
break-before: avoid-column;
break-before: column;

/* Giá trị ngắt vùng */
break-before: avoid-region;
break-before: region;

/* Giá trị toàn cục */
break-before: inherit;
break-before: initial;
break-before: revert;
break-before: revert-layer;
break-before: unset;
```

Mỗi điểm ngắt có thể xảy ra (tức là mỗi ranh giới phần tử) chịu ảnh hưởng bởi ba thuộc tính: giá trị {{cssxref("break-after")}} của phần tử trước, giá trị `break-before` của phần tử tiếp theo và giá trị {{cssxref("break-inside")}} của phần tử chứa.

Để xác định có cần thực hiện ngắt hay không, các quy tắc sau được áp dụng:

1. Nếu bất kỳ giá trị nào trong ba giá trị liên quan là _giá trị ngắt bắt buộc_ (`always`, `left`, `right`, `page`, `column` hoặc `region`), giá trị đó có độ ưu tiên cao nhất. Nếu có nhiều hơn một giá trị như vậy, giá trị của phần tử xuất hiện sau cùng trong luồng sẽ được sử dụng (tức là giá trị `break-before` có độ ưu tiên cao hơn `break-after`, còn `break-after` có độ ưu tiên cao hơn `break-inside`).
2. Nếu bất kỳ giá trị nào trong ba giá trị liên quan là _giá trị tránh ngắt_ (`avoid`, `avoid-page`, `avoid-region` hoặc `avoid-column`), sẽ không có ngắt nào được áp dụng tại điểm đó.

Sau khi các ngắt bắt buộc đã được áp dụng, các ngắt mềm có thể được thêm vào nếu cần, nhưng không được thêm vào các ranh giới phần tử có giá trị `avoid` tương ứng.

### Giá trị

#### Giá trị ngắt chung

- `auto`
  - : Cho phép, nhưng không bắt buộc, bất kỳ ngắt nào (trang, cột hoặc vùng) được chèn ngay trước hộp chính.
- `avoid`
  - : Tránh bất kỳ ngắt nào (trang, cột hoặc vùng) được chèn ngay trước hộp chính.
- `always`
  - : Buộc ngắt trang ngay trước hộp chính. Loại ngắt này phụ thuộc vào ngữ cảnh phân mảnh ngay chứa. Nếu nằm trong vùng chứa đa cột thì sẽ buộc ngắt cột, còn trong phương tiện phân trang (nhưng không trong vùng chứa đa cột) sẽ buộc ngắt trang.
- `all`
  - : Buộc ngắt trang ngay trước hộp chính, phá vỡ qua tất cả các ngữ cảnh phân mảnh có thể. Vì vậy, ngắt trong vùng chứa đa cột bên trong vùng chứa trang sẽ buộc cả ngắt cột và ngắt trang.

#### Giá trị ngắt trang

- `avoid-page`
  - : Tránh bất kỳ ngắt trang nào ngay trước hộp chính.
- `page`
  - : Buộc ngắt trang ngay trước hộp chính.
- `left`
  - : Buộc một hoặc hai ngắt trang ngay trước hộp chính, sao cho trang tiếp theo trở thành trang trái. Đây là trang được đặt ở bên trái gáy sách hoặc mặt sau của tờ giấy khi in hai mặt.
- `right`
  - : Buộc một hoặc hai ngắt trang ngay trước hộp chính, sao cho trang tiếp theo trở thành trang phải. Đây là trang được đặt ở bên phải gáy sách hoặc mặt trước của tờ giấy khi in hai mặt.
- `recto`
  - : Buộc một hoặc hai ngắt trang ngay trước hộp chính, sao cho trang tiếp theo trở thành trang recto. (Trang recto là trang phải trong cách trải từ trái sang phải hoặc trang trái trong cách trải từ phải sang trái.)
- `verso`
  - : Buộc một hoặc hai ngắt trang ngay trước hộp chính, sao cho trang tiếp theo trở thành trang verso. (Trang verso là trang trái trong cách trải từ trái sang phải hoặc trang phải trong cách trải từ phải sang trái.)

#### Giá trị ngắt cột

- `avoid-column`
  - : Tránh bất kỳ ngắt cột nào ngay trước hộp chính.
- `column`
  - : Buộc ngắt cột ngay trước hộp chính.

#### Giá trị ngắt vùng

- `avoid-region`
  - : Tránh bất kỳ ngắt vùng nào ngay trước hộp chính.
- `region`
  - : Buộc ngắt vùng ngay trước hộp chính.

## Bí danh ngắt trang

Vì lý do tương thích, thuộc tính cũ {{cssxref("page-break-before")}} nên được trình duyệt xem như bí danh của `break-before`. Điều này đảm bảo các trang web sử dụng `page-break-before` tiếp tục hoạt động đúng. Một tập hợp con các giá trị nên được ánh xạ như sau:

| page-break-before | break-before |
| ----------------- | ------------ |
| `auto`            | `auto`       |
| `left`            | `left`       |
| `right`           | `right`      |
| `avoid`           | `avoid`      |
| `always`          | `page`       |

> [!NOTE]
> Giá trị `always` của `page-break-*` được trình duyệt hiện thực hóa là ngắt trang, không phải ngắt cột. Do đó ánh xạ tới `page`, thay vì giá trị `always` trong đặc tả Level 4.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ngắt thành các cột gọn gàng

Trong ví dụ sau, chúng ta có một vùng chứa chứa thẻ `<h1>` trải qua tất cả các cột (đạt được bằng cách dùng `column-span: all`) và một loạt thẻ `<h2>` cùng các đoạn văn được bố cục theo nhiều cột với `column-width: 200px`.

Theo mặc định, các tiêu đề phụ và đoạn văn được bố cục khá lộn xộn vì các tiêu đề không ở cùng vị trí. Tuy nhiên, chúng ta đã dùng `break-before: column` trên các phần tử `<h2>` để buộc ngắt cột trước mỗi phần tử, nhờ đó mỗi `<h2>` sẽ nằm gọn gàng ở đầu mỗi cột.

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
  break-before: column;
}

p {
  line-height: 1.5;
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

- [Tìm hiểu: Bố cục nhiều cột](/en-US/docs/Learn_web_development/Core/CSS_layout/Multiple-column_Layout)
- [Breaking Boxes With CSS Fragmentation](https://www.smashingmagazine.com/2019/02/css-fragmentation/)
