---
title: PageSwapEvent
slug: Web/API/PageSwapEvent
page-type: web-api-interface
browser-compat: api.PageSwapEvent
---

{{APIRef("HTML DOM")}}

Đối tượng sự kiện **`PageSwapEvent`** được cung cấp bên trong các hàm xử lý cho sự kiện {{domxref("Window.pageswap_event", "pageswap")}}.

Sự kiện `pageswap` được kích hoạt khi bạn điều hướng qua các tài liệu, khi tài liệu trước sắp được tải xuống. Trong quá trình điều hướng giữa các tài liệu, đối tượng sự kiện `PageSwapEvent` cho phép bạn thao tác với [chuyển đổi view](/en-US/docs/Web/API/View_Transition_API) liên quan (cung cấp quyền truy cập vào đối tượng {{domxref("ViewTransition")}} liên quan) từ tài liệu đang được điều hướng _từ_, nếu chuyển đổi view được kích hoạt bởi điều hướng. Nó cũng cung cấp quyền truy cập vào thông tin về loại điều hướng và các tài liệu hiện tại và đích.

## Hàm khởi tạo

- {{domxref("PageSwapEvent.PageSwapEvent", "PageSwapEvent()")}}
  - : Tạo một thực thể đối tượng `PageSwapEvent` mới.

## Thuộc tính phiên bản

- {{domxref("PageSwapEvent.activation", "activation")}} {{ReadOnlyInline}}
  - : Chứa một đối tượng {{domxref("NavigationActivation")}} chứa loại điều hướng và các mục lịch sử tài liệu hiện tại và đích cho một điều hướng cùng nguồn gốc. Nếu điều hướng có URL nguồn gốc chéo ở bất kỳ đâu trong chuỗi chuyển hướng, nó trả về `null`.
- {{domxref("PageSwapEvent.viewTransition", "viewTransition")}} {{ReadOnlyInline}}
  - : Chứa một đối tượng {{domxref("ViewTransition")}} đại diện cho chuyển đổi view đang hoạt động cho điều hướng giữa các tài liệu.

## Ví dụ

```js
window.addEventListener("pageswap", async (e) => {
  // Only run this if an active view transition exists
  if (e.viewTransition) {
    const currentUrl = e.activation.from?.url
      ? new URL(e.activation.from.url)
      : null;
    const targetUrl = new URL(e.activation.entry.url);

    // Going from profile page to homepage
    // ~> The big img and title are the ones!
    if (isProfilePage(currentUrl) && isHomePage(targetUrl)) {
      // Set view-transition-name values on the elements to animate
      document.querySelector(`#detail main h1`).style.viewTransitionName =
        "name";
      document.querySelector(`#detail main img`).style.viewTransitionName =
        "avatar";

      // Remove view-transition-names after snapshots have been taken
      // Stops naming conflicts resulting from the page state persisting in BFCache
      await e.viewTransition.finished;
      document.querySelector(`#detail main h1`).style.viewTransitionName =
        "none";
      document.querySelector(`#detail main img`).style.viewTransitionName =
        "none";
    }

    // Going to profile page
    // ~> The clicked items are the ones!
    if (isProfilePage(targetUrl)) {
      const profile = extractProfileNameFromUrl(targetUrl);

      // Set view-transition-name values on the elements to animate
      document.querySelector(`#${profile} span`).style.viewTransitionName =
        "name";
      document.querySelector(`#${profile} img`).style.viewTransitionName =
        "avatar";

      // Remove view-transition-names after snapshots have been taken
      // Stops naming conflicts resulting from the page state persisting in BFCache
      await e.viewTransition.finished;
      document.querySelector(`#${profile} span`).style.viewTransitionName =
        "none";
      document.querySelector(`#${profile} img`).style.viewTransitionName =
        "none";
    }
  }
});
```

> [!NOTE]
> Xem [Danh sách thành viên nhóm Chrome DevRel](https://view-transitions.chrome.dev/profiles/mpa/) cho demo trực tiếp mà code này được lấy từ đó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
