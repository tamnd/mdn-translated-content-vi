---
title: ::scroll-marker
slug: Web/CSS/Reference/Selectors/::scroll-marker
page-type: css-pseudo-element
status:
  - experimental
browser-compat: css.selectors.scroll-marker
sidebar: cssref
---

{{SeeCompatTable}}

Phần tử giả **`::scroll-marker`** trong [CSS](/en-US/docs/Web/CSS) có thể được tạo ra bên trong bất kỳ phần tử nào và đại diện cho dấu cuộn của phần tử đó. Tất cả các phần tử đều có thể có phần tử giả `::scroll-marker`, được đặt vào {{cssxref("::scroll-marker-group")}} của {{glossary("scroll container")}} tổ tiên gần nhất. Một dấu cuộn hoạt động như một liên kết neo (phần tử {{htmlelement("a")}}) mà mục tiêu cuộn là phần tử gốc của dấu đó — và cuộn vùng chứa cuộn đến phần tử đó khi được kích hoạt.

## Cú pháp

```css-nolint
::scroll-marker {
  /* ... */
}
```

## Mô tả

`::scroll-marker` được tạo ra trên một phần tử khi thuộc tính {{cssxref("content")}} của `::scroll-marker` được đặt thành giá trị khác `none`, và phần tử đó có một vùng chứa cuộn tổ tiên với giá trị thuộc tính {{cssxref("scroll-marker-group")}} khác `none` (nghĩa là nó sẽ tạo ra một phần tử giả {{cssxref("::scroll-marker-group")}}).

Phần tử giả `::scroll-marker-group` của vùng chứa cuộn tự động chứa bất kỳ phần tử giả `::scroll-marker` nào được tạo ra trên vùng chứa cuộn hoặc các phần tử con của nó. Điều này cho phép chúng được định vị và bố cục như một nhóm, thường được sử dụng khi tạo băng chuyền CSS để tạo chỉ báo vị trí cuộn. Các dấu cuộn riêng lẻ có thể được dùng để điều hướng đến các mục nội dung liên quan.

> [!NOTE]
> Ngoài ra, vùng chứa nhóm dấu cuộn có thể được tạo từ vùng chứa phần tử hiện có bằng cách dùng {{cssxref("scroll-target-group")}}; bất kỳ phần tử {{htmlelement("a")}} nào chứa bên trong có định danh phân mảnh liên kết đến các phần của trang đều tự động hoạt động như dấu cuộn.

