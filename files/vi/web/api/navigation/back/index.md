---
title: "Navigation: phương thức back()"
short-title: back()
slug: Web/API/Navigation/back
page-type: web-api-instance-method
browser-compat: api.Navigation.back
---

{{APIRef("Navigation API")}}

Phương thức **`back()`** của
giao diện {{domxref("Navigation")}} điều hướng lùi lại một mục trong lịch sử điều hướng.

## Cú pháp

```js-nolint
back(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `info` {{optional_inline}}
      - : Thông tin do nhà phát triển định nghĩa để truyền cùng với sự kiện {{domxref("Navigation/navigate_event", "navigate")}}, có sẵn trong {{domxref("NavigateEvent.info")}}. Đây có thể là bất kỳ kiểu dữ liệu nào. Ví dụ, bạn có thể muốn hiển thị nội dung được điều hướng đến với một animation khác nhau tùy thuộc vào cách nó được điều hướng tới (vuốt trái, vuốt phải, hoặc về trang chủ). Một chuỗi chỉ ra animation nào cần dùng có thể được truyền vào dưới dạng `info`.

### Giá trị trả về

Một đối tượng với các thuộc tính sau:

- `committed`
  - : Một {{jsxref("Promise")}} sẽ được thực hiện khi URL hiển thị đã thay đổi và một {{domxref("NavigationHistoryEntry")}} mới đã được tạo.
- `finished`
  - : Một {{jsxref("Promise")}} sẽ được thực hiện khi tất cả các promise được trả về bởi trình xử lý `intercept()` đều được thực hiện. Điều này tương đương với promise {{domxref("NavigationTransition.finished")}} được thực hiện, khi sự kiện {{domxref("Navigation/navigatesuccess_event", "navigatesuccess")}} kích hoạt.

Một trong hai promise này sẽ bị từ chối nếu việc điều hướng thất bại vì lý do nào đó.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị {{domxref("NavigationHistoryEntry.index")}} của {{domxref("Navigation.currentEntry")}} là -1 hoặc 0, tức là Document hiện tại chưa được kích hoạt, hoặc mục lịch sử hiện tại là mục đầu tiên trong lịch sử, nghĩa là không thể điều hướng lùi, hoặc nếu Document hiện tại đang bị gỡ bỏ.

## Ví dụ

```js
async function backHandler() {
  if (navigation.canGoBack) {
    await navigation.back().finished;
    // Handle any required clean-up after
    // navigation has finished
  } else {
    displayBanner("You are on the first page");
  }
}

async function forwardHandler() {
  if (navigation.canGoForward) {
    await navigation.forward().finished;
    // Handle any required clean-up after
    // navigation has finished
  } else {
    displayBanner("You are on the last page");
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
