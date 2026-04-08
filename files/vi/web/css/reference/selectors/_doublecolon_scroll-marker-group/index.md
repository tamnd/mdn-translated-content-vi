---
title: ::scroll-marker-group
slug: Web/CSS/Reference/Selectors/::scroll-marker-group
page-type: css-pseudo-element
status:
  - experimental
browser-compat: css.selectors.scroll-marker-group
sidebar: cssref
---

{{SeeCompatTable}}

Phần tử giả **`::scroll-marker-group`** trong [CSS](/en-US/docs/Web/CSS) được tạo ra bên trong một {{glossary("scroll container")}} và chứa bất kỳ phần tử giả {{cssxref("::scroll-marker")}} nào được tạo ra trên các phần tử con của vùng chứa cuộn.

## Cú pháp

```css-nolint
::scroll-marker-group {
  /* ... */
}
```

## Mô tả

Phần tử giả **`::scroll-marker-group`** của vùng chứa cuộn đại diện cho một **vùng chứa nhóm dấu cuộn**. Đây là vùng chứa tự động chứa bất kỳ phần tử giả {{cssxref("::scroll-marker")}} nào được tạo ra trên bản thân nó hoặc các phần tử con. Điều này cho phép chúng được định vị và tạo kiểu như một nhóm. Phần tử giả này thường được dùng khi tạo băng chuyền CSS để cung cấp chỉ báo vị trí cuộn. Các dấu cuộn riêng lẻ có thể được dùng để điều hướng đến các mục nội dung liên quan.

Vùng chứa cuộn phải có thuộc tính {{cssxref("scroll-marker-group")}} được đặt thành giá trị khác `none` để phần tử giả `::scroll-marker-group` được tạo ra. Giá trị {{cssxref("scroll-marker-group")}} xác định vị trí của vùng chứa nhóm dấu cuộn trong thứ tự tab và thứ tự hộp bố cục của băng chuyền (nhưng không phải cấu trúc DOM) — `before` đặt nó ở đầu, trong khi `after` đặt nó ở cuối.

> [!NOTE]
> Ngoài ra, vùng chứa nhóm dấu cuộn có thể được tạo từ một phần tử hiện có chứa tập hợp các phần tử {{htmlelement("a")}} bằng cách dùng {{cssxref("scroll-target-group")}}.

Theo thực hành tốt nhất về khả năng tiếp cận, hãy khớp vị trí hiển thị trực quan của vùng chứa nhóm dấu cuộn với thứ tự tab. Khi định vị nhóm ở đầu nội dung, đặt nó ở đầu thứ tự tab bằng cách dùng `before`. Khi định vị nhóm ở cuối nội dung, đặt nó ở cuối thứ tự tab bằng cách dùng `after`.

Khi vùng chứa nhóm dấu cuộn được tạo trên vùng chứa cuộn bằng thuộc tính `scroll-marker-group`, vùng chứa cuộn được hiển thị với ngữ nghĩa [`tablist`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tablist_role)/[`tab`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role). Bạn có thể dùng phím <kbd>Tab</kbd> để điều hướng đến nó, sau đó di chuyển giữa các "trang" khác nhau bằng phím con trỏ trái và phải (hoặc lên và xuống), điều này cũng thay đổi trạng thái của các dấu cuộn và nút cuộn liên quan như mong đợi. Các dấu cuộn cũng có thể được di chuyển qua bằng Tab theo cách thông thường.

## Ví dụ

Xem [Tạo băng chuyền CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels) để biết thêm ví dụ sử dụng phần tử giả `::scroll-marker`.

### Tạo dấu cuộn cho băng chuyền

Bản demo này là một băng chuyền gồm các trang đơn, với mỗi mục chiếm toàn bộ trang. Chúng ta đã thêm dấu cuộn để cho phép người dùng điều hướng đến bất kỳ trang nào bằng cách nhấp vào dấu.

#### HTML

HTML gồm một [danh sách không có thứ tự](/en-US/docs/Web/HTML/Reference/Elements/ul), với mỗi [mục danh sách](/en-US/docs/Web/HTML/Reference/Elements/li) chứa một số nội dung mẫu:

```html live-sample___carousel-example live-sample___carousel-example_final
<ul>
  <li>
    <h2>Page 1</h2>
  </li>
  <li>
    <h2>Page 2</h2>
  </li>
  <li>
    <h2>Page 3</h2>
  </li>
  <li>
    <h2>Page 4</h2>
  </li>
</ul>
```

#### CSS

