---
title: Sử dụng View Transition API
slug: Web/API/View_Transition_API/Using
page-type: guide
---

{{DefaultAPISidebar("View Transition API")}}

Bài viết này giải thích lý thuyết đằng sau cách hoạt động của [View Transition API](/en-US/docs/Web/API/View_Transition_API), cách tạo chuyển đổi khung nhìn và tùy chỉnh animation chuyển đổi, và cách điều khiển các chuyển đổi khung nhìn đang hoạt động. Điều này bao gồm chuyển đổi khung nhìn cho cả các cập nhật trạng thái DOM trong ứng dụng một trang (SPA) và điều hướng giữa các tài liệu trong ứng dụng nhiều trang (MPA).

## Quá trình chuyển đổi khung nhìn

Hãy đi qua quá trình chuyển đổi khung nhìn hoạt động:

1. Chuyển đổi khung nhìn được kích hoạt. Cách thực hiện phụ thuộc vào loại chuyển đổi:
   - Đối với chuyển đổi cùng tài liệu (SPA), chuyển đổi được kích hoạt bằng cách truyền hàm kích hoạt thay đổi DOM làm callback vào phương thức {{domxref("Document.startViewTransition()", "document.startViewTransition()")}}.
   - Đối với chuyển đổi giữa các tài liệu (MPA), chuyển đổi được kích hoạt bằng cách bắt đầu điều hướng đến tài liệu mới. Cả tài liệu hiện tại và tài liệu đích cần có cùng nguồn gốc và opt-in vào chuyển đổi khung nhìn bằng cách bao gồm quy tắc at-rule `@view-transition` trong CSS với bộ mô tả `navigation` là `auto`.
2. Trên khung nhìn hiện tại (trang cũ), API chụp **ảnh chụp** tĩnh của các phần tử có `view-transition-name` được khai báo.
3. Thay đổi khung nhìn xảy ra.
4. API chụp các ảnh chụp "trực tiếp" từ khung nhìn mới.
5. Các ảnh chụp trang cũ hoạt hóa "ra", trong khi các ảnh chụp khung nhìn mới hoạt hóa "vào". Theo mặc định, các ảnh chụp khung nhìn cũ hoạt hóa từ {{cssxref("opacity")}} 1 đến 0, và các ảnh chụp khung nhìn mới hoạt hóa từ `opacity` 0 đến 1, tạo ra hiệu ứng cross-fade.
6. Khi các animation chuyển đổi đạt đến trạng thái kết thúc, promise {{domxref("ViewTransition.finished")}} thực hiện.

## Cây pseudo-element chuyển đổi khung nhìn

Để xử lý việc tạo các animation chuyển đổi đi ra và đi vào, API xây dựng cây pseudo-element với cấu trúc sau:

```plain
::view-transition
└─ ::view-transition-group(root)
  └─ ::view-transition-image-pair(root)
      ├─ ::view-transition-old(root)
      └─ ::view-transition-new(root)
```

- {{cssxref("::view-transition")}} là gốc của lớp phủ chuyển đổi khung nhìn.
- {{cssxref("::view-transition-old()")}} nhắm mục tiêu ảnh chụp tĩnh của phần tử trang cũ.
- {{cssxref("::view-transition-new()")}} nhắm mục tiêu ảnh chụp trực tiếp của phần tử trang mới.

## Tạo chuyển đổi khung nhìn cơ bản

### Chuyển đổi khung nhìn SPA cơ bản

Trong SPA, chuyển đổi khung nhìn được kích hoạt bằng cách truyền hàm cập nhật DOM vào `document.startViewTransition()`:

```js
function updateView(event) {
  const displayNewImage = () => {
    // Cập nhật DOM tại đây
    galleryImg.src = newImageSrc;
    galleryCaption.textContent = newCaption;
  };

  // Phương án dự phòng cho trình duyệt không hỗ trợ View Transitions:
  if (!document.startViewTransition) {
    displayNewImage();
    return;
  }

  // Với View Transitions:
  const transition = document.startViewTransition(() => displayNewImage());
}
```

