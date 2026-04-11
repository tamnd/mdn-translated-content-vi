---
title: "Navigation: phương thức navigate()"
short-title: navigate()
slug: Web/API/Navigation/navigate
page-type: web-api-instance-method
browser-compat: api.Navigation.navigate
---

{{APIRef("Navigation API")}}

Phương thức **`navigate()`** của
giao diện {{domxref("Navigation")}} điều hướng đến một URL cụ thể, cập nhật bất kỳ trạng thái nào được cung cấp trong danh sách mục lịch sử.

## Cú pháp

```js-nolint
navigate(url)
navigate(url, options)
```

### Tham số

- `url`
  - : URL đích để điều hướng tới. Lưu ý rằng khi gọi `navigate()` trên đối tượng `navigation` của một cửa sổ khác, URL sẽ được giải quyết tương đối với URL của cửa sổ đích, không phải URL của cửa sổ gọi. Điều này khớp với hành vi của [History API](/en-US/docs/Web/API/History_API), nhưng không khớp với hành vi của [Location API](/en-US/docs/Web/API/Location). Cũng lưu ý rằng URL `javascript:` không được phép vì lý do bảo mật.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `state` {{optional_inline}}
      - : Thông tin do nhà phát triển định nghĩa để lưu trong {{domxref("NavigationHistoryEntry")}} liên quan sau khi điều hướng hoàn tất, có thể truy xuất qua {{domxref("NavigationHistoryEntry.getState", "getState()")}}. Đây có thể là bất kỳ kiểu dữ liệu nào. Ví dụ, bạn có thể muốn lưu số lượt truy cập trang cho mục đích phân tích, hoặc lưu chi tiết trạng thái UI để view có thể hiển thị chính xác như người dùng đã để lần cuối. Mọi dữ liệu lưu trong `state` phải là [có thể sao chép có cấu trúc](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).
    - `info` {{optional_inline}}
      - : Thông tin do nhà phát triển định nghĩa để truyền cùng với sự kiện {{domxref("Navigation/navigate_event", "navigate")}}, có sẵn trong {{domxref("NavigateEvent.info")}}. Đây có thể là bất kỳ kiểu dữ liệu nào. Ví dụ, bạn có thể muốn hiển thị nội dung được điều hướng đến với một animation khác nhau tùy thuộc vào cách nó được điều hướng tới (vuốt trái, vuốt phải, hoặc về trang chủ). Một chuỗi chỉ ra animation nào cần dùng có thể được truyền vào dưới dạng `info`.
    - `history` {{optional_inline}}
      - : Một giá trị liệt kê đặt hành vi lịch sử của điều hướng này. Các giá trị có sẵn là:
        - `auto`: Giá trị mặc định; thường thực hiện điều hướng `push` nhưng sẽ thực hiện điều hướng `replace` trong một số trường hợp đặc biệt (xem mô tả `NotSupportedError` bên dưới).
        - `push`: Sẽ đẩy một {{domxref("NavigationHistoryEntry")}} mới vào danh sách mục, hoặc thất bại trong một số trường hợp đặc biệt (xem mô tả `NotSupportedError` bên dưới).
        - `replace`: Sẽ thay thế {{domxref("NavigationHistoryEntry")}} hiện tại.

### Giá trị trả về

Một đối tượng với các thuộc tính sau:

- `committed`
  - : Một {{jsxref("Promise")}} sẽ được thực hiện khi URL hiển thị đã thay đổi và một {{domxref("NavigationHistoryEntry")}} mới đã được tạo.
- `finished`
  - : Một {{jsxref("Promise")}} sẽ được thực hiện khi tất cả các promise được trả về bởi trình xử lý `intercept()` đều được thực hiện. Điều này tương đương với promise {{domxref("NavigationTransition.finished")}} được thực hiện, khi sự kiện {{domxref("Navigation/navigatesuccess_event", "navigatesuccess")}} kích hoạt.

Một trong hai promise này sẽ bị từ chối nếu việc điều hướng thất bại vì lý do nào đó.

### Ngoại lệ

- `DataCloneError` {{domxref("DOMException")}}
  - : Được ném ra nếu tham số `state` chứa các giá trị không thể sao chép có cấu trúc.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu tài liệu hiện không hoạt động.
- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném ra nếu tham số `url` không phải là URL hợp lệ.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu:
    - Tùy chọn `history` được đặt thành `push`, và trình duyệt hiện đang hiển thị tài liệu `about:blank` ban đầu.
    - Lược đồ của `url` là `javascript`.

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

### Nút quay lại thông minh

Nút "quay lại" do trang cung cấp có thể đưa bạn trở lại, kể cả sau khi tải lại, bằng cách kiểm tra các mục lịch sử trước đó:

```js
backButtonEl.addEventListener("click", () => {
  if (
    navigation.entries()[navigation.currentEntry.index - 1]?.url ===
    "/product-listing"
  ) {
    navigation.back();
  } else {
    // If the user arrived here in some other way
    // e.g. by typing the URL directly:
    navigation.navigate("/product-listing", { history: "replace" });
  }
});
```

### Sử dụng info và state

```js
async function navigateHandler() {
  await navigation.navigate(url, {
    info: { animation: "swipe-right" },
    state: { infoPaneOpen: true },
  }).finished;

  // Update application state
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
