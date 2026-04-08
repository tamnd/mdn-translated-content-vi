---
title: :active-view-transition-type()
slug: Web/CSS/Reference/Selectors/:active-view-transition-type
page-type: css-pseudo-class
browser-compat: css.selectors.active-view-transition-type
sidebar: cssref
---

Lớp giả hàm **`:active-view-transition-type()`** [CSS](/vi/docs/Web/CSS) [lớp giả](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes) khớp với các phần tử khi một hiệu ứng chuyển cảnh view với một hoặc nhiều kiểu cụ thể đang diễn ra (_active_) và ngừng khớp khi hiệu ứng chuyển cảnh view đã hoàn tất.

```css
html:active-view-transition-type(forwards, backwards) {
  /* ... */
}
```

## Cú pháp

```css-nolint
:active-view-transition-type(<custom-ident>#) {
  /* ... */
}
```

### Tham số

- `<custom-ident>#`
  - : Một hoặc nhiều giá trị {{cssxref("&lt;custom-ident>")}} được phân cách bằng dấu phẩy, đại diện cho các kiểu có thể được áp dụng lên hiệu ứng chuyển cảnh view đang hoạt động để bộ chọn này khớp.

## Mô tả

[Kiểu chuyển cảnh view](/en-US/docs/Web/API/View_Transition_API/Using_types) cung cấp cơ chế cho phép chỉ định các **kiểu** khác nhau cho các hiệu ứng chuyển cảnh view đang hoạt động. Kiểu có thể được đặt trên hiệu ứng chuyển cảnh view theo nhiều cách:

