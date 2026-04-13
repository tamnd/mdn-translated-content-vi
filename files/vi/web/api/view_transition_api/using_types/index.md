---
title: Sử dụng các loại chuyển đổi khung nhìn
slug: Web/API/View_Transition_API/Using_types
page-type: guide
---

{{DefaultAPISidebar("View Transition API")}}

Các loại chuyển đổi khung nhìn cung cấp cơ chế để chỉ định các **loại** khác nhau cho các chuyển đổi khung nhìn đang hoạt động. CSS sau đó có thể được sử dụng để áp dụng các animation khác nhau cho các phần tử DOM khi nội dung của chúng cập nhật, tùy thuộc vào loại chuyển đổi được chỉ định. Ví dụ, bạn có thể muốn áp dụng các animation khác nhau cho phần tử {{htmlelement("img")}} trong ứng dụng thư viện ảnh khi ảnh hiển thị thay đổi, tùy thuộc vào việc bạn đang di chuyển về phía trước hay phía sau trong chuỗi, xóa một ảnh hoặc thêm ảnh vào chuỗi.

Bài viết này cho thấy cách sử dụng các loại với chuyển đổi khung nhìn cùng tài liệu và chuyển đổi khung nhìn giữa các tài liệu.

## Ví dụ

Chúng ta sẽ trình bày những gì bạn cần biết về các loại chuyển đổi khung nhìn bằng cách đi qua mã chứa trong ba ví dụ sau:

