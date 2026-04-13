---
title: "Navigation: phương thức reload()"
short-title: reload()
slug: Web/API/Navigation/reload
page-type: web-api-instance-method
browser-compat: api.Navigation.reload
---

{{APIRef("Navigation API")}}

Phương thức **`reload()`** của giao diện {{domxref("Navigation")}} tải lại URL hiện tại, cập nhật bất kỳ trạng thái nào được cung cấp trong danh sách mục lịch sử.

Lưu ý rằng `reload()` không kích hoạt [sự kiện `popstate`](/en-US/docs/Web/API/Window/popstate_event), vì sự kiện này chỉ được phát ra cho các điều hướng mềm gây ra "traversal" của các mục lịch sử.

## Cú pháp

```js-nolint
reload()
reload(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `state` {{optional_inline}}
      - : Thông tin do nhà phát triển định nghĩa để lưu trong {{domxref("NavigationHistoryEntry")}} liên quan sau khi điều hướng hoàn tất, có thể truy xuất qua {{domxref("NavigationHistoryEntry.getState", "getState()")}}.
        Đây có thể là bất kỳ kiểu dữ liệu nào. Ví dụ, bạn có thể muốn lưu số lượt truy cập trang cho mục đích phân tích, hoặc lưu chi tiết trạng thái UI để view có thể hiển thị chính xác như người dùng đã để lần cuối.
        Mọi dữ liệu lưu trong `state` phải là [có thể sao chép có cấu trúc](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).
    - `info` {{optional_inline}}
      - : Thông tin do nhà phát triển định nghĩa để truyền cùng với sự kiện {{domxref("Navigation/navigate_event", "navigate")}}, có sẵn trong {{domxref("NavigateEvent.info")}}.
        Đây có thể là bất kỳ kiểu dữ liệu nào. Ví dụ, bạn có thể muốn hiển thị nội dung được điều hướng đến với một animation khác nhau tùy thuộc vào cách nó được điều hướng tới (vuốt trái, vuốt phải, hoặc về trang chủ).
        Một chuỗi chỉ ra animation nào cần dùng có thể được truyền vào dưới dạng `info`.

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

## Ví dụ

### Sử dụng info và state

```js
async function handleReload() {
  await navigation.reload({
    info: { animation: "fade-in" },
    state: { infoPaneOpen: true },
  }).finished;

  // Update application state
  // …
}
```

Tải lại trang và thêm một mục trạng thái mới:

```js
async function handleReload() {
  await navigation.reload({
    state: { ...navigation.currentEntry.getState(), newState: 3 },
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
