---
title: scroll-marker-group
slug: Web/CSS/Reference/Properties/scroll-marker-group
page-type: css-property
status:
  - experimental
browser-compat: css.properties.scroll-marker-group
sidebar: cssref
---

{{seecompattable}}

Thuộc tính **`scroll-marker-group`** của [CSS](/en-US/docs/Web/CSS) kiểm soát việc một phần tử {{glossary("scroll container")}} có tạo ra phần tử giả {{cssxref("::scroll-marker-group")}} hay không. Nếu có, thuộc tính này cũng chỉ định liệu nhóm scroll marker nên được đặt `before` hay `after` nội dung của vùng chứa nhóm scroll trong thứ tự hiển thị và tab mặc định.

> [!NOTE]
> Để tạo vùng chứa nhóm scroll marker từ một phần tử hiện có chứa tập hợp các phần tử {{htmlelement("a")}}, hãy sử dụng thuộc tính {{cssxref("scroll-target-group")}}. Đọc thêm về [sự khác biệt trong hành vi](/en-US/docs/Web/CSS/Reference/Properties/scroll-target-group#differences_between_scroll-target-group_and_scroll-marker-group) giữa hai thuộc tính này.

## Cú pháp

```css
/* Giá trị đơn */
scroll-marker-group: before;
scroll-marker-group: after;
scroll-marker-group: none;

/* Giá trị toàn cục */
scroll-marker-group: inherit;
scroll-marker-group: initial;
scroll-marker-group: revert;
scroll-marker-group: revert-layer;
scroll-marker-group: unset;
```

### Giá trị

- `after`
  - : Một phần tử giả {{cssxref("::scroll-marker-group")}} được tạo ra như một anh em của các phần tử DOM con của scroll container, ngay đứng trước chúng, và bất kỳ phần tử giả {{cssxref("::scroll-button()")}} nào được tạo ra. Nó xuất hiện ở cuối thứ tự tab và thứ tự hộp bố cục của vùng chứa (nhưng không phải cấu trúc DOM).

- `before`
  - : Một phần tử giả `::scroll-marker-group` được tạo ra như một anh em của các phần tử DOM con của scroll container, ngay đứng trước chúng, và bất kỳ phần tử giả {{cssxref("::scroll-button()")}} nào được tạo ra. Nhóm scroll marker xuất hiện ở đầu thứ tự tab và thứ tự hộp bố cục của vùng chứa.

- `none`
  - : Không có phần tử giả `::scroll-marker-group` nào được tạo ra trên phần tử này. Đây là giá trị mặc định.

> [!NOTE]
> Theo thực tiễn tốt nhất về khả năng tiếp cận, hãy khớp vị trí hiển thị của vùng chứa nhóm scroll marker với thứ tự tab. Khi định vị nhóm marker ở đầu nội dung bằng các kiểu áp dụng cho {{cssxref("::scroll-marker-group")}}, hãy đặt nó ở đầu thứ tự tab bằng `before`. Khi định vị nhóm ở cuối nội dung, hãy đặt nó ở cuối thứ tự tab bằng `after`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Xem [Tạo carousel bằng CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels) để biết các ví dụ đầy đủ sử dụng thuộc tính `scroll-marker-group`.

### Vị trí của scroll markers

Trong ví dụ này, chúng ta minh họa ba giá trị của thuộc tính `scroll-marker-group`.

#### HTML

Chúng ta có một danh sách HTML {{htmlelement("ul")}} cơ bản với một số mục danh sách {{htmlelement("li")}}.

```html hidden
<fieldset>
  <legend>Select <code>scroll-marker-group</code> value:</legend>
  <label><input type="radio" name="p" value="before" />before</label>
  <label><input type="radio" name="p" value="after" checked />after</label>
  <label><input type="radio" name="p" value="none" />none</label>
</fieldset>
```

```html
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

Chúng ta chuyển đổi `<ul>` thành carousel bằng cách đặt {{cssxref("display")}} thành `flex`, tạo một hàng đơn không xuống dòng của các phần tử `<li>`. Thuộc tính {{cssxref("overflow-x")}} được đặt thành `auto`, nghĩa là nếu các mục tràn ra ngoài vùng chứa trên trục x, nội dung sẽ cuộn theo chiều ngang. Sau đó chúng ta chuyển đổi `<ul>` thành [scroll-snap container](/en-US/docs/Glossary/Scroll_snap#scroll_snap_container), đảm bảo các mục luôn bắt vào vị trí khi vùng chứa được cuộn với giá trị {{cssxref("scroll-snap-type")}} là `mandatory`.

Chúng ta tạo vùng chứa nhóm scroll marker bằng thuộc tính `scroll-marker-group`, đặt nhóm sau tất cả nội dung.

```css
ul {
  display: flex;
  gap: 4vw;
  padding-left: 0;
  margin: 32px 0;
  overflow-x: auto;
  overscroll-behavior-x: contain;
  scroll-snap-type: x mandatory;

  scroll-marker-group: after;
}
```

Tiếp theo, chúng ta tạo kiểu cho các phần tử `<li>`, sử dụng thuộc tính {{cssxref("flex")}} để làm cho chúng chiếm `33%` chiều rộng của vùng chứa. Giá trị {{cssxref("scroll-snap-align")}} là `start` làm cho cạnh bên trái của mục hiển thị bên trái nhất bắt vào cạnh trái của vùng chứa khi nội dung được cuộn.

```css
li {
  list-style-type: none;
  background-color: #eeeeee;
  flex: 0 0 33%;
  scroll-snap-align: start;
  text-align: center;
  line-height: 5;
}
```

Sau đó chúng ta sử dụng phần tử giả {{cssxref("::scroll-marker")}} để tạo marker hình vuông cho mỗi mục danh sách với viền đỏ, và áp dụng kiểu cho phần tử giả {{cssxref("::scroll-marker-group")}} để bố cục các scroll marker theo hàng ngang với khoảng cách `0.2em` giữa mỗi cái.

```css
li::scroll-marker {
  content: " ";
  border: 1px solid red;
  height: 1em;
  width: 1em;
}

::scroll-marker-group {
  display: flex;
  gap: 0.2em;
}
```

Cuối cùng, để đảm bảo trải nghiệm người dùng tốt, chúng ta tạo kiểu cho marker của phần tử đang được cuộn khác với các phần tử còn lại, nhắm vào marker bằng lớp giả {{cssxref(":target-current")}}.

```css
::scroll-marker:target-current {
  background: red;
}
```

```css hidden
fieldset {
  width: 20em;
}

label {
  font-family: monospace;
  display: block;
}

:has([value="before"]:checked) ul {
  scroll-marker-group: before;
}
:has([value="after"]:checked) ul {
  scroll-marker-group: after;
}

:has([value="none"]:checked) ul {
  scroll-marker-group: none;
}
```

#### Kết quả

{{EmbedLiveSample("Examples", '', '300')}}

Lưu ý vị trí của vùng chứa nhóm scroll marker. Hãy kiểm tra cách thứ tự tab bàn phím khác nhau giữa `before` và `after`, và lưu ý cách nhóm biến mất khi giá trị được đặt thành `none`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("scroll-target-group")}}
- {{cssxref("::scroll-button()")}}
- {{cssxref("::scroll-marker-group")}}
- {{cssxref("::scroll-marker")}}
- {{cssxref(":target-current")}}
- {{cssxref(":target-before")}}
- {{cssxref(":target-after")}}
- [Tạo carousel bằng CSS](/en-US/docs/Web/CSS/Guides/Overflow/Carousels)
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- [CSS Carousel Gallery](https://chrome.dev/carousel/) qua chrome.dev (2025)
