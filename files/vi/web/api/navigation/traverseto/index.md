---
title: "Navigation: phương thức traverseTo()"
short-title: traverseTo()
slug: Web/API/Navigation/traverseTo
page-type: web-api-instance-method
browser-compat: api.Navigation.traverseTo
---

{{APIRef("Navigation API")}}

Phương thức **`traverseTo()`** của giao diện {{domxref("Navigation")}} điều hướng đến {{domxref("NavigationHistoryEntry")}} được xác định bởi {{domxref("NavigationHistoryEntry.key", "key")}} đã cho.

## Cú pháp

```js-nolint
traverseTo(key)
traverseTo(key, options)
```

### Tham số

- `key`
  - : `key` của {{domxref("NavigationHistoryEntry")}} để điều hướng tới.
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
  - : Được ném ra nếu giá trị {{domxref("NavigationHistoryEntry.index")}} của {{domxref("Navigation.currentEntry")}} là -1, có nghĩa là Document hiện tại chưa được kích hoạt, hoặc nếu danh sách lịch sử điều hướng không chứa {{domxref("NavigationHistoryEntry")}} với key được chỉ định, hoặc nếu Document hiện tại đang bị gỡ bỏ.

## Ví dụ

### Thiết lập nút trang chủ

```js
function initHomeBtn() {
  // Get the key of the first loaded entry
  // so the user can always go back to this view.
  const { key } = navigation.currentEntry;
  backToHomeButton.onclick = () => {
    navigation.traverseTo(key);
  };
}
// Intercept navigate events, such as link clicks, and
// replace them with single-page navigations
navigation.addEventListener("navigate", (event) => {
  event.intercept({
    async handler() {
      // Navigate to a different view,
      // but the "home" button will always work.
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
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
