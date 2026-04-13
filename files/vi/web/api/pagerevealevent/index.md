---
title: PageRevealEvent
slug: Web/API/PageRevealEvent
page-type: web-api-interface
browser-compat: api.PageRevealEvent
---

{{APIRef("HTML DOM")}}

Đối tượng sự kiện **`PageRevealEvent`** có sẵn bên trong các hàm xử lý cho sự kiện {{domxref("Window.pagereveal_event", "pagereveal")}}.

Trong quá trình điều hướng giữa các tài liệu, nó cho phép bạn thao tác một [view transition](/en-US/docs/Web/API/View_Transition_API) liên quan (cung cấp quyền truy cập vào đối tượng {{domxref("ViewTransition")}} có liên quan) từ tài liệu đang được điều hướng _đến_, nếu một view transition được kích hoạt bởi điều hướng.

Bên ngoài view transitions, sự kiện này cũng hữu ích cho các trường hợp như kích hoạt hoạt hình khởi động hoặc báo cáo lượt xem trang.

## Hàm khởi tạo

- {{domxref("PageRevealEvent.PageRevealEvent", "PageRevealEvent()")}}
  - : Tạo một phiên bản đối tượng `PageRevealEvent` mới.

## Thuộc tính phiên bản

- {{domxref("PageRevealEvent.viewTransition", "viewTransition")}} {{ReadOnlyInline}}
  - : Chứa một đối tượng {{domxref("ViewTransition")}} đại diện cho view transition đang hoạt động cho điều hướng giữa các tài liệu.

## Ví dụ

```js
window.addEventListener("pagereveal", async (e) => {
  // Nếu mục nhập lịch sử "từ" không tồn tại, hãy trả về
  if (!navigation.activation.from) return;

  // Chỉ chạy điều này nếu view transition đang hoạt động tồn tại
  if (e.viewTransition) {
    const fromUrl = new URL(navigation.activation.from.url);
    const currentUrl = new URL(navigation.activation.entry.url);

    // Đã đi từ trang hồ sơ đến trang chủ
    // ~> Đặt tên VT trên mục danh sách liên quan
    if (isProfilePage(fromUrl) && isHomePage(currentUrl)) {
      const profile = extractProfileNameFromUrl(fromUrl);

      document.querySelector(`#${profile} span`).style.viewTransitionName =
        "name";
      document.querySelector(`#${profile} img`).style.viewTransitionName =
        "avatar";

      await e.viewTransition.ready;
      document.querySelector(`#${profile} span`).style.viewTransitionName =
        "none";
      document.querySelector(`#${profile} img`).style.viewTransitionName =
        "none";
    }

    // Đã đến trang hồ sơ
    // ~> Đặt tên VT trên tiêu đề chính và ảnh
    if (isProfilePage(currentUrl)) {
      document.querySelector(`#detail main h1`).style.viewTransitionName =
        "name";
      document.querySelector(`#detail main img`).style.viewTransitionName =
        "avatar";

      await e.viewTransition.ready;
      document.querySelector(`#detail main h1`).style.viewTransitionName =
        "none";
      document.querySelector(`#detail main img`).style.viewTransitionName =
        "none";
    }
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [View Transition API](/en-US/docs/Web/API/View_Transition_API)
