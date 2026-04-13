---
title: "History: phương thức replaceState()"
short-title: replaceState()
slug: Web/API/History/replaceState
page-type: web-api-instance-method
browser-compat: api.History.replaceState
---

{{APIRef("History API")}}

Phương thức **`replaceState()`** của giao diện {{domxref("History")}} sửa đổi mục lịch sử hiện tại, thay thế nó bằng đối tượng trạng thái và URL được truyền trong các tham số của phương thức. Phương thức này đặc biệt hữu ích khi bạn muốn cập nhật đối tượng trạng thái hoặc URL của mục lịch sử hiện tại để phản hồi một hành động nào đó của người dùng.

## Cú pháp

```js-nolint
replaceState(state, unused)
replaceState(state, unused, url)
```

### Tham số

- `state`
  - : Một đối tượng được liên kết với mục lịch sử được truyền vào phương thức `replaceState()`. Đối tượng trạng thái có thể là `null`.
- `unused`
  - : Tham số này tồn tại vì lý do lịch sử, và không thể bị bỏ qua; truyền chuỗi rỗng là cách làm truyền thống và an toàn trước các thay đổi trong tương lai của phương thức.
- `url` {{optional_inline}}
  - : URL của mục lịch sử. URL mới phải có cùng origin với URL hiện tại; nếu không, phương thức `replaceState()` sẽ ném ra ngoại lệ.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu tài liệu liên kết chưa hoàn toàn hoạt động, hoặc nếu tham số `url` được cung cấp không phải là URL hợp lệ, hoặc nếu phương thức được gọi quá thường xuyên.
- `DataCloneError` {{domxref("DOMException")}}
  - : Được ném ra nếu tham số `state` được cung cấp không thể tuần tự hóa.

## Ví dụ

Giả sử `https://www.mozilla.org/foo.html` thực thi JavaScript sau:

```js
const stateObj = { foo: "bar" };
history.pushState(stateObj, "", "bar.html");
```

Trên trang kế tiếp, bạn có thể dùng `history.state` để truy cập `stateObj` vừa được thêm vào.

Giải thích của hai dòng lệnh trên có thể được tìm thấy trong bài viết [Làm việc với History API](/en-US/docs/Web/API/History_API/Working_with_the_History_API#using_pushstate). Sau đó giả sử `https://www.mozilla.org/bar.html` thực thi JavaScript sau:

```js
history.replaceState(stateObj, "", "bar2.html");
```

Điều này sẽ khiến thanh URL hiển thị `https://www.mozilla.org/bar2.html`, nhưng sẽ không khiến trình duyệt tải `bar2.html` hay thậm chí kiểm tra xem `bar2.html` có tồn tại hay không.

Giờ giả sử người dùng điều hướng đến `https://www.microsoft.com`, sau đó nhấn nút Back. Lúc này, thanh URL sẽ hiển thị `https://www.mozilla.org/bar2.html`. Nếu người dùng nhấn Back thêm một lần nữa, thanh URL sẽ hiển thị `https://www.mozilla.org/foo.html`, hoàn toàn bỏ qua `bar.html`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
