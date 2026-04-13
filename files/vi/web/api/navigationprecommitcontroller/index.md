---
title: NavigationPrecommitController
slug: Web/API/NavigationPrecommitController
page-type: web-api-interface
browser-compat: api.NavigationPrecommitController
---

{{APIRef("Navigation API")}}

Giao diện **`NavigationPrecommitController`** của {{domxref("Navigation API", "Navigation API", "", "nocode")}} được truyền vào như một đối số cho một hàm callback [precommit handler](/en-US/docs/Web/API/NavigateEvent/intercept#precommithandler) của điều hướng.

Hàm callback được sử dụng để xử lý bất kỳ sửa đổi nào đối với điều hướng cần thiết trước khi nó được commit (và URL đích thực sự được hiển thị trong trình duyệt), chẳng hạn như hủy hoặc chuyển hướng đến nơi khác nếu cần. Giao diện này cung cấp các phương thức để chuyển hướng đến URL mới và cập nhật lịch sử và trạng thái, cũng như để cấu hình động hành vi điều hướng sau commit.

{{InheritanceDiagram}}

## Phương thức phiên bản

- {{domxref("NavigationPrecommitController/addHandler", "addHandler()")}}
  - : Thêm một hàm callback handler sẽ được chạy sau khi điều hướng đã được commit, như thể nó đã được thêm vào {{domxref("NavigateEvent.intercept()")}} bằng đối số [`options.handler`](/en-US/docs/Web/API/NavigateEvent/intercept#handler).
- {{domxref("NavigationPrecommitController.redirect", "redirect()")}}
  - : Chuyển hướng trình duyệt đến một URL được chỉ định và xác định hành vi lịch sử cùng bất kỳ thông tin trạng thái nào mong muốn.

## Mô tả

Khi chỉ định hành vi điều hướng cùng tài liệu thông qua phương thức {{domxref("NavigateEvent.intercept()")}}, có thể chỉ định các hành động precommit điều hướng thông qua callback [`precommitHandler`](/en-US/docs/Web/API/NavigateEvent/intercept#precommithandler). Các hành động precommit được sử dụng để sửa đổi hoặc hủy điều hướng đang diễn ra, hoặc thực hiện công việc trong khi điều hướng đang diễn ra và trước khi nó được commit (xem [Ví dụ điều hướng precommit cơ bản](#ví_dụ_điều_hướng_precommit_cơ_bản)).

Để chỉ định hành vi chuyển hướng, bạn sử dụng đối tượng `NavigationPrecommitController` được truyền vào hàm callback `precommitHandler` của bạn. Bên trong thân hàm, bạn có thể gọi phương thức `NavigationPrecommitController.redirect()`, nhận làm đối số một đối tượng chứa URL chuyển hướng, cộng với bất kỳ hành vi lịch sử và thông tin trạng thái cần thiết.

Sau khi một điều hướng được commit, một hàm callback post-commit handler có thể được chạy để thực hiện các thao tác như tải và kết xuất nội dung. Nếu code điều hướng post-commit phụ thuộc vào dữ liệu được thu thập tại runtime trong `precommitHandler` của bạn, bạn có thể gọi {{domxref("NavigationPrecommitController/addHandler", "addHandler()")}} trong precommit handler của bạn để thêm động hàm callback post-commit handler này. Lưu ý rằng nếu code post-commit độc lập với code pre-commit, bạn có thể thay vào đó truyền callback [`handler`](/en-US/docs/Web/API/NavigateEvent/intercept#handler) cho phương thức {{domxref("NavigateEvent.intercept()")}}.

Xem [mô tả `intercept()`](/en-US/docs/Web/API/NavigateEvent/intercept#description) để biết thêm ngữ cảnh.

## Ví dụ

### Ví dụ điều hướng precommit cơ bản

Đoạn code sau đây cho thấy cách bạn sẽ chuyển hướng trình duyệt đến trang đăng nhập nếu người dùng điều hướng đến một trang bị hạn chế mà họ chưa đăng nhập.

```js
navigation.addEventListener("navigate", (event) => {
  const url = new URL(event.destination.url);

  if (url.pathname.startsWith("/restricted/") && !userSignedIn) {
    event.intercept({
      async precommitHandler(controller) {
        controller.redirect("/signin/", {
          state: "signin-redirect",
          history: "push",
        });
      },
    });
  }
});
```

Pattern này đơn giản hơn so với cách thay thế là hủy điều hướng gốc và bắt đầu một điều hướng mới đến vị trí chuyển hướng, vì nó tránh lộ ra trạng thái trung gian. Ví dụ: chỉ một sự kiện {{domxref("Navigation.navigatesuccess_event", "navigatesuccess")}} hoặc {{domxref("Navigation.navigateerror_event", "navigateerror")}} được kích hoạt, và nếu điều hướng được kích hoạt bởi một lệnh gọi đến {{domxref("Navigation.navigate()")}}, promise chỉ hoàn thành khi đích chuyển hướng được đạt đến.

### Thêm handler có điều kiện dựa trên hành vi precommit

Đây là một sửa đổi nhỏ của ví dụ trước, cũng hiển thị thông báo cho người dùng chỉ ra lý do họ đến trang đăng nhập sau khi chuyển hướng. Điều này sử dụng `addHandler()` trong pre-commit handler để thêm post-commit handler hiển thị thông báo.

```js
navigation.addEventListener("navigate", (event) => {
  const url = new URL(event.destination.url);

  if (url.pathname.startsWith("/restricted/") && !userSignedIn) {
    event.intercept({
      async precommitHandler(controller) {
        controller.redirect("/signin/", {
          state: "signin-redirect",
          history: "push",
        });

        // Use addHandler to trigger logic once the /signin/ page commits
        controller.addHandler(() => {
          showMessage("Please sign in to view that content.");
        });
      },
    });
  }
});
```

Một lợi ích của cách tiếp cận này là handler chỉ chạy nếu việc chuyển hướng được commit. Handler sẽ chạy cho tất cả các sự kiện nếu nó được thêm bằng cách truyền [`options.handler`](/en-US/docs/Web/API/NavigateEvent/intercept) cho `intercept()`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
