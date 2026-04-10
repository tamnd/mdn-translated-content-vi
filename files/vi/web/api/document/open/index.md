---
title: "Document: phương thức open()"
short-title: open()
slug: Web/API/Document/open
page-type: web-api-instance-method
browser-compat: api.Document.open
---

{{APIRef("DOM")}}

Phương thức **`Document.open()`** mở một tài liệu để {{domxref("Document.write", "ghi", "", "1")}}.

Điều này đi kèm với một số tác dụng phụ. Ví dụ:

- Tất cả trình lắng nghe sự kiện hiện đang được đăng ký trên tài liệu, các nút bên trong tài liệu, hoặc cửa sổ của tài liệu sẽ bị xóa.
- Tất cả các nút hiện có sẽ bị xóa khỏi tài liệu.

## Cú pháp

```js-nolint
open()
```

### Tham số

Không có.

### Giá trị trả về

Một instance đối tượng `Document`.

## Ví dụ

Đoạn mã đơn giản sau mở tài liệu và thay thế nội dung của nó bằng một số đoạn HTML khác nhau, trước khi đóng lại.

```js
document.open();
document.write("<p>Hello world!</p>");
document.write("<p>I am a fish</p>");
document.write("<p>The number is 42</p>");
document.close();
```

## Ghi chú

Một lệnh gọi `document.open()` tự động xảy ra khi {{domxref("document.write()")}} được gọi sau khi trang được tải.

### Bảo mật nội dung

Phương thức này tuân thủ [same-origin policy](/en-US/docs/Web/Security/Defenses/Same-origin_policy) giống như các thuộc tính khác, và không hoạt động nếu làm như vậy sẽ thay đổi nguồn gốc của tài liệu.

### document.open() ba đối số

Có một phiên bản `document.open()` ba đối số ít được biết đến và ít được sử dụng, là bí danh của {{domxref("Window.open()")}} (xem trang của nó để biết đầy đủ chi tiết).

Lệnh gọi này, ví dụ mở github.com trong cửa sổ mới, với opener được đặt thành `null`:

```js
document.open("https://www.github.com", "", "noopener=true");
```

### document.open() hai đối số

Các trình duyệt từng hỗ trợ `document.open()` hai đối số, với chữ ký sau:

```js
document.open(type, replace);
```

Trong đó `type` chỉ định kiểu MIME của dữ liệu bạn đang ghi (ví dụ: `text/html`) và replace nếu được đặt (tức là, một chuỗi `"replace"`) chỉ định rằng mục lịch sử cho tài liệu mới sẽ thay thế mục lịch sử hiện tại của tài liệu đang được ghi.

Biểu mẫu này hiện đã lỗi thời; nó sẽ không ném lỗi, nhưng thay vào đó chỉ chuyển tiếp đến `document.open()` (tức là tương đương với việc chạy nó mà không có đối số). Hành vi thay thế lịch sử hiện luôn xảy ra.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document")}}
- {{domxref("Window.open()")}}
