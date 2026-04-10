---
title: "History: phương thức pushState()"
short-title: pushState()
slug: Web/API/History/pushState
page-type: web-api-instance-method
browser-compat: api.History.pushState
---

{{APIRef("History API")}}

Phương thức **`pushState()`** của giao diện {{domxref("History")}} thêm một mục vào ngăn xếp lịch sử phiên của trình duyệt.

## Cú pháp

```js-nolint
pushState(state, unused)
pushState(state, unused, url)
```

### Tham số

- `state`
  - : Đối tượng `state` là một đối tượng JavaScript được liên kết với mục lịch sử mới do `pushState()` tạo ra. Bất cứ khi nào người dùng điều hướng tới `state` mới này, một sự kiện {{domxref("Window/popstate_event", "popstate")}} sẽ được kích hoạt, và thuộc tính `state` của sự kiện sẽ chứa một bản sao của đối tượng `state` của mục lịch sử đó.

    Đối tượng `state` có thể là bất cứ thứ gì có thể được tuần tự hóa.

    > [!NOTE]
    > Một số trình duyệt lưu các đối tượng `state` xuống đĩa của người dùng để có thể khôi phục chúng sau khi người dùng khởi động lại trình duyệt, đồng thời áp đặt giới hạn kích thước lên biểu diễn đã tuần tự hóa của đối tượng `state`, và sẽ ném ngoại lệ nếu bạn truyền vào một đối tượng `state` có biểu diễn đã tuần tự hóa vượt quá giới hạn đó. Vì vậy, trong những trường hợp bạn muốn bảo đảm có nhiều không gian hơn mức mà một số trình duyệt có thể áp đặt, bạn nên sử dụng {{domxref("Window.sessionStorage", "sessionStorage")}} và/hoặc {{domxref("Window.localStorage", "localStorage")}}.

- `unused`
  - : Tham số này tồn tại vì lý do lịch sử, và không thể bị bỏ qua; truyền một chuỗi rỗng là an toàn trước các thay đổi trong tương lai của phương thức.

- `url` {{optional_inline}}
  - : URL của mục lịch sử mới. Lưu ý rằng trình duyệt sẽ không cố tải URL này ngay sau khi gọi `pushState()`, nhưng có thể sẽ cố tải nó sau đó, chẳng hạn sau khi người dùng khởi động lại trình duyệt. URL mới không cần là tuyệt đối; nếu là tương đối, nó sẽ được phân giải tương đối theo URL hiện tại. URL mới phải có cùng {{glossary("origin")}} với URL hiện tại; nếu không, `pushState()` sẽ ném ra ngoại lệ. Nếu tham số này không được chỉ định, nó sẽ được đặt thành URL hiện tại của tài liệu.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu tài liệu liên kết chưa hoàn toàn hoạt động, hoặc nếu tham số `url` được cung cấp không phải là URL hợp lệ, hoặc nếu phương thức được gọi quá thường xuyên.
- `DataCloneError` {{domxref("DOMException")}}
  - : Được ném ra nếu tham số `state` được cung cấp không thể tuần tự hóa.

## Mô tả

Ở một khía cạnh nào đó, việc gọi `pushState()` tương tự như đặt `window.location = "#foo"`, ở chỗ cả hai đều tạo và kích hoạt một mục lịch sử khác gắn với tài liệu hiện tại. Nhưng `pushState()` có một vài ưu điểm:

- URL mới có thể là bất kỳ URL nào cùng origin với URL hiện tại. Trái lại, việc đặt {{domxref("window.location")}} chỉ giữ bạn ở cùng tài liệu nếu bạn chỉ thay đổi phần hash.
- Việc thay đổi URL của trang là tùy chọn. Trái lại, việc đặt `window.location = "#foo";` chỉ tạo một mục lịch sử mới nếu hash hiện tại không phải là `#foo`.
- Bạn có thể liên kết dữ liệu tùy ý với mục lịch sử mới. Với cách tiếp cận dựa trên hash, bạn cần mã hóa mọi dữ liệu liên quan vào một chuỗi ngắn.

Lưu ý rằng `pushState()` không bao giờ khiến sự kiện {{domxref("Window/hashchange_event", "hashchange")}} được kích hoạt, ngay cả khi URL mới chỉ khác URL cũ ở phần hash.

## Ví dụ

Ví dụ sau tạo một mục lịch sử mới của trình duyệt bằng cách đặt _state_ và _url_.

### JavaScript

```js
const state = { page_id: 1, user_id: 5 };
const url = "hello-world.html";

history.pushState(state, "", url);
```

### Thay đổi một tham số truy vấn

```js
const url = new URL(location);
url.searchParams.set("foo", "bar");
history.pushState({}, "", url);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Làm việc với History API](/en-US/docs/Web/API/History_API/Working_with_the_History_API)
- [Sự kiện Window: popstate](/en-US/docs/Web/API/Window/popstate_event)