- [Thư viện loại chuyển đổi SPA](https://mdn.github.io/dom-examples/view-transitions/spa-gallery-transition-types/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/view-transitions/spa-gallery-transition-types)): Thư viện ảnh SPA sử dụng các loại chuyển đổi để áp dụng các animation chuyển đổi khác nhau khi ảnh được di chuyển giữa các nút prev, next và bằng cách nhấp trực tiếp vào ảnh.
- [Ví dụ loại chuyển đổi MPA](https://mdn.github.io/dom-examples/view-transitions/mpa-chapter-nav-transition-types/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/view-transitions/mpa-chapter-nav-transition-types)): Ứng dụng truyện với mỗi chương trên một trang. Thể hiện cách áp dụng animation chuyển đổi khung nhìn giữa các trang có chọn lọc với loại chuyển đổi.
- [Ví dụ nhiều loại chuyển đổi MPA](https://mdn.github.io/dom-examples/view-transitions/mpa-chapter-nav-multiple-transition-types/) ([mã nguồn](https://github.com/mdn/dom-examples/tree/main/view-transitions/mpa-chapter-nav-multiple-transition-types)): Xây dựng trên ví dụ trước bằng cách thể hiện cách áp dụng các animation chuyển đổi khung nhìn khác nhau giữa các trang có chọn lọc với các loại chuyển đổi khác nhau. Loại chuyển đổi được xác định trong quá trình thực thi bằng JavaScript trong quá trình điều hướng.

## Sử dụng các loại với chuyển đổi khung nhìn SPA

Để áp dụng các loại khác nhau cho chuyển đổi khung nhìn SPA, chúng ta truyền tên loại vào lần gọi phương thức {{domxref("Document.startViewTransition()")}} khởi động chuyển đổi. Phương thức có thể nhận một đối tượng làm tham số chứa hàm callback `update` xử lý các cập nhật DOM bạn muốn hoạt hóa và mảng `types` chứa các chuỗi đại diện cho tên loại.

Hãy xem ví dụ từ [thư viện loại chuyển đổi SPA](https://mdn.github.io/dom-examples/view-transitions/spa-gallery-transition-types/) của chúng tôi:

```js
document.startViewTransition({
  update() {
    displayedImage.src = `${baseURL}${images[newId].filename}`;
    displayedImage.alt = images[newId].alt;
    displayedImage.setAttribute("data-id", newId);
    caption.textContent = images[newId].alt;
  },
  types: ["backwards"],
});
```

Khi nút "Previous" được nhấn, mã này được chạy. Hàm callback cập nhật ảnh hiển thị để hiển thị ảnh trước đó trong chuỗi (bao gồm cập nhật alt text, `data-id` đại diện cho số thứ tự và chú thích), và mảng `types` chỉ định rằng chuyển đổi khung nhìn nên được chạy với loại `backwards`.

> [!NOTE]
> Các loại được đặt cho chuyển đổi khung nhìn trong mảng `types` có thể được truy cập thông qua thuộc tính {{domxref("ViewTransition.types", "types")}} của đối tượng {{domxref("ViewTransition")}} được trả về bởi phương thức `startViewTransition()`. Thuộc tính `types` là một {{domxref("ViewTransitionTypeSet")}}. Đây là một [đối tượng giống như Set](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis), có nghĩa là bạn có thể sửa đổi các loại được áp dụng cho chuyển đổi khung nhìn trong quá trình thực thi bằng cách sử dụng các phương thức có sẵn trên nó như `clear()`, `add()` và `delete()`.

### Áp dụng các animation tùy chỉnh trong CSS

Trong CSS, chúng ta có thể tùy chỉnh kiểu cho chuyển đổi đang hoạt động bằng cách sử dụng pseudo-class {{cssxref(":active-view-transition")}} và {{cssxref(":active-view-transition-type()")}}. Tương ứng, chúng cho phép bạn tạo các bộ chọn khớp khi có bất kỳ chuyển đổi khung nhìn nào đang hoạt động, hoặc chỉ khi chuyển đổi khung nhìn với loại nhất định đang hoạt động.

Đầu tiên, chúng ta định nghĩa một loạt các kiểu được áp dụng khi chuyển đổi khung nhìn đang hoạt động, bất kể loại của nó, được chọn bằng `:active-view-transition`. Trong khối lồng này, chúng ta áp dụng giá trị `view-transition-name` là `none` cho phần tử {{cssxref(":root")}} của tài liệu để tắt chuyển đổi cho phần lớn tài liệu. Sau đó, chúng ta áp dụng các giá trị `view-transition-name` là `image` và `caption` cho các phần tử {{htmlelement("img")}} và {{htmlelement("figcaption")}} tương ứng, để các thay đổi trạng thái DOM của chúng được chụp trong các ảnh riêng biệt và chúng có thể được hoạt hóa độc lập.

Cuối cùng, chúng ta sử dụng pseudo-element {{cssxref("::view-transition-old()")}} và {{cssxref("::view-transition-new()")}} để áp dụng các animation cụ thể cho khung nhìn `caption` đi ra và vào. Chúng ta muốn các animation này được áp dụng cho `<figcaption>` bất kể loại được chỉ định.

```css
html:active-view-transition {
  :root {
    view-transition-name: none;
  }
  .displayed-img {
    view-transition-name: image;
  }
  figcaption {
    view-transition-name: caption;
  }

  &::view-transition-old(caption) {
    animation-name: fade-out;
  }
  &::view-transition-new(caption) {
    animation-name: fade-in;
    animation-delay: 0.6s;
  }
}
```

Bước tiếp theo là áp dụng các animation khác nhau cho khung nhìn `image` đi ra và vào, tùy thuộc vào `type` của chuyển đổi khung nhìn đang hoạt động là `forwards` (nút "Next" được nhấn), `backwards` (nút "Previous" được nhấn) hay `upwards` (ảnh thu nhỏ được nhấp vào). Điều này được thực hiện bằng cách sử dụng ba bộ quy tắc `:active-view-transition-type()`, mỗi bộ áp dụng các giá trị {{cssxref("animation-name")}} khác nhau cho pseudo-element `::view-transition-old()` và `::view-transition-new()` cho mỗi loại riêng biệt:

```css
html:active-view-transition-type(forwards) {
  &::view-transition-old(image) {
    animation-name: slide-out-to-left;
  }
  &::view-transition-new(image) {
    animation-name: slide-in-from-right;
  }
}

html:active-view-transition-type(backwards) {
  &::view-transition-old(image) {
    animation-name: slide-out-to-right;
  }
  &::view-transition-new(image) {
    animation-name: slide-in-from-left;
  }
}

html:active-view-transition-type(upwards) {
  &::view-transition-old(image) {
    animation-name: slide-out-to-top;
  }
  &::view-transition-new(image) {
    animation-name: slide-in-from-top;
    animation-delay: 0.6s;
  }
}
```

Trong trường hợp animation `::view-transition-new(image)` cho loại `upwards`, chúng ta cũng đã thêm giá trị {{cssxref("animation-delay")}} là `0.6s` để ngăn nội dung mới trượt vào từ trên cùng của màn hình cho đến khi nội dung cũ đã trượt xong. Nếu hai animation chồng chéo lên nhau trong trường hợp này, trông sẽ kỳ lạ.

Tiếp tục trong stylesheet, chúng ta đặt {{cssxref("animation-duration")}} của tất cả animation trong tất cả nhóm thành `0.6s`, giải thích tại sao độ trễ được đặt trước là `0.6s`:

```css
::view-transition-group(*) {
  animation-duration: 0.6s;
}
```

> [!NOTE]
> Vì ngắn gọn, chúng tôi không hiển thị tất cả mã định nghĩa {{cssxref("@keyframes")}} cho các animation được tham chiếu ở trên. Bạn có thể tìm thấy chúng trong [mã nguồn](https://github.com/mdn/dom-examples/tree/main/view-transitions/spa-gallery-transition-types).

## Sử dụng các loại với chuyển đổi khung nhìn giữa các tài liệu qua `@view-transition`

Để áp dụng các loại khác nhau cho chuyển đổi khung nhìn giữa các tài liệu, bạn có thể đặt chúng trong bộ mô tả [`types`](/en-US/docs/Web/CSS/Reference/At-rules/@view-transition#types) của at-rule {{cssxref("@view-transition")}} chứa một hoặc nhiều loại được phân cách bằng dấu phẩy.

Ví dụ, trong [ví dụ loại chuyển đổi MPA](https://mdn.github.io/dom-examples/view-transitions/mpa-chapter-nav-transition-types/) của chúng tôi, at-rule `@view-transition` trong stylesheet dùng chung trông như sau:

```css
@view-transition {
  navigation: auto;
  types: slide;
}
```

Trong CSS, chúng ta có thể tùy chỉnh các animation được áp dụng cho chuyển đổi khung nhìn đang hoạt động dựa trên loại của nó theo cách tương tự như chúng ta đã làm trong ví dụ SPA:

```css
html:active-view-transition-type(slide) {
  :root {
    view-transition-name: none;
  }
  section {
    view-transition-name: chapter;
  }
  &::view-transition-old(chapter) {
    animation-name: slide-out-to-left;
  }
  &::view-transition-new(chapter) {
    animation-name: slide-in-from-right;
  }
}
```

Ở đây chúng ta áp dụng nhiều kiểu khi chuyển đổi khung nhìn đang hoạt động có `type` là `slide` bằng cách sử dụng bộ chọn `:active-view-transition-type(slide)`. Chúng ta áp dụng `view-transition-name` là `none` cho phần tử `:root` để ngăn chụp ảnh, sau đó ghi đè bằng `view-transition-name` là `chapter` được đặt trên phần tử `<section>` của trang. Đây là phần duy nhất của tài liệu mà chúng ta muốn áp dụng chuyển đổi khung nhìn.

Tiếp theo, chúng ta sử dụng `::view-transition-old(chapter)` và `::view-transition-new(chapter)` để áp dụng các animation tùy chỉnh cho `<section>` khi nội dung của nó chuyển đổi giữa các trang.

## Áp dụng các loại giữa các tài liệu khác nhau bằng sự kiện `pageswap` và `pagereveal`

Cách trên hoạt động ổn, nhưng không lý tưởng. Khi điều hướng đến trang mới, nội dung trang cũ luôn biến mất về phía trái và nội dung trang mới luôn xuất hiện từ phía phải. Animation này ổn khi bạn đang chuyển đến chương sau, nhưng (ít nhất với người dùng ngôn ngữ từ trái sang phải như tiếng Anh) nó cảm thấy không trực quan khi chuyển đến chương trước. Đối với các chuyển động từ chương sau về chương trước, tốt hơn là đảo ngược hướng animation.

Để áp dụng các loại khác nhau cho chuyển đổi khung nhìn đang hoạt động dựa trên các loại điều hướng khác nhau, chúng ta cần điều khiển thuộc tính {{domxref("ViewTransition.types", "types")}} của đối tượng `ViewTransition` tương ứng. Điều này có sẵn trong:

- Thuộc tính đối tượng sự kiện {{domxref("PageSwapEvent.viewTransition")}} của sự kiện {{domxref("Window.pageswap_event", "pageswap")}} trong trường hợp trang đi.
- Thuộc tính đối tượng sự kiện {{domxref("PageRevealEvent.viewTransition")}} của sự kiện {{domxref("Window.pagereveal_event", "pagereveal")}} trong trường hợp trang đến.

[Ví dụ nhiều loại chuyển đổi MPA](https://mdn.github.io/dom-examples/view-transitions/mpa-chapter-nav-multiple-transition-types/) thể hiện cách sử dụng kỹ thuật này. Điều này tương tự như ví dụ trước, nhưng có một số điểm khác biệt đáng chú ý, mà chúng ta sẽ giải thích bên dưới.

### Xác định loại animation qua JavaScript

Hãy xem file JavaScript dùng chung. Đầu tiên, chúng ta định nghĩa hàm tùy chỉnh `determineTransitionType()`, nhìn vào URL của trang đi và trang đến và từ đó xác định liệu loại điều hướng là `backwards` (chuyển đến chương trước) hay `forwards` (chuyển đến chương sau).

Các trang chương được đặt tên tuần tự (`index.html`, sau đó `index2.html`, `index3.html`, v.v.), do đó, chúng ta so sánh số chứa trong tên file để xem điều hướng là `backwards` (số trang đi cao hơn số trang đến) hay `forwards` (số trang đi thấp hơn số trang đến).

Mã bạn sử dụng để xác định loại áp dụng sẽ phụ thuộc vào dự án của bạn. Bạn có thể tìm thấy các bình luận chi tiết giải thích cách mã bên dưới hoạt động trong [mã nguồn](https://github.com/mdn/dom-examples/tree/main/view-transitions/mpa-chapter-nav-multiple-transition-types) của chúng tôi.

```js
const determineTransitionType = (oldNavigationEntry, newNavigationEntry) => {
  const currentURL = oldNavigationEntry.url;
  const destinationURL = newNavigationEntry.url;

  function determinePageIndex(url) {
    const array = url.split("/");
    const slug = array[array.length - 1];
    if (slug.indexOf("html") === -1) {
      return 0;
    }
    const pageIndex = slug.replace("index", "").replace(".html", "");
    if (pageIndex === "") {
      return 0;
    }
    return parseInt(pageIndex, 10);
  }

  const currentPageIndex = determinePageIndex(currentURL);
  const destinationPageIndex = determinePageIndex(destinationURL);

  if (currentPageIndex > destinationPageIndex) {
    return "backwards";
  } else if (currentPageIndex < destinationPageIndex) {
    return "forwards";
  }
};
```

Tiếp theo, chúng ta sử dụng trình lắng nghe sự kiện {{domxref("Window.pageswap_event", "pageswap")}} để đặt loại chuyển đổi cho trang đi. Bên trong hàm xử lý sự kiện, chúng ta lấy các mục điều hướng cũ và mới từ thuộc tính {{domxref("PageSwapEvent.activation", "activation")}} của đối tượng sự kiện, truyền chúng vào hàm `determineTransitionType()` để xác định loại, sau đó gán loại cho chuyển đổi khung nhìn bằng phương thức `add()` của thuộc tính {{domxref("ViewTransition.types")}}.

```js
window.addEventListener("pageswap", async (e) => {
  const transitionType = determineTransitionType(
    e.activation.from,
    e.activation.entry,
  );

  console.log(`pageSwap: ${transitionType}`);
  e.viewTransition.types.add(transitionType);
});
```

Cuối cùng, chúng ta sử dụng trình lắng nghe sự kiện {{domxref("Window.pagereveal_event", "pagereveal")}} để đặt loại chuyển đổi cho trang đến. Bên trong hàm xử lý sự kiện, chúng ta lấy các mục điều hướng cũ và mới từ thuộc tính {{domxref("Navigation.activation")}} và truyền chúng vào hàm `determineTransitionType()` để xác định loại. Chúng ta gán loại cho chuyển đổi khung nhìn bằng phương thức `add()` của thuộc tính {{domxref("ViewTransition.types")}}, trừ khi loại là `undefined`, trong trường hợp đó chúng ta bỏ qua bước đó.

```js
window.addEventListener("pagereveal", async (e) => {
  const transitionType = determineTransitionType(
    navigation.activation.from,
    navigation.activation.entry,
  );

  console.log(`pageReveal: ${transitionType}`);
  if (transitionType !== undefined) {
    e.viewTransition.types.add(transitionType);
  }
});
```

> [!NOTE]
> Hàm `determineTransitionType()` có thể trả về `undefined` nếu cả điều kiện `backwards` hay `forwards` đều không đúng. Điều này có thể xảy ra nếu người dùng tải lại trang, trong trường hợp đó trang hiện tại và trang đích là cùng một trang, do đó các giá trị chỉ số giống nhau.

### Áp dụng animation tùy chỉnh trong CSS

Bây giờ chúng ta đã có loại phù hợp được đặt cho chuyển đổi khung nhìn đang hoạt động tùy thuộc vào loại điều hướng, chúng ta có thể đặt các animation khác nhau cho mỗi loại trong CSS của mình, theo cách tương tự như chúng ta đã thấy trong các ví dụ trước:

```css
html:active-view-transition {
  nav {
    view-transition-name: none;
  }
  section {
    view-transition-name: chapter;
  }
}

html:active-view-transition-type(forwards) {
  &::view-transition-old(chapter) {
    animation-name: slide-out-to-left;
  }
  &::view-transition-new(chapter) {
    animation-name: slide-in-from-right;
  }
}

html:active-view-transition-type(backwards) {
  &::view-transition-old(chapter) {
    animation-name: slide-out-to-right;
  }
  &::view-transition-new(chapter) {
    animation-name: slide-in-from-left;
  }
}
```

Lưu ý rằng chúng ta cũng đã xóa bộ mô tả `types` khỏi at-rule `@view-transition` trong CSS dùng chung. Chúng ta cần bộ mô tả `navigation` để kích hoạt chuyển đổi khung nhìn giữa các tài liệu, nhưng chúng ta xử lý các loại trong JavaScript, vì vậy chúng ta không cần đặt chúng ở đây.

```css
@view-transition {
  navigation: auto;
}
```

## Xem thêm

- [View transition API](/en-US/docs/Web/API/View_Transition_API)
- [Handle multiple view transition styles with view transition types (SPA)](https://developer.chrome.com/docs/web-platform/view-transitions/same-document#view-transition-types) trên developer.chrome.com (2024)
- [View transition types in cross-document view transitions](https://developer.chrome.com/docs/web-platform/view-transitions/cross-document#view-transition-types) trên developer.chrome.com (2024)