Khi vùng chứa nhóm dấu cuộn được tạo trên vùng chứa cuộn bằng thuộc tính `scroll-marker-group`, vùng chứa cuộn được hiển thị với ngữ nghĩa [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role)/[`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role). Bạn có thể dùng phím <kbd>Tab</kbd> để điều hướng đến nó, sau đó di chuyển giữa các "trang" khác nhau bằng phím con trỏ trái và phải (hoặc lên và xuống), điều này cũng thay đổi trạng thái của các dấu cuộn và nút cuộn liên quan như mong đợi. Các dấu cuộn cũng có thể được di chuyển qua bằng Tab theo cách thông thường.

## Ví dụ

Xem [Tạo băng chuyền CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels) để biết thêm ví dụ sử dụng phần tử giả `::scroll-marker`.

### Tạo dấu cuộn cho băng chuyền

Trong ví dụ này, chúng ta minh họa cách tạo dấu cuộn trên một băng chuyền CSS.

#### HTML

Chúng ta có danh sách {{htmlelement("ul")}} HTML cơ bản với một vài mục danh sách {{htmlelement("li")}}.

```html live-sample___creating-scroll-markers live-sample___custom-numbering
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
  <li>Item 4</li>
  <li>Item 5</li>
  <li>Item 6</li>
  <li>Item 7</li>
  <li>Item 8</li>
</ul>
```

#### CSS

Chúng ta chuyển đổi `<ul>` thành vùng chứa tràn snap cuộn bằng cách đặt {{cssxref("display")}} thành `flex`, tạo ra một hàng đơn không ngắt dòng gồm các phần tử `<li>`. Thuộc tính {{cssxref("overflow-x")}} được đặt thành `auto`, nghĩa là nếu các mục tràn khỏi vùng chứa theo trục x, nội dung sẽ cuộn theo chiều ngang. Sau đó chúng ta chuyển đổi `<ul>` thành [vùng chứa scroll-snap](/en-US/docs/Glossary/Scroll_snap#scroll_snap_container), đảm bảo các mục luôn khớp vào vị trí khi vùng chứa được cuộn với giá trị {{cssxref("scroll-snap-type")}} là `mandatory`.

Chúng ta tạo vùng chứa nhóm dấu cuộn bằng thuộc tính `scroll-marker-group`, đặt nó sau tất cả nội dung.

```css live-sample___creating-scroll-markers live-sample___custom-numbering
ul {
  display: flex;
  gap: 4vw;
  padding-left: 0;
  overflow-x: auto;
  overscroll-behavior-x: contain;
  scroll-snap-type: x mandatory;
  scroll-marker-group: after;
}
```

Tiếp theo, chúng ta tạo kiểu cho các phần tử `<li>`, sử dụng thuộc tính {{cssxref("flex")}} để làm cho chúng chiếm `33%` chiều rộng vùng chứa. Giá trị {{cssxref("scroll-snap-align")}} là `start` làm cho cạnh trái của mục hiển thị ngoài cùng bên trái khớp với cạnh trái của vùng chứa khi nội dung được cuộn.

```css live-sample___creating-scroll-markers live-sample___custom-numbering
li {
  list-style-type: none;
  background-color: #eeeeee;
  flex: 0 0 33%;
  height: 100px;
  padding-top: 20px;
  scroll-snap-align: start;
  text-align: center;
}
```

Sau đó chúng ta sử dụng phần tử giả `::scroll-marker` để tạo dấu hình vuông cho mỗi mục danh sách với viền đỏ:

```css live-sample___creating-scroll-markers
li::scroll-marker {
  content: "";
  border: 1px solid red;
  height: 1em;
  width: 1em;
}
```

Chúng ta cũng áp dụng kiểu cho phần tử giả {{cssxref("::scroll-marker-group")}} để bố cục các dấu cuộn ở giữa hàng với khoảng cách `0.4em` giữa mỗi dấu:

```css live-sample___creating-scroll-markers live-sample___custom-numbering
::scroll-marker-group {
  display: flex;
  gap: 0.4em;
  place-content: center;
}
```

Cuối cùng, chúng ta tạo kiểu khác biệt cho dấu của phần tử đang được cuộn so với các dấu khác, nhắm mục tiêu vào dấu bằng lớp giả {{cssxref(":target-current")}}.

```css live-sample___creating-scroll-markers
::scroll-marker:target-current {
  background: red;
}
```

#### Kết quả

{{EmbedLiveSample("creating-scroll-markers", '', '200')}}

### Đánh số và kiểu dấu cuộn tùy chỉnh

Ví dụ này giống với ví dụ trước, ngoại trừ chúng ta đã áp dụng một số kiểu khác nhau cho các dấu cuộn và sử dụng [bộ đếm CSS](/en-US/docs/Web/CSS/Guides/Lists) để tăng số hiển thị trên mỗi dấu. Sự khác biệt về CSS được giải thích trong phần tiếp theo.

### CSS

Trong ví dụ này, chúng ta đặt tên của bộ đếm muốn tăng trên mỗi `<li>` — `markers` — bằng thuộc tính {{cssxref("counter-increment")}}:

```css live-sample___custom-numbering
li {
  counter-increment: markers;
}
```

Sau đó chúng ta đặt thuộc tính {{cssxref("content")}} của phần tử giả `::scroll-marker` thành hàm {{cssxref("counter()")}}, truyền vào tên bộ đếm `markers` làm đối số. Điều này có tác dụng chèn một số vào mỗi dấu, tự động tăng lên. Phần còn lại của kiểu dáng là cơ bản, nhưng nó minh họa cách các dấu có thể được tạo kiểu hoàn toàn.

```css live-sample___custom-numbering
li::scroll-marker {
  content: counter(markers);
  font-family: sans-serif;
  width: fit-content;
  height: 1em;
  padding: 5px;
  color: black;
  text-decoration: none;
  border: 2px solid rgb(0 0 0 / 0.15);
  border-radius: 0.5em;
  background-color: #eeeeee;
}
```

Để tùy chỉnh thêm, chúng ta thêm hai quy tắc để chọn dấu của mục danh sách đầu tiên và cuối cùng bằng cách chèn {{cssxref(":first-child")}} và {{cssxref(":last-child")}} vào chuỗi bộ chọn tương ứng. Chúng ta đặt nội dung văn bản của dấu đầu tiên là "First" và dấu cuối cùng là "Last".

```css live-sample___custom-numbering
li:first-child::scroll-marker {
  content: "First";
}

li:last-child::scroll-marker {
  content: "Last";
}
```

Để cải thiện trải nghiệm người dùng, chúng ta đặt màu khác cho các dấu khi di chuột qua {{cssxref(":hover")}} và dùng lớp giả `:target-current` để đặt {{cssxref("color")}} và {{cssxref("background-color")}} khác nhau cho dấu của phần tử đang được cuộn để người dùng biết mục nào đang hiển thị:

```css live-sample___custom-numbering
::scroll-marker:hover {
  background-color: #ddcccc;
}

::scroll-marker:target-current {
  background-color: purple;
  color: white;
}
```

#### Kết quả

{{EmbedLiveSample("custom-numbering", '', '220')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("scroll-marker-group")}}
- {{cssxref("scroll-target-group")}}
- {{cssxref("::scroll-button()")}}
- {{cssxref("::scroll-marker-group")}}
- {{cssxref(":target-current")}}
- {{cssxref(":target-before")}}
- {{cssxref(":target-after")}}
- [Tạo băng chuyền CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels)
- Module [Danh sách và bộ đếm CSS](/en-US/docs/Web/CSS/Guides/Lists)
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- [CSS Carousel Gallery](https://chrome.dev/carousel/) qua chrome.dev (2025)