Trước tiên chúng ta chuyển đổi `<ul>` thành băng chuyền bằng cách đặt {{cssxref("display")}} thành `flex`, tạo ra một hàng đơn không ngắt dòng gồm các phần tử `<li>`. Thuộc tính {{cssxref("overflow-x")}} được đặt thành `auto`, nghĩa là nếu các mục tràn khỏi vùng chứa theo trục x, nội dung sẽ cuộn theo chiều ngang. Sau đó chúng ta chuyển đổi `<ul>` thành [vùng chứa scroll-snap](/en-US/docs/Glossary/Scroll_snap#scroll_snap_container), đảm bảo các mục luôn khớp vào vị trí khi vùng chứa được cuộn với giá trị {{cssxref("scroll-snap-type")}} là `mandatory`.

```css hidden live-sample___carousel-example live-sample___carousel-example_final
* {
  box-sizing: border-box;
}

body {
  margin: 0;
  font-family: "Helvetica", "Arial", sans-serif;
}
```

```css live-sample___carousel-example live-sample___carousel-example_final
ul {
  display: flex;
  gap: 4vw;
  padding-left: 0;
  overflow-x: auto;
  overscroll-behavior-x: contain;
  scroll-snap-type: x mandatory;
}
```

Tiếp theo, chúng ta tạo kiểu cho các phần tử `<li>`, sử dụng thuộc tính {{cssxref("flex")}} để làm cho chúng chiếm `100%` chiều rộng vùng chứa. Giá trị {{cssxref("scroll-snap-align")}} là `start` làm cho cạnh trái của mục hiển thị ngoài cùng bên trái khớp với cạnh trái của vùng chứa khi nội dung được cuộn.

```css live-sample___carousel-example live-sample___carousel-example_final
li {
  list-style-type: none;
  background-color: #eeeeee;
  flex: 0 0 100%;
  height: 200px;
  padding-top: 20px;
  scroll-snap-align: start;
  text-align: center;
}
```

Tiếp theo, thuộc tính {{cssxref("scroll-marker-group")}} của danh sách được đặt thành `after`, vì vậy phần tử giả `::scroll-marker-group` được đặt sau nội dung DOM của danh sách trong thứ tự tab và thứ tự hộp bố cục; điều này có nghĩa là nó xuất hiện sau các nút cuộn:

```css live-sample___carousel-example live-sample___carousel-example_final
ul {
  scroll-marker-group: after;
}
```

Tiếp theo, phần tử giả `::scroll-marker-group` của danh sách được bố cục bằng flexbox, với giá trị {{cssxref("justify-content")}} là `center` và {{cssxref("gap")}} là `20px` để các phần tử con (các phần tử giả {{cssxref("::scroll-marker")}}) được căn giữa bên trong `::scroll-marker-group` với khoảng cách giữa mỗi cái.

```css live-sample___carousel-example live-sample___carousel-example_final
ul::scroll-marker-group {
  display: flex;
  justify-content: center;
  gap: 20px;
}
```

Tiếp theo, các dấu cuộn được tạo kiểu. Giao diện của mỗi dấu được xử lý bằng cách đặt {{cssxref("width")}}, {{cssxref("height")}}, {{cssxref("background-color")}}, {{cssxref("border")}} và {{cssxref("border-radius")}}, nhưng chúng ta cũng cần đặt giá trị khác `none` cho thuộc tính {{cssxref("content")}} để chúng thực sự được tạo ra.

```css live-sample___carousel-example live-sample___carousel-example_final
li::scroll-marker {
  width: 16px;
  height: 16px;
  background-color: transparent;
  border: 2px solid black;
  border-radius: 50%;
  content: "";
}
```

> [!NOTE]
> Nội dung được tạo ra mặc định là inline; chúng ta có thể áp dụng `width` và `height` cho các dấu cuộn vì chúng được bố cục như các flex item.

Cuối cùng, lớp giả {{cssxref(":target-current")}} được dùng để chọn dấu cuộn tương ứng với "trang" đang hiển thị, làm nổi bật mức độ người dùng đã cuộn qua nội dung. Trong trường hợp này, chúng ta đặt `background-color` thành `black` để nó được tạo kiểu như một hình tròn được tô đầy.

```css live-sample___carousel-example live-sample___carousel-example_final
li::scroll-marker:target-current {
  background-color: black;
}
```

#### Kết quả

{{EmbedLiveSample("carousel-example", "100%", "280px")}}

### Định vị vùng chứa nhóm dấu cuộn bằng định vị neo

Ví dụ này mở rộng ví dụ trước, minh họa việc sử dụng [định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning) để định vị vùng chứa nhóm dấu cuộn tương đối với băng chuyền.

#### CSS

Phần tử giả `::scroll-marker-group` của danh sách được định vị tương đối với băng chuyền bằng định vị neo CSS bằng cách đặt cho nhóm một giá trị {{cssxref("position-anchor")}} khớp với {{cssxref("anchor-name")}} của `<ul>`. Sau đó chúng ta định vị nhóm tương đối với vùng chứa cuộn theo hướng block bằng cách đặt giá trị {{cssxref("top")}} bao gồm hàm {{cssxref("anchor()")}}. Chúng ta cũng thêm giá trị {{cssxref("justify-self")}} là `anchor-center`, căn chỉnh nhóm theo tâm của vùng chứa cuộn theo hướng inline.

```css live-sample___carousel-example_final
ul {
  anchor-name: --my-carousel;
}

ul::scroll-marker-group {
  /* From the previous example */
  display: flex;
  gap: 20px;

  position: absolute;
  position-anchor: --my-carousel;
  top: calc(anchor(bottom) - 70px);
  justify-self: anchor-center;
}
```

#### Kết quả

{{EmbedLiveSample("carousel-example_final", "100%", "260px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("scroll-marker-group")}}
- {{cssxref("scroll-target-group")}}
- {{cssxref("::scroll-button()")}}
- {{cssxref("::scroll-marker")}}
- {{cssxref("::column")}}
- {{cssxref(":target-current")}}
- {{cssxref(":target-before")}}
- {{cssxref(":target-after")}}
- [Tạo băng chuyền CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels)
- Module [định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- [CSS Carousel Gallery](https://chrome.dev/carousel/) qua chrome.dev (2025)
