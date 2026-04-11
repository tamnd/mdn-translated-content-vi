---
title: "Navigation: phương thức updateCurrentEntry()"
short-title: updateCurrentEntry()
slug: Web/API/Navigation/updateCurrentEntry
page-type: web-api-instance-method
browser-compat: api.Navigation.updateCurrentEntry
---

{{APIRef("Navigation API")}}

Phương thức **`updateCurrentEntry()`** của giao diện {{domxref("Navigation")}} cập nhật `state` của {{domxref("Navigation.currentEntry","currentEntry")}}; được dùng trong các trường hợp thay đổi trạng thái sẽ độc lập với một điều hướng hoặc tải lại.

## Cú pháp

```js-nolint
updateCurrentEntry(options)
```

### Tham số

- `options`
  - : Một đối tượng tùy chọn chứa các thuộc tính sau:
    - `state`
      - : Thông tin do nhà phát triển định nghĩa để lưu trong {{domxref("NavigationHistoryEntry")}} liên quan sau khi điều hướng hoàn tất, có thể truy xuất qua {{domxref("NavigationHistoryEntry.getState", "getState()")}}. Đây có thể là bất kỳ kiểu dữ liệu nào. Ví dụ, bạn có thể muốn lưu số lượt truy cập trang cho mục đích phân tích, hoặc lưu chi tiết trạng thái UI để view có thể hiển thị chính xác như người dùng đã để lần cuối. Mọi dữ liệu lưu trong `state` phải là [có thể sao chép có cấu trúc](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm).

### Giá trị trả về

Không có (`undefined`).

### Ngoại lệ

- `DataCloneError` {{domxref("DOMException")}}
  - : Được ném ra nếu tham số `state` chứa các giá trị không thể sao chép có cấu trúc.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("Navigation.currentEntry")}} là `null`, tức là không có mục lịch sử hiện tại. Ví dụ, điều này có thể xảy ra nếu trang hiện tại là `about:blank`.

## Ví dụ

Bạn có thể dùng code tương tự như sau để cập nhật trạng thái mở/đóng của phần tử {{htmlelement("details")}} để trạng thái có thể được khôi phục khi tải lại trang hoặc điều hướng trở lại từ nơi khác.

```js
detailsElem.addEventListener("toggle", () => {
  navigation.updateCurrentEntry({ state: { detailOpen: detailsElem.open } });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
- [Navigation API explainer](https://github.com/WICG/navigation-api/blob/main/README.md)
