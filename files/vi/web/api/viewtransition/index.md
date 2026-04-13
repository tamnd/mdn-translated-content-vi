---
title: ViewTransition
slug: Web/API/ViewTransition
page-type: web-api-interface
browser-compat: api.ViewTransition
---

{{APIRef("View Transition API")}}

Giao diện **`ViewTransition`** của {{domxref("View Transition API", "View Transition API", "", "nocode")}} đại diện cho một view transition đang hoạt động, cung cấp chức năng để phản ứng khi transition đạt đến các trạng thái khác nhau (ví dụ: sẵn sàng chạy hoạt ảnh, hoặc hoạt ảnh đã hoàn thành) hoặc bỏ qua transition hoàn toàn.

Kiểu đối tượng này được cung cấp theo các cách sau:

- Qua thuộc tính {{domxref("Document.activeViewTransition")}}. Đây cung cấp cách nhất quán để truy cập view transition đang hoạt động trong bất kỳ ngữ cảnh nào, mà không phải lo lắng về việc lưu nó để dễ dàng truy cập sau.
- Trong trường hợp các transition cùng tài liệu (SPA), nó cũng được trả về bởi phương thức {{domxref("Document.startViewTransition()", "document.startViewTransition()")}}.
- Trong trường hợp các transition liên tài liệu (MPA), nó cũng được cung cấp:
  - Trong trang đang rời đi qua thuộc tính {{domxref("PageSwapEvent.viewTransition")}} của đối tượng sự kiện {{domxref("Window.pageswap_event", "pageswap")}}.
  - Trong trang đến qua thuộc tính {{domxref("PageRevealEvent.viewTransition")}} của đối tượng sự kiện {{domxref("Window.pagereveal_event", "pagereveal")}}.

Khi một view transition được kích hoạt bởi lệnh gọi `startViewTransition()` (hoặc điều hướng trang trong trường hợp MPA transitions), một chuỗi các bước được thực hiện như được giải thích trong [Quá trình view transition](/en-US/docs/Web/API/View_Transition_API/Using#the_view_transition_process). Điều này cũng giải thích khi nào các promise khác nhau được hoàn thành.

## Thuộc tính phiên bản

- {{domxref("ViewTransition.finished")}} {{ReadOnlyInline}}
  - : Một {{jsxref("Promise")}} được hoàn thành khi hoạt ảnh transition kết thúc và chế độ xem trang mới hiển thị và có thể tương tác với người dùng.
- {{domxref("ViewTransition.ready")}} {{ReadOnlyInline}}
  - : Một {{jsxref("Promise")}} được hoàn thành sau khi cây pseudo-element được tạo và hoạt ảnh transition sắp bắt đầu.
- {{domxref("ViewTransition.types")}} {{ReadOnlyInline}}
  - : Một {{domxref("ViewTransitionTypeSet")}} cho phép các kiểu được đặt trên view transition được truy cập và sửa đổi.
- {{domxref("ViewTransition.updateCallbackDone")}} {{ReadOnlyInline}}
  - : Một {{jsxref("Promise")}} được hoàn thành khi promise được trả về bởi callback của phương thức {{domxref("Document.startViewTransition()", "document.startViewTransition()")}} được hoàn thành.

## Phương thức phiên bản

- {{domxref("ViewTransition.skipTransition", "skipTransition()")}}
  - : Bỏ qua phần hoạt ảnh của view transition, nhưng không bỏ qua việc chạy callback {{domxref("Document.startViewTransition()", "document.startViewTransition()")}} cập nhật DOM.

## Ví dụ

Trong ví dụ SPA sau, promise {{domxref("ViewTransition.ready")}} được dùng để kích hoạt một view transition tiết lộ hình tròn tùy chỉnh tỏa ra từ vị trí con trỏ của người dùng khi nhấp, với hoạt ảnh được cung cấp bởi {{domxref("Web Animations API", "Web Animations API", "", "nocode")}}.

```js
// Store the last click event
let lastClick;
addEventListener("click", (event) => (lastClick = event));

function spaNavigate(data) {
  // Fallback for browsers that don't support this API:
  if (!document.startViewTransition) {
    updateTheDOMSomehow(data);
    return;
  }

  // Get the click position, or fallback to the middle of the screen
  const x = lastClick?.clientX ?? innerWidth / 2;
  const y = lastClick?.clientY ?? innerHeight / 2;
  // Get the distance to the furthest corner
  const endRadius = Math.hypot(
    Math.max(x, innerWidth - x),
    Math.max(y, innerHeight - y),
  );

  // Create a transition:
  const transition = document.startViewTransition(() => {
    updateTheDOMSomehow(data);
  });

  // Wait for the pseudo-elements to be created:
  transition.ready.then(() => {
    // Animate the root's new view
    document.documentElement.animate(
      {
        clipPath: [
          `circle(0 at ${x}px ${y}px)`,
          `circle(${endRadius}px at ${x}px ${y}px)`,
        ],
      },
      {
        duration: 500,
        easing: "ease-in",
        // Specify which pseudo-element to animate
        pseudoElement: "::view-transition-new(root)",
      },
    );
  });
}
```

Hoạt ảnh này cũng yêu cầu CSS sau để tắt hoạt ảnh CSS mặc định và ngăn các trạng thái xem cũ và mới hòa trộn theo bất kỳ cách nào:

```css
::view-transition-image-pair(root) {
  isolation: auto;
}

::view-transition-old(root),
::view-transition-new(root) {
  animation: none;
  mix-blend-mode: normal;
  display: block;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
- [Using the View Transition API](/en-US/docs/Web/API/View_Transition_API/Using)
- [Using view transition types](/en-US/docs/Web/API/View_Transition_API/Using_types)
- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
