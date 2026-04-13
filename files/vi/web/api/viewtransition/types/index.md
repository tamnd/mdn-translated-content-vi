---
title: "ViewTransition: types property"
short-title: types
slug: Web/API/ViewTransition/types
page-type: web-api-instance-property
browser-compat: api.ViewTransition.types
---

{{APIRef("View Transition API")}}

Thuộc tính chỉ đọc **`types`** của giao diện {{domxref("ViewTransition")}} là một {{domxref("ViewTransitionTypeSet")}} cho phép các [kiểu](/en-US/docs/Web/API/View_Transition_API/Using_types) được đặt trên view transition được truy cập và sửa đổi.

## Giá trị

Một {{domxref("ViewTransitionTypeSet")}}. Đây là một [đối tượng giống Set](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis), có nghĩa là bạn có thể sửa đổi các kiểu được áp dụng cho view transition ngay lập tức bằng các phương thức có sẵn trên nó như `clear()`, `add()`, và `delete()`.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này bao gồm một tài liệu cơ bản chuyển đổi giữa hai nội dung khác nhau. Chúng tôi cung cấp ba nút, mỗi nút kích hoạt transition, nhưng với `type` khác nhau để áp dụng loại hoạt ảnh khác nhau cho transition.

#### HTML

Phần markup bao gồm một phần tử {{htmlelement("p")}} để chứa nội dung và ba phần tử {{htmlelement("button")}} để kích hoạt view transition.

```html live-sample___basic_usage
<p>This is my first piece of content. I hope you like it!</p>
<div>
  <button id="default">Default</button>
  <button id="slide">Slide</button>
  <button id="flip">Flip</button>
</div>
```

#### JavaScript

Trong script, chúng ta tạo tham chiếu đến các nút và đoạn văn nội dung, sau đó lưu trữ hai nội dung khác nhau trong hai hằng số.

```js live-sample___basic_usage
const defaultBtn = document.getElementById("default");
const slideBtn = document.getElementById("slide");
const flipBtn = document.getElementById("flip");
const content = document.querySelector("p");

const first = "This is my first piece of content. I hope you like it!";
const second =
  "This is my second piece of content. Is it better than the first?";
```

Tiếp theo, chúng ta thêm trình nghe sự kiện `click` vào các nút; khi chúng được nhấp, hàm `changeContent()` được chạy.

```js live-sample___basic_usage
defaultBtn.addEventListener("click", changeContent);
slideBtn.addEventListener("click", changeContent);
flipBtn.addEventListener("click", changeContent);
```

Cuối cùng, chúng ta định nghĩa hàm `changeContent()`. Chúng ta bắt đầu bằng cách gọi phương thức {{domxref("Document.startViewTransition", "startViewTransition()")}} để cập nhật nội dung và bắt đầu transition, lưu đối tượng `ViewTransition` được trả về vào hằng số `vt`. Bên trong `startViewTransition()`, callback `update` kiểm tra xem `textContent` của đoạn văn có bằng chuỗi `first` không. Nếu vậy, chúng ta đặt nó thành chuỗi `second`. Nếu không, chúng ta đặt nó thành chuỗi `first`.

Trong phần thứ hai của hàm `changeContent()`, chúng ta kiểm tra giá trị của mục tiêu sự kiện `click`:

- Nếu là nút "Slide", chúng ta thêm kiểu `slide` vào các kiểu view transition đang hoạt động bằng `vt.types.add("slide")`.
- Nếu là nút "Flip", chúng ta thêm kiểu `flip` vào các kiểu view transition đang hoạt động bằng `vt.types.add("flip")`.
- Chúng ta không làm gì nếu nút "Default" được nhấn. Trong trường hợp này, chúng ta muốn sử dụng hoạt ảnh cross-fade mặc định của view transition.

```js live-sample___basic_usage
function changeContent(e) {
  const vt = document.startViewTransition({
    update() {
      content.textContent === first
        ? (content.textContent = second)
        : (content.textContent = first);
    },
  });

  if (e.target === slideBtn) {
    vt.types.add("slide");
  } else if (e.target === flipBtn) {
    vt.types.add("flip");
  }
}
```

#### CSS

