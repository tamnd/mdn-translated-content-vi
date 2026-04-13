---
title: "NavigationPrecommitController: phương thức addHandler()"
short-title: addHandler()
slug: Web/API/NavigationPrecommitController/addHandler
page-type: web-api-instance-method
browser-compat: api.NavigationPrecommitController.addHandler
---

{{APIRef("Navigation API")}}

Phương thức **`addHandler()`** của giao diện {{domxref("NavigationPrecommitController")}} cho phép bạn thêm động một hàm callback handler trong code precommit, hàm này sau đó sẽ được chạy sau khi điều hướng đã được commit.

Điều này hữu ích khi quy trình điều hướng phụ thuộc vào thông tin không được biết cho đến khi code precommit bắt đầu chạy. Nếu precommit và (post-commit) handler là độc lập, handler có thể được chỉ định trong đối số [`options.handler`](/en-US/docs/Web/API/NavigateEvent/intercept#handler) được truyền cho {{domxref("NavigateEvent.intercept()")}}.

## Cú pháp

```js-nolint
addHandler(handler);
```

### Tham số

- `handler`
  - : Một hàm callback xác định hành vi xử lý điều hướng post-commit; nó trả về một promise.

    Hàm callback handler được gọi như thể nó được truyền cho phương thức `NavigateEvent.intercept()`, và sẽ chạy sau khi thuộc tính {{domxref("Navigation.currentEntry", "currentEntry")}} đã được cập nhật.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu:
    - {{domxref("NavigateEvent")}} khởi tạo không được chặn hoặc đã bị hủy.
    - {{domxref("Document")}} không hoàn toàn hoạt động.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném nếu thuộc tính {{domxref("Event/isTrusted","isTrusted")}} của sự kiện là `false`.

## Ví dụ

Để biết thêm ví dụ, xem {{domxref("NavigationPrecommitController")}}.

### Cách sử dụng cơ bản

Ví dụ này cho thấy một triển khai `precommitHandler` tải dữ liệu cho một trang và sử dụng `addHandler()` để thêm các handler khác nhau dựa trên loại trang (các triển khai của `fetchConfig`, `setupVideoPlayer()` và `setupArticleView()` không được cung cấp).

```js
navigation.addEventListener("navigate", (event) => {
  event.intercept({
    async precommitHandler(controller) {
      const pageData = await fetchConfig();
      if (pageData.type === "video") {
        controller.addHandler(() => setupVideoPlayer());
      } else {
        controller.addHandler(() => setupArticleView());
      }
    },
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
