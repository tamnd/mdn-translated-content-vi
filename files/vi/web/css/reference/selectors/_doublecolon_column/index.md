---
title: ::column
slug: Web/CSS/Reference/Selectors/::column
page-type: css-pseudo-element
status:
  - experimental
browser-compat: css.selectors.column
sidebar: cssref
---

{{SeeCompatTable}}

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::column`** đại diện cho các cột riêng lẻ được tạo ra khi một vùng chứa được đặt để hiển thị nội dung theo nhiều cột thông qua [bố cục nhiều cột CSS](/en-US/docs/Web/CSS/Guides/Multicol_layout). Phần tử giả `::column` cho phép áp dụng các kiểu không ảnh hưởng đến bố cục cho các phân đoạn được tạo ra này.

## Cú pháp

```css-nolint
::column {
  /* ... */
}
```

## Mô tả

Khi bố cục nhiều cột CSS được dùng để bố cục nội dung của vùng chứa thành nhiều cột (ví dụ, sử dụng thuộc tính {{cssxref("column-count")}}), các phần tử giả `::column` được tạo ra để chứa từng cột riêng lẻ.

Phần tử giả `::column` chỉ chấp nhận các thuộc tính scroll snap áp dụng cho các phần tử bên trong scroll container, bao gồm {{cssxref("scroll-margin")}}, {{cssxref("scroll-snap-align")}}, và {{cssxref("scroll-snap-stop")}}.

Phần tử giả `::column` có thể có phần tử giả {{cssxref("::scroll-marker")}}. Các phần tử giả khác như {{cssxref("::before")}} và {{cssxref("::after")}} không được tạo ra trên `::column`. Áp dụng `::column::scroll-marker` tạo ra một dấu cho mỗi cột của [scroll container](/en-US/docs/Glossary/Scroll_container) gốc, với các phần tử giả `::scroll-marker` kế thừa từ phần tử gốc của phần tử giả `::column` thay vì từ `::column` chính nó.

Điều này hữu ích cho [carousel CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels) — `::column` có thể được dùng để tạo ra các phần tử giả `::scroll-marker` cho mỗi cột, và đặt chúng làm [snap targets](/en-US/docs/Glossary/Scroll_snap#snap_target) bằng cách sử dụng [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap).

Mặc dù việc tạo kiểu có thể áp dụng cho `::column` rất hạn chế, nó có thể được mở rộng trong tương lai. Bất kỳ thuộc tính và giá trị nào được hỗ trợ trong tương lai sẽ bị giới hạn ở những thuộc tính không ảnh hưởng đến bố cục.

## Ví dụ

### Bố cục cột cuộn

Demo này tạo ra một vùng chứa đáp ứng để snap từng "trang" nội dung vào vị trí. Nó sử dụng thuộc tính {{cssxref("columns")}} và phần tử giả `::column` để tạo ra các cột nội dung trải dài toàn bộ chiều rộng của {{glossary("scroll container")}} cha, có thể cuộn theo chiều ngang. Mỗi cột chứa một hoặc nhiều mục danh sách, số lượng khác nhau tùy theo chiều rộng viewport.

#### HTML

HTML bao gồm một [danh sách không có thứ tự](/en-US/docs/Web/HTML/Reference/Elements/ul), với mỗi [mục danh sách](/en-US/docs/Web/HTML/Reference/Elements/li) chứa một số nội dung mẫu:

```html-nolint
<ul>
...
  <li>
    <h2>Item 1</h2>
  </li>
...
</ul>
```

```html hidden live-sample___column-layout-example live-sample___carousel-example
<ul>
  <li>
    <h2>Item 1</h2>
  </li>
  <li>
    <h2>Item 2</h2>
  </li>
  <li>
    <h2>Item 3</h2>
  </li>
  <li>
    <h2>Item 4</h2>
  </li>
  <li>
    <h2>Item 5</h2>
  </li>
  <li>
    <h2>Item 6</h2>
  </li>
  <li>
    <h2>Item 7</h2>
  </li>
  <li>
    <h2>Item 8</h2>
  </li>
  <li>
    <h2>Item 9</h2>
  </li>
  <li>
    <h2>Item 10</h2>
  </li>
  <li>
    <h2>Item 11</h2>
  </li>
  <li>
    <h2>Item 12</h2>
  </li>
  <li>
    <h2>Item 13</h2>
  </li>
  <li>
    <h2>Item 14</h2>
  </li>
  <li>
    <h2>Item 15</h2>
  </li>
