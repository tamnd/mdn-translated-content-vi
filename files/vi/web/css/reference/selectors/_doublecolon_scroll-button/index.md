---
title: ::scroll-button()
slug: Web/CSS/Reference/Selectors/::scroll-button
page-type: css-pseudo-element
status:
  - experimental
browser-compat: css.selectors.scroll-button
sidebar: cssref
---

{{SeeCompatTable}}

Phần tử giả **`::scroll-button()`** trong [CSS](/en-US/docs/Web/CSS) đại diện cho một nút để điều khiển việc cuộn của {{glossary("scroll container")}}. Chúng được tạo ra trên các scroll container khi giá trị {{cssxref("content")}} của chúng không phải là `none`. Hướng cuộn được xác định bởi giá trị tham số.

## Cú pháp

```css-nolint
::scroll-button(<scroll-button-direction>) {
  /* ... */
}
```

### Tham số

- `<scroll-button-direction>`
  - : Một giá trị đại diện cho hướng nút cuộn bạn muốn chọn. Các giá trị sau đây có sẵn:
    - `*`
      - : Chọn tất cả các nút cuộn của phần tử gốc, cho phép áp dụng kiểu cho mỗi nút trong một quy tắc duy nhất.
    - `down`
      - : Chọn nút sẽ cuộn nội dung xuống dưới.
    - `left`
      - : Chọn nút sẽ cuộn nội dung sang trái.
    - `right`
      - : Chọn nút sẽ cuộn nội dung sang phải.
    - `up`
      - : Chọn nút sẽ cuộn nội dung lên trên.
    - `block-end`
      - : Chọn nút sẽ cuộn nội dung theo hướng block-end.
    - `block-start`
      - : Chọn nút sẽ cuộn nội dung theo hướng block-start.
    - `inline-end`
      - : Chọn nút sẽ cuộn nội dung theo hướng inline-end.
    - `inline-start`
      - : Chọn nút sẽ cuộn nội dung theo hướng inline-start.

    Thông số kỹ thuật cũng định nghĩa hai giá trị khác là `next` và `prev` nhưng chúng hiện không được hỗ trợ trong bất kỳ trình duyệt nào.

## Mô tả

Các phần tử giả `::scroll-button()` được tạo ra bên trong {{glossary("scroll container")}} chỉ khi thuộc tính {{cssxref("content")}} của chúng được đặt thành giá trị khác `none`. Chúng được tạo ra như là anh em của các phần tử DOM con của scroll container, đứng trước chúng và bất kỳ {{cssxref("::scroll-marker-group")}} nào được tạo ra trên container.

Bạn có thể tạo tối đa bốn nút cuộn trên mỗi scroll container, sẽ cuộn nội dung về phía đầu và cuối của các trục block và inline. Đối số của bộ chọn chỉ định hướng cuộn nào được chọn. Bạn cũng có thể chỉ định giá trị `*` để nhắm vào tất cả các phần tử giả `::scroll-button()`, cung cấp kiểu cho tất cả các nút trong một quy tắc duy nhất.

Các nút được tạo ra hoạt động giống như các phần tử {{htmlelement("button")}} thông thường, bao gồm chia sẻ các kiểu mặc định của trình duyệt. Chúng có thể được lấy tiêu điểm, có thể tiếp cận, và có thể được kích hoạt như các nút thông thường. Khi một nút cuộn được nhấn, nội dung của scroll container được cuộn theo hướng đã chỉ định một "trang," hoặc xấp xỉ kích thước của scroll container, tương tự như nhấn phím <kbd>PgUp</kbd> và <kbd>PgDn</kbd>.