Mã này đủ để xử lý chuyển đổi giữa các hình ảnh được hiển thị.

### Chuyển đổi khung nhìn MPA cơ bản

Khi tạo chuyển đổi giữa các tài liệu (MPA), không cần JavaScript vì cập nhật khung nhìn được kích hoạt bởi điều hướng giữa các tài liệu. Để kích hoạt chuyển đổi MPA cơ bản, bạn cần chỉ định quy tắc at-rule `@view-transition` trong CSS cho cả tài liệu hiện tại và đích:

```css
@view-transition {
  navigation: auto;
}
```

## Tùy chỉnh animation

Các pseudo-element View Transitions có [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations) mặc định được áp dụng. Bạn có thể sửa đổi các animation mặc định bằng CSS thông thường:

```css
::view-transition-old(root),
::view-transition-new(root) {
  animation-duration: 0.5s;
}
```

Hoặc để tạo animation tùy chỉnh hoàn toàn:

```css
@keyframes move-out {
  from {
    transform: translateY(0%);
  }
  to {
    transform: translateY(-100%);
  }
}

@keyframes move-in {
  from {
    transform: translateY(100%);
  }
  to {
    transform: translateY(0%);
  }
}

::view-transition-old(root) {
  animation: 0.4s ease-in both move-out;
}

::view-transition-new(root) {
  animation: 0.4s ease-in both move-in;
}
```

## Animation khác nhau cho các phần tử khác nhau

Bạn có thể chỉ định `view-transition-name` khác nhau trên các phần tử khác nhau để áp dụng animation riêng biệt:

```css
figcaption {
  view-transition-name: caption;
}

/* Animation cho chú thích */
::view-transition-old(caption) {
  animation: 0.3s ease-out fade-out;
}

::view-transition-new(caption) {
  animation: 0.3s ease-in 0.3s fade-in;
}
```

## Điều khiển chuyển đổi khung nhìn bằng JavaScript

Đối tượng {{domxref("ViewTransition")}} được trả về bởi `document.startViewTransition()` (và `pageswap`/`pagereveal` event objects trong trường hợp MPA) cung cấp nhiều promise để cho phép chạy code khi đạt đến các phần khác nhau của quá trình chuyển đổi.

```js
const transition = document.startViewTransition(() => updateDOM());

// Chạy sau khi DOM được cập nhật
transition.updateCallbackDone.then(() => {
  console.log("DOM updated");
});

// Chạy khi animation sắp bắt đầu
transition.ready.then(() => {
  // Chạy animation tùy chỉnh bằng Web Animations API
  document.documentElement.animate(/* ... */);
});

// Chạy khi animation hoàn thành
transition.finished.then(() => {
  console.log("Transition finished");
});
```

## Bỏ qua chuyển đổi

Bạn có thể bỏ qua chuyển đổi bằng cách gọi `skipTransition()` trên đối tượng `ViewTransition`:

```js
const transition = document.startViewTransition(() => updateDOM());

// Bỏ qua animation (ví dụ nếu người dùng tắt animation)
if (prefersReducedMotion) {
  transition.skipTransition();
}
```

## Chuyển đổi khung nhìn và khả năng tiếp cận

Khi triển khai chuyển đổi khung nhìn, hãy xem xét người dùng có thể muốn tắt animation bằng cách sử dụng `prefers-reduced-motion` media query:

```css
@media (prefers-reduced-motion) {
  ::view-transition-old(root),
  ::view-transition-new(root) {
    animation-duration: 0.001s; /* Ẩn animation nhưng không tắt hoàn toàn */
  }
}
```

## Xem thêm

- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- {{domxref("Document.startViewTransition()")}}
- {{domxref("ViewTransition")}}