- Đối với hiệu ứng chuyển cảnh view trong cùng tài liệu (SPA), hãy chỉ định kiểu trong tùy chọn [`types`](/en-US/docs/Web/API/Document/startViewTransition#types) của phương thức {{domxref("Document.startViewTransition", "startViewTransition()")}}.
- Đối với hiệu ứng chuyển cảnh view giữa các tài liệu, hãy chỉ định kiểu trong mô tả [`types`](/en-US/docs/Web/CSS/Reference/At-rules/@view-transition#types) của at-rule {{cssxref("@view-transition")}}.
- Bạn cũng có thể sửa đổi kiểu của hiệu ứng chuyển cảnh view đang hoạt động theo thời gian thực thông qua thuộc tính {{domxref("ViewTransition.types", "types")}} của đối tượng `ViewTransition` tương ứng:
  - Đối với hiệu ứng chuyển cảnh view trong cùng tài liệu, đây là đối tượng `ViewTransition` được trả về bởi phương thức `startViewTransition()`.
  - Đối với hiệu ứng chuyển cảnh view giữa các tài liệu, đối tượng `ViewTransition` có thể truy cập qua thuộc tính {{domxref("PageSwapEvent.viewTransition", "viewTransition")}} của đối tượng sự kiện {{domxref("Window.pageswap_event", "pageswap")}} đối với trang đi ra, và thuộc tính {{domxref("PageRevealEvent.viewTransition", "viewTransition")}} của đối tượng sự kiện {{domxref("Window.pagereveal_event", "pagereveal")}} đối với trang đi vào.
  - Bạn cũng có thể truy cập `ViewTransition` đang hoạt động qua thuộc tính {{domxref("Document.activeViewTransition")}}. Đây là cách nhất quán để truy cập hiệu ứng chuyển cảnh view đang hoạt động trong mọi ngữ cảnh.

Sau khi hiệu ứng chuyển cảnh view đang hoạt động có một hoặc nhiều kiểu được đặt trên nó, lớp giả `:active-view-transition-type()` có thể được áp dụng cho phần tử gốc của tài liệu để đặt kiểu tùy chỉnh cho từng loại. Lớp giả nhận một danh sách kiểu được phân cách bằng dấu phẩy làm đối số để chỉ định các kiểu có thể được đặt trên hiệu ứng chuyển cảnh view đang hoạt động để bộ chọn khớp.

Ví dụ, bạn có thể muốn áp dụng các hoạt ảnh chuyển cảnh khác nhau cho phần tử {{htmlelement("img")}} trong ứng dụng thư viện ảnh khi hình ảnh được hiển thị thay đổi, tùy thuộc vào việc bạn đang di chuyển tiến hay lùi trong chuỗi, xóa một hình ảnh hay thêm một hình ảnh vào chuỗi.

### Hành vi OR và AND

Điều quan trọng cần lưu ý là danh sách kiểu được phân cách bằng dấu phẩy được chỉ định bên trong lớp giả `:active-view-transition-type()` cung cấp hành vi OR — nếu một hoặc nhiều kiểu này được đặt trên hiệu ứng chuyển cảnh view đang hoạt động, bộ chọn sẽ khớp.

Ví dụ, trong trường hợp này, bộ chọn sẽ khớp nếu hiệu ứng chuyển cảnh view đang hoạt động có kiểu `forwards`, `backwards`, hoặc cả hai:

```css
html:active-view-transition-type(forwards, backwards) {
  /* ... */
}
```

Nếu bạn muốn chỉ định hành vi AND — tức là tất cả các kiểu phải được đặt để bộ chọn khớp — bạn có thể làm điều đó bằng cách xâu chuỗi nhiều lớp giả `:active-view-transition-type()` lại với nhau. Trong trường hợp sau, bộ chọn chỉ khớp nếu hiệu ứng chuyển cảnh view đang hoạt động có cả kiểu `slide` _và_ `forwards`:

```css
html:active-view-transition-type(slide):active-view-transition-type(forwards) {
  /* ... */
}
```

## Ví dụ

Xem thêm [Sử dụng các kiểu chuyển cảnh view](/en-US/docs/Web/API/View_Transition_API/Using_types) để biết nhiều ví dụ hoàn chỉnh.

### Cách dùng `:active-view-transition-type()` cơ bản

Ví dụ này gồm một tài liệu cơ bản chuyển đổi giữa hai phần nội dung khác nhau thông qua hai nút khác nhau, "Backwards" và "Forwards". Chúng ta minh họa cách sử dụng kiểu chuyển cảnh view để tạo hoạt ảnh khác nhau tùy thuộc vào nút nào được nhấn.

#### HTML

Phần đánh dấu bao gồm một phần tử {{htmlelement("p")}} để chứa nội dung và hai phần tử {{htmlelement("button")}} để kích hoạt các hiệu ứng chuyển cảnh view.

```html live-sample___basic_usage
<p>This is my first piece of content. I hope you like it!</p>
<div>
  <button id="backwards">Backwards</button>
  <button id="forwards">Forwards</button>
</div>
```

#### JavaScript

Trong script, chúng ta tạo tham chiếu đến cả hai nút và đoạn văn nội dung, rồi lưu hai phần nội dung khác nhau vào hai hằng số.

```js live-sample___basic_usage
const backBtn = document.getElementById("backwards");
const fwdBtn = document.getElementById("forwards");
const content = document.querySelector("p");

const first = "This is my first piece of content. I hope you like it!";
const second =
  "This is my second piece of content. Is it better than the first?";
```

Tiếp theo, chúng ta thêm trình lắng nghe sự kiện `click` cho các nút backwards và forwards; khi chúng được nhấn, hàm `changeContent()` sẽ được gọi.

```js live-sample___basic_usage
backBtn.addEventListener("click", changeContent);
fwdBtn.addEventListener("click", changeContent);
```

Cuối cùng, chúng ta định nghĩa hàm `changeContent()`. Chúng ta bắt đầu bằng cách khai báo giá trị `type` để lưu giá trị kiểu chuyển cảnh view. Nếu mục tiêu sự kiện là nút "Backwards", chúng ta đặt `type` thành `backwards`. Nếu không, chúng ta đặt `type` thành `forwards`. Sau đó chúng ta gọi phương thức {{domxref("Document.startViewTransition", "startViewTransition()")}} để cập nhật nội dung và bắt đầu hiệu ứng chuyển cảnh:

- Hàm gọi lại `update` kiểm tra xem `textContent` của đoạn văn có bằng chuỗi `first` hay không. Nếu có, chúng ta đặt nó thành chuỗi `second`. Nếu không, chúng ta đặt nó thành chuỗi `first`.
- Mảng `types` được cho một phần tử: giá trị `type` chúng ta đã khai báo trước đó.

```js live-sample___basic_usage
function changeContent(e) {
  const type = e.target === backBtn ? "backwards" : "forwards";
  document.startViewTransition({
    update() {
      content.textContent === first
        ? (content.textContent = second)
        : (content.textContent = first);
    },
    types: [type],
  });
}
```

#### CSS

Trong các kiểu, chúng ta bắt đầu bằng cách tạo một tập hợp các quy tắc lồng nhau sử dụng lớp giả `:active-view-transition`. Các kiểu này sẽ được áp dụng bất cứ khi nào một hiệu ứng chuyển cảnh view đang hoạt động, bất kể kiểu của chúng là gì. Chúng ta áp dụng {{cssxref("view-transition-name")}} là `none` cho {{cssxref(":root")}}, vì chúng ta không muốn bất kỳ phần tử nào được chụp và tạo hoạt ảnh khi chuyển cảnh ngoại trừ phần tử `<p>`, được đặt `view-transition-name` là `slide`.

```css hidden live-sample___basic_usage
html,
body {
  height: 100%;
}

body {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

div {
  display: flex;
  width: 60%;
  justify-content: space-between;
}

p {
  font-size: 1.7em;
  width: 60%;
  color: blue;
  margin-top: 0;
}
```

```css live-sample___basic_usage
html:active-view-transition {
  :root {
    view-transition-name: none;
  }
  p {
    view-transition-name: slide;
  }
}
```

Tiếp theo, chúng ta sử dụng lớp giả `:active-view-transition-type()` để tạo hai khối kiểu lồng nhau, khối đầu tiên chỉ được áp dụng khi hiệu ứng chuyển cảnh view đang hoạt động có kiểu `forwards`, và khối thứ hai chỉ được áp dụng khi có kiểu `backwards`. Trong mỗi khối, chúng ta sử dụng các phần tử giả {{cssxref("::view-transition-old()")}} và {{cssxref("::view-transition-new()")}} để áp dụng giá trị {{cssxref("animation-name")}} tùy chỉnh cho các view đi ra và đi vào của nhóm chụp `slide`.

Kết quả:

- Khi kiểu chuyển cảnh là `forwards`, view nội dung cũ trượt ra bên trái, và view nội dung mới trượt vào từ bên phải.
- Khi kiểu chuyển cảnh là `backwards`, view nội dung cũ trượt ra bên phải, và view nội dung mới trượt vào từ bên trái.

```css live-sample___basic_usage
html:active-view-transition-type(forwards) {
  &::view-transition-old(slide) {
    animation-name: slide-out-to-left;
  }
  &::view-transition-new(slide) {
    animation-name: slide-in-from-right;
  }
}

html:active-view-transition-type(backwards) {
  &::view-transition-old(slide) {
    animation-name: slide-out-to-right;
  }
  &::view-transition-new(slide) {
    animation-name: slide-in-from-left;
  }
}
```

Cuối cùng, chúng ta sử dụng các khối hoạt ảnh {{cssxref("@keyframes")}} để định nghĩa các hoạt ảnh đã được tham chiếu trước đó.

```css live-sample___basic_usage
@keyframes slide-in-from-left {
  from {
    translate: -100vw 0;
  }
}
@keyframes slide-in-from-right {
  from {
    translate: 100vw 0;
  }
}
@keyframes slide-out-to-left {
  to {
    translate: -100vw 0;
  }
}
@keyframes slide-out-to-right {
  to {
    translate: 100vw 0;
  }
}
```

#### Kết quả

Ví dụ được hiển thị như sau:

{{EmbedLiveSample("basic-usage", "100%", 200)}}

Hãy thử nhấn các nút "Backwards" và "Forwards", và chú ý rằng mặc dù cùng một đoạn mã được sử dụng để kích hoạt cập nhật nội dung và hiệu ứng chuyển cảnh view trong mỗi trường hợp, nhưng một hoạt ảnh khác được sử dụng cho hiệu ứng chuyển cảnh. Điều này là vì một kiểu chuyển cảnh khác được đặt tùy thuộc vào nút nào được nhấn.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.activeViewTransition")}}
- Lớp giả {{CSSXRef(":active-view-transition")}}
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- [Sử dụng View Transition API](/en-US/docs/Web/API/View_Transition_API/Using)
- [Sử dụng các kiểu chuyển cảnh view](/en-US/docs/Web/API/View_Transition_API/Using_types)