</ul>
```

#### CSS

Danh sách được đặt {{cssxref("height")}} cố định và {{cssxref("width")}} bằng `100vw` để trải dài toàn bộ chiều rộng viewport. Giá trị {{cssxref("overflow-x")}} là `scroll` được đặt để nội dung sẽ cuộn theo chiều ngang, và [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap) được dùng để snap vào từng mục hoặc "trang" — giá trị {{cssxref("scroll-snap-type")}} là `x mandatory` được dùng để biến danh sách thành một [scroll snap container](/en-US/docs/Glossary/Scroll_snap#scroll_snap_container). Cuối cùng, giá trị {{cssxref("columns")}} là `1` được đặt để buộc nội dung danh sách hiển thị dưới dạng một cột. Giá trị {{cssxref("text-align")}} là `center` cũng được áp dụng, để căn giữa nội dung với trung tâm danh sách.

```css hidden live-sample___column-layout-example live-sample___carousel-example
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: "Helvetica", "Arial", sans-serif;
}
```

```css live-sample___column-layout-example live-sample___carousel-example
ul {
  width: 100vw;
  height: 300px;
  padding: 10px;

  overflow-x: scroll;
  scroll-snap-type: x mandatory;

  columns: 1;
  text-align: center;
}
```

Các mục danh sách sau đó được tạo kiểu:

- Giá trị {{cssxref("display")}} là `inline-block` được đặt để các mục danh sách ngồi cạnh nhau và làm cho danh sách cuộn theo chiều ngang.
- {{cssxref("width")}} và {{cssxref("height")}} cố định đã được đặt trên chúng.
- Giá trị `text-align` là `left` được đặt trên chúng để ghi đè `text-align: center` được đặt trên vùng chứa cha, vì vậy nội dung mục sẽ được căn trái.
- Mỗi mục danh sách chẵn được đặt màu nền khác thông qua {{cssxref(":nth-child()")}}, để dễ thấy hiệu ứng cuộn hơn.

```css live-sample___column-layout-example live-sample___carousel-example
li {
  list-style-type: none;

  display: inline-block;
  height: 100%;
  width: 200px;
  text-align: left;

  background-color: #eeeeee;
  outline: 1px solid #dddddd;
  padding: 0 20px;
  margin: 0 10px;
}

li:nth-child(even) {
  background-color: cyan;
}
```

Thuộc tính {{cssxref("scroll-snap-align")}} được đặt trên các phần tử giả `::column` — đại diện cho các cột nội dung được tạo ra bởi thuộc tính `columns` — để khi cuộn, một cột được snap vào trung tâm scroll container.

```css live-sample___column-layout-example live-sample___carousel-example
ul::column {
  scroll-snap-align: center;
}
```

#### Kết quả

{{EmbedLiveSample("column-layout-example", "100%", "400px")}}

### Carousel dựa trên cột với scroll markers

Mở rộng từ ví dụ trước, chúng ta sẽ tạo scroll markers để cho phép điều hướng trực tiếp đến các cột khác nhau bằng cách áp dụng {{cssxref("scroll-marker-group")}} vào vùng chứa và {{cssxref("::scroll-marker")}} vào mỗi phần tử giả `::column`. HTML không thay đổi.

#### CSS

Chúng ta tạo một nhóm scroll marker với thuộc tính {{cssxref("scroll-marker-group")}}, đặt nhóm sau tất cả nội dung:

```css live-sample___carousel-example
ul {
  scroll-marker-group: after;
}
```

Sau đó chúng ta áp dụng kiểu cho phần tử giả {{cssxref("::scroll-marker-group")}} để bố cục scroll markers ở trung tâm hàng với khoảng cách `0.4em` giữa mỗi cái:

```css live-sample___carousel-example
::scroll-marker-group {
  display: flex;
  gap: 0.4em;
  place-content: center;
}
```

Cuối cùng, chúng ta dùng phần tử giả {{cssxref("::scroll-marker")}} để tạo một marker tròn, trong suốt cho mỗi mục danh sách với viền đen, sau đó tạo kiểu khác cho marker của phần tử hiện đang cuộn so với các cái khác, nhắm marker bằng lớp giả {{cssxref(":target-current")}}:

```css live-sample___carousel-example
ul::column::scroll-marker {
  content: "";
  width: 16px;
  height: 16px;
  background-color: transparent;
  border: 2px solid black;
  border-radius: 10px;
}

ul::column::scroll-marker:target-current {
  background-color: black;
}
```

#### Kết quả

{{EmbedLiveSample("carousel-example", "100%", "400px")}}

Hãy thử nhấn các scroll markers để chuyển thẳng đến mỗi trang. Lưu ý cách marker hiện tại được tô sáng để bạn có thể thấy vị trí của mình trong phân trang. Cũng hãy thử tab đến nhóm scroll marker, sau đó dùng phím mũi tên để chuyển qua từng trang.

Xem [Tạo carousel CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels) để biết thêm ví dụ về carousel.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("columns")}}
- {{cssxref("::scroll-marker")}}
- {{cssxref("::scroll-marker-group")}}
- {{cssxref(":target-current")}}
- [Tạo carousel CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels)
- Module [bố cục nhiều cột CSS](/en-US/docs/Web/CSS/Guides/Multicol_layout)
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- [CSS Carousel Gallery](https://chrome.dev/carousel/) qua chrome.dev (2025)
