---
title: "ViewTransition: ready property"
short-title: ready
slug: Web/API/ViewTransition/ready
page-type: web-api-instance-property
browser-compat: api.ViewTransition.ready
---

{{APIRef("View Transition API")}}

Thuộc tính chỉ đọc **`ready`** của giao diện {{domxref("ViewTransition")}} là một {{jsxref("Promise")}} được hoàn thành sau khi cây pseudo-element được tạo và hoạt ảnh transition sắp bắt đầu.

`ready` sẽ bị từ chối nếu transition không thể bắt đầu. Điều này có thể do cấu hình sai, ví dụ như trùng lặp {{cssxref("view-transition-name")}}, hoặc nếu callback được truyền cho {{domxref("Document.startViewTransition()")}} ném lỗi hoặc trả về một promise bị từ chối.

## Giá trị

Một Promise.

## Ví dụ

Trong ví dụ sau, `ready` được dùng để kích hoạt một view transition tiết lộ hình tròn tùy chỉnh tỏa ra từ vị trí con trỏ của người dùng khi nhấp, với hoạt ảnh được cung cấp bởi {{domxref("Web Animations API", "Web Animations API", "", "nocode")}}.

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

- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
