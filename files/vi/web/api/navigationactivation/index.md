---
title: NavigationActivation
slug: Web/API/NavigationActivation
page-type: web-api-interface
browser-compat: api.NavigationActivation
---

{{APIRef("Navigation API")}}

Giao diện **`NavigationActivation`** của [Navigation API](/en-US/docs/Web/API/Navigation_API) đại diện cho một điều hướng giữa các tài liệu gần đây. Nó chứa loại điều hướng và các mục lịch sử tài liệu đến và đi.

Đối tượng này được truy cập thông qua các thuộc tính {{domxref("PageSwapEvent.activation")}} và {{domxref("Navigation.activation")}}. Lưu ý rằng trong mỗi trường hợp, `NavigationActivation` đại diện cho một điều hướng khác nhau:

- `Navigation.activation` đại diện cho thông tin về điều hướng đến trang hiện tại.
- `PageSwapEvent.activation` đại diện cho thông tin về điều hướng đến trang tiếp theo.

## Thuộc tính phiên bản

- {{domxref("NavigationActivation.entry", "entry")}} {{ReadOnlyInline}}
  - : Chứa một đối tượng {{domxref("NavigationHistoryEntry")}} đại diện cho mục lịch sử cho tài liệu đến ("to") trong điều hướng. Tương đương với thuộc tính {{domxref("Navigation.currentEntry")}} tại thời điểm tài liệu đến được kích hoạt.
- {{domxref("NavigationActivation.from", "from")}} {{ReadOnlyInline}}
  - : Chứa một đối tượng {{domxref("NavigationHistoryEntry")}} đại diện cho mục lịch sử cho tài liệu đi ("from") trong điều hướng.
- {{domxref("NavigationActivation.navigationType", "navigationType")}} {{ReadOnlyInline}}
  - : Chứa một chuỗi cho biết loại điều hướng.

## Ví dụ

```js
window.addEventListener("pagereveal", async (e) => {
  // If the "from" history entry does not exist, return
  if (!navigation.activation.from) return;

  // Only run this if an active view transition exists
  if (e.viewTransition) {
    const fromUrl = new URL(navigation.activation.from.url);
    const currentUrl = new URL(navigation.activation.entry.url);

    // Went from profile page to homepage
    // ~> Set VT names on the relevant list item
    if (isProfilePage(fromUrl) && isHomePage(currentUrl)) {
      const profile = extractProfileNameFromUrl(fromUrl);

      // Set view-transition-name values on the elements to animate
      document.querySelector(`#${profile} span`).style.viewTransitionName =
        "name";
      document.querySelector(`#${profile} img`).style.viewTransitionName =
        "avatar";

      // Remove names after snapshots have been taken
      // so that we're ready for the next navigation
      await e.viewTransition.ready;
      document.querySelector(`#${profile} span`).style.viewTransitionName =
        "none";
      document.querySelector(`#${profile} img`).style.viewTransitionName =
        "none";
    }

    // Went to profile page
    // ~> Set VT names on the main title and image
    if (isProfilePage(currentUrl)) {
      // Set view-transition-name values on the elements to animate
      document.querySelector(`#detail main h1`).style.viewTransitionName =
        "name";
      document.querySelector(`#detail main img`).style.viewTransitionName =
        "avatar";

      // Remove names after snapshots have been taken
      // so that we're ready for the next navigation
      await e.viewTransition.ready;
      document.querySelector(`#detail main h1`).style.viewTransitionName =
        "none";
      document.querySelector(`#detail main img`).style.viewTransitionName =
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

- [Navigation API](/en-US/docs/Web/API/Navigation_API)
- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