Trong các kiểu, chúng ta bắt đầu bằng cách tạo một tập hợp các quy tắc lồng nhau bằng pseudo-class `:active-view-transition`. Các kiểu này sẽ được áp dụng bất cứ khi nào một view transition đang hoạt động, bất kể kiểu của chúng. Chúng ta áp dụng `view-transition-name` là `none` cho {{cssxref(":root")}}, vì chúng ta không muốn bất kỳ phần tử nào được chụp và tạo hoạt ảnh khi transition ngoại trừ phần tử `<p>`, được đặt `view-transition-name` là `content`.

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
  background-color: white;
  margin-top: 0;
}
```

```css live-sample___basic_usage
html:active-view-transition {
  :root {
    view-transition-name: none;
  }
  p {
    view-transition-name: content;
  }
}
```

Tiếp theo, chúng ta sử dụng pseudo-class `:active-view-transition-type()` để tạo hai khối kiểu lồng nhau, khối đầu chỉ được áp dụng khi view transition đang hoạt động có kiểu `slide`, và khối thứ hai chỉ được áp dụng khi view transition đang hoạt động có kiểu `flip`. Trong mỗi khối, chúng ta sử dụng các pseudo-element {{cssxref("::view-transition-old()")}} và {{cssxref("::view-transition-new()")}} để áp dụng các giá trị `animation-name` tùy chỉnh cho các chế độ xem đi ra và đến của nhóm chụp.

Kết quả là:

- Khi kiểu transition là `slide`, nội dung cũ trượt ra sang trái, và nội dung mới trượt vào từ phải.
- Khi kiểu transition là `flip`, nội dung cũ xoay ngang đến 90 độ để không còn hiển thị, và nội dung mới xoay ngược lại vào.
- Trong bất kỳ trường hợp nào khác, hoạt ảnh cross-fade transition mặc định được sử dụng.

```css live-sample___basic_usage
html:active-view-transition-type(slide) {
  &::view-transition-old(content) {
    animation-name: slide-out-to-left;
  }
  &::view-transition-new(content) {
    animation-name: slide-in-from-right;
  }
}

html:active-view-transition-type(flip) {
  &::view-transition-old(content) {
    animation-name: flip-out;
  }
  &::view-transition-new(content) {
    animation-name: flip-in;
    animation-delay: 0.6s;
  }
}
```

Cuối cùng, chúng ta sử dụng các khối hoạt ảnh {{cssxref("@keyframes")}} để định nghĩa các hoạt ảnh được tham chiếu trước đó. Chúng ta cũng đặt `animation-duration` tùy chỉnh trên tất cả các nhóm chụp, để làm chậm hoạt ảnh transition xuống một chút.

```css live-sample___basic_usage
@keyframes slide-out-to-left {
  to {
    translate: -100vw 0;
  }
}
@keyframes slide-in-from-right {
  from {
    translate: 100vw 0;
  }
}

@keyframes flip-out {
  to {
    rotate: x 90deg;
  }
}
@keyframes flip-in {
  from {
    rotate: x -90deg;
  }
}

::view-transition-group(*) {
  animation-duration: 0.6s;
}
```

#### Kết quả

Ví dụ được hiển thị như sau:

{{EmbedLiveSample("basic-usage", "100%", 200)}}

Hãy thử nhấp vào từng nút và lưu ý rằng các thay đổi DOM giống hệt nhau trong mỗi trường hợp, nhưng hoạt ảnh thì khác nhau. Điều này là do một kiểu transition khác được đặt tùy thuộc vào nút nào được nhấn (hoặc không có kiểu transition trong trường hợp "Default").

### Ví dụ ứng dụng

Xem [ví dụ MPA multiple transition types](https://mdn.github.io/dom-examples/view-transitions/mpa-chapter-nav-multiple-transition-types/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/view-transitions/mpa-chapter-nav-multiple-transition-types)), minh họa cách áp dụng các hoạt ảnh khác nhau cho view transitions liên tài liệu tùy thuộc vào kiểu điều hướng, được đại diện bởi các kiểu transition khác nhau. Kiểu transition được xác định ngay lập tức bằng JavaScript trong quá trình điều hướng.

[Applying different cross-document types using pageswap and pagereveal events](/en-US/docs/Web/API/View_Transition_API/Using_types#applying_different_cross-document_types_using_pageswap_and_pagereveal_events) cung cấp hướng dẫn về ví dụ này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ViewTransitionTypeSet")}}
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- [Using the View Transition API](/en-US/docs/Web/API/View_Transition_API/Using)
- [Using view transition types](/en-US/docs/Web/API/View_Transition_API/Using_types)
- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