Khuyến nghị là thiết lập [CSS scroll snapping](/en-US/docs/Web/CSS/Guides/Scroll_snap) trên scroll container và đặt mỗi mục nội dung riêng biệt mà bạn muốn cuộn đến làm [snap target](/en-US/docs/Glossary/Scroll_snap#snap_target). Trong trường hợp này, việc kích hoạt một nút cuộn sẽ cuộn nội dung đến snap target cách một "trang". Trong khi các nút cuộn sẽ hoạt động mà không có scroll snapping, bạn có thể không đạt được hiệu ứng mong muốn.

Khi không thể cuộn thêm theo hướng của một nút cuộn cụ thể, nút đó sẽ tự động bị vô hiệu hóa, ngược lại nó được kích hoạt. Bạn có thể tạo kiểu cho các nút cuộn ở trạng thái được kích hoạt và vô hiệu hóa bằng cách sử dụng lớp giả {{cssxref(":enabled")}} và {{cssxref(":disabled")}}.

## Ví dụ

Xem [Tạo carousel CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels) để biết thêm ví dụ về carousel.

### Tạo nút cuộn

Trong ví dụ này, chúng tôi trình bày cách tạo nút cuộn trên một carousel CSS.

#### HTML

Chúng tôi có danh sách HTML {{htmlelement("ul")}} cơ bản với một số mục danh sách {{htmlelement("li")}}.

```html live-sample___creating-scroll-buttons live-sample___positioning-scroll-buttons
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

##### Tạo kiểu cho carousel

Chúng tôi chuyển đổi `<ul>` thành carousel bằng cách đặt {{cssxref("display")}} thành `flex`, tạo một hàng `<li>` đơn, không bọc. Thuộc tính {{cssxref("overflow-x")}} được đặt thành `auto`, nghĩa là nếu các mục tràn ra ngoài container trên trục x, nội dung sẽ cuộn theo chiều ngang. Sau đó chúng tôi chuyển đổi `<ul>` thành [scroll-snap container](/en-US/docs/Glossary/Scroll_snap#scroll_snap_container), đảm bảo rằng các mục luôn khớp vào vị trí khi container được cuộn với giá trị {{cssxref("scroll-snap-type")}} là `mandatory`.

```css live-sample___creating-scroll-buttons live-sample___positioning-scroll-buttons
ul {
  display: flex;
  gap: 4vw;
  padding-left: 0;
  overflow-x: auto;
  overscroll-behavior-x: contain;
  scroll-snap-type: x mandatory;
}
```

Tiếp theo, chúng tôi tạo kiểu cho các phần tử `<li>`, sử dụng thuộc tính {{cssxref("flex")}} để làm cho chúng có chiều rộng 100% của container. Giá trị {{cssxref("scroll-snap-align")}} là `start` khiến phía trái của mục bên trái nhất hiển thị khớp với cạnh trái của container khi nội dung được cuộn.

```css live-sample___creating-scroll-buttons live-sample___positioning-scroll-buttons
li {
  list-style-type: none;
  background-color: #eeeeee;
  flex: 0 0 100%;
  height: 100px;
  padding-top: 20px;
  scroll-snap-align: start;
  text-align: center;
}
```

##### Tạo các nút cuộn

Đầu tiên, tất cả các nút cuộn được nhắm vào với một số kiểu cơ bản, cũng như kiểu dựa trên các trạng thái khác nhau. Điều quan trọng là đặt kiểu {{cssxref(":focus")}} cho người dùng bàn phím. Ngoài ra, vì các nút cuộn tự động được đặt thành [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled) khi không thể cuộn thêm theo hướng đó, chúng tôi sử dụng lớp giả {{cssxref(":disabled")}} để nhắm vào trạng thái này.

```css live-sample___creating-scroll-buttons live-sample___positioning-scroll-buttons
ul::scroll-button(*) {
  border: 0;
  font-size: 2rem;
  background: none;
  color: black;
  opacity: 0.7;
  cursor: pointer;
}

ul::scroll-button(*):hover,
ul::scroll-button(*):focus {
  opacity: 1;
}

ul::scroll-button(*):active {
  translate: 1px 1px;
}

ul::scroll-button(*):disabled {
  opacity: 0.2;
  cursor: unset;
}
```

> [!NOTE]
> Chúng tôi cũng đặt giá trị {{cssxref("cursor")}} là `pointer` trên các nút cuộn để làm rõ hơn rằng chúng có thể được tương tác (một cải tiến cho cả [UX](/en-US/docs/Glossary/UX) nói chung và [khả năng tiếp cận nhận thức](/en-US/docs/Web/Accessibility/Guides/Cognitive_accessibility)), hủy đặt khi các nút cuộn ở trạng thái `:disabled`.

Tiếp theo, một biểu tượng phù hợp được đặt trên nút cuộn trái và phải thông qua thuộc tính `content`, đây cũng là điều khiến các nút cuộn được tạo ra:

```css live-sample___creating-scroll-buttons live-sample___positioning-scroll-buttons
ul::scroll-button(left) {
  content: "◄";
}

ul::scroll-button(right) {
  content: "►";
}
```

Chúng tôi không cần đặt [văn bản thay thế](/en-US/docs/Web/CSS/Reference/Properties/content#alternative_text_string_counter_attr) cho các biểu tượng trên `content` vì trình duyệt tự động cung cấp {{glossary("accessible name", "tên có thể tiếp cận")}} phù hợp.

#### Kết quả

{{EmbedLiveSample("creating-scroll-buttons", '', '220')}}

Lưu ý cách các nút cuộn được tạo ra ở góc dưới bên trái trên carousel. Hãy thử nhấn chúng để xem chúng khiến nội dung cuộn như thế nào.

### Định vị các nút cuộn

Ví dụ trước hoạt động, nhưng các nút không được đặt ở vị trí lý tưởng. Trong phần này, chúng tôi sẽ thêm một số CSS để định vị chúng bằng cách sử dụng [định vị anchor](/en-US/docs/Web/CSS/Guides/Anchor_positioning).

#### CSS

Trước tiên, một {{cssxref("anchor-name")}} tham chiếu được đặt trên `<ul>` để định nghĩa nó là một anchor được đặt tên. Tiếp theo, mỗi nút cuộn có {{cssxref("position")}} được đặt thành `absolute` và thuộc tính {{cssxref("position-anchor")}} của nó được đặt thành `anchor-name` của danh sách, để [liên kết cả hai với nhau](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#associating_anchor_and_positioned_elements).

```css live-sample___positioning-scroll-buttons
ul {
  anchor-name: --my-carousel;
}

ul::scroll-button(*) {
  position: absolute;
  position-anchor: --my-carousel;
}
```

Để thực sự định vị mỗi nút cuộn, trước tiên chúng tôi đặt giá trị {{cssxref("align-self")}} là `anchor-center` trên cả hai, để căn giữa chúng theo chiều dọc trên carousel:

```css live-sample___positioning-scroll-buttons
ul::scroll-button(*) {
  align-self: anchor-center;
}
```

Sau đó chúng tôi đặt giá trị trên {{glossary("inset properties")}} của chúng để xử lý định vị ngang. Chúng tôi sử dụng các hàm {{cssxref("anchor()")}} để định vị các cạnh đã chỉ định của các nút tương đối với các cạnh của carousel. Trong mỗi trường hợp, hàm {{cssxref("calc()")}} được sử dụng để thêm một khoảng cách giữa cạnh nút và cạnh carousel. Ví dụ, cạnh phải của nút cuộn trái được định vị 45 pixel về phía phải của cạnh trái của carousel.

```css live-sample___positioning-scroll-buttons
ul::scroll-button(left) {
  right: calc(anchor(left) - 45px);
}

ul::scroll-button(right) {
  left: calc(anchor(right) - 45px);
}
```

#### Kết quả

{{EmbedLiveSample("positioning-scroll-buttons", '', '220')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("scroll-marker-group")}}
- {{cssxref("::scroll-marker-group")}}
- {{cssxref("::scroll-marker")}}
- {{cssxref("::column")}}
- {{cssxref(":target-current")}}
- [Tạo carousel CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels)
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- Module [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- [CSS Carousel Gallery](https://chrome.dev/carousel/) qua chrome.dev (2025)
