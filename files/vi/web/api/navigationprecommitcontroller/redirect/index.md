---
title: "NavigationPrecommitController: phương thức redirect()"
short-title: redirect()
slug: Web/API/NavigationPrecommitController/redirect
page-type: web-api-instance-method
browser-compat: api.NavigationPrecommitController.redirect
---

{{APIRef("Navigation API")}}

Phương thức **`redirect()`** của giao diện {{domxref("NavigationPrecommitController")}} chuyển hướng trình duyệt đến một URL được chỉ định và xác định hành vi lịch sử cùng bất kỳ thông tin trạng thái nào mong muốn.

## Cú pháp

```js-nolint
redirect(url, options)
```

### Tham số

- `url`
  - : URL để chuyển hướng đến.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn, các thuộc tính của nó có thể bao gồm:
    - `state` {{optional_inline}}
      - : Chứa bất kỳ thông tin trạng thái nào bạn muốn truyền cùng với điều hướng; ví dụ: cho mục đích ghi log hoặc theo dõi. Điều này có thể được đại diện bởi bất kỳ loại giá trị nào. Trạng thái cho điều hướng có thể được lấy sau đó qua phương thức {{domxref("NavigationHistoryEntry.getState()")}} của mục lịch sử kết quả.
    - `history` {{optional_inline}}
      - : Một giá trị liệt kê chỉ định cách chuyển hướng này nên được thêm vào lịch sử điều hướng. Nó có thể nhận một trong các giá trị sau:
        - `auto`
          - : Giá trị mặc định, cho phép trình duyệt quyết định cách xử lý:
            - Nếu điều hướng gốc xảy ra do lệnh gọi {{domxref("Navigation.navigate()")}}, giá trị sẽ là bất cứ điều gì được chỉ định trong tùy chọn [`history`](/en-US/docs/Web/API/Navigation/navigate#history) của lệnh gọi `navigate()`.
            - Nếu không, giá trị được sử dụng thường là `push`, nhưng sẽ trở thành `replace` nếu chuyển hướng trỏ đến cùng URL với URL trước điều hướng.
        - `push`
          - : Thêm một {{domxref("NavigationHistoryEntry")}} mới vào lịch sử điều hướng và xóa bất kỳ điều hướng về phía trước khả dụng nào (nghĩa là nếu người dùng trước đó đã điều hướng đến các vị trí khác, sau đó sử dụng nút quay lại để trở về qua lịch sử trước khi khởi tạo điều hướng gây ra chuyển hướng).
        - `replace`
          - : Thay thế {{domxref("Navigation.currentEntry")}} bằng `NavigationHistoryEntry` mới kết quả.

> [!NOTE]
> Phương thức `redirect()` có thể chuyển đổi hành vi lịch sử giữa `auto`, `push` và `replace`, nhưng nó không thể chuyển đổi điều hướng `traverse` thành điều hướng `push`/`replace` và ngược lại.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu:
    - {{domxref("NavigateEvent")}} khởi tạo không được chặn.
    - {{domxref("NavigateEvent.navigationType")}} không phải là `push` hoặc `replace`.
- `SyntaxError` {{domxref("DOMException")}}
  - : Được ném nếu `url` được chỉ định không hợp lệ.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném nếu tài liệu hiện tại không thể viết lại URL của nó thành `url` chuyển hướng được cung cấp.

## Ví dụ

Xem trang {{domxref("NavigationPrecommitController")}} chính để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Modern client-side routing: the Navigation API](https://developer.chrome.com/docs/web-platform/navigation-api/)
